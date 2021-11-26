const pool = require('./connection').pool;


const getExams = (req, res) => {
	(async ()=> {
		jsonRst = {code: "9200", result: "", total_data: 0}
		const exam_list = await exams();

		var dataList = [];

		for (var i=0; i<exam_list.rows.length; i++){
			examId = exam_list.rows[i].id;
			const question_list = await question(examId);
			dataQuestion = []
			for (var q=0; q<question_list.rows.length; q++){
				qId = question_list.rows[q].id;
				qName = question_list.rows[q].name;
				const answerList = await answers(qId);
				questionValue = {id: qId, name: qName, answers: answerList.rows, total_answer : answerList.rows.length}
				dataQuestion.push(questionValue)
			}

			dataExam = {exam_id : examId, questions: dataQuestion}
		

			dataList.push(dataExam);
		}
		jsonRst.result = dataList;
		jsonRst.total = dataList.length;
		res.status(200).json(jsonRst);
	})();
       
}

async function question(examId){
 	const sql = 'select * from question where exam_id = $1';
	return pool.query(sql,[examId]);
}

async function answers(questionId){
	const sql = 'select * from answer where question_id = $1';
	return pool.query(sql,[questionId]);
}

async function exams(){
	const sql = 'select * from exam';
	return pool.query(sql);
}

async function exam(materiId){
	//const sql = 'select * from exam a left join materi b on (a.materi_id = b.id) where b.id = $1';
	const sql = 'select b.* from materi a left join exam b on (a.id = b.materi_id) where a.id = $1';
	return pool.query(sql,[materiId]);
}

async function getPoin(userId, examId){
	const sql = 'select * from poin_exam where user_id = $1 and exam_id = $2 and status = 0';
	return pool.query(sql, [userId, examId]);
}

async function getPoinExam(examId, answerId){
	//const sql = 'select * from poin_exam where exam_id = $1 and answer_id = $2';
	const sql = 'select a.* from poin_exam_detail a left join poin_exam b on (a.poin_exam_id = b.id) where b.exam_id = $1 and b.user_id = $2 and b.status = 0 and a.answer_id = $2';
	return pool.query(sql,[examId, answerId]);
}

async function setPoinExam(userId, examId){
	const uniqId = (new Date()).getTime().toString(36);
	const sql = 'INSERT into poin_exam (user_id, exam_id, score, status, transaction_number) values($1, $2, 0, 0,$3) returning id';
	return pool.query(sql, [userId, examId, uniqId]);
}

async function setPoinExamDetail(examId, answerId, answerOptionId, isTrue){
	const sql = 'INSERT into poin_exam_detail (poin_exam_id, answer_id, answer, istrue) values ($1, $2, $3, $4)';
	return pool.query(sql,[examId, answerId, answerOptionId, isTrue]);
}

async function getAnswer(id){
	const sql = 'select option_answer from answer where id = $1';
	return pool.query(sql,[id]);
}

async function updatePoinExamDetail(poinExamId, answerId, isTrue, answer){
	const sql = 'update poin_exam_detail set answer = $3, istrue = $4 where poin_exam_id = $1 and answer_id = $2 ';
	return pool.query(sql,[poinExamId, answerId, answer, isTrue]);
}

async function updatePoinExamScore(userId, examId, score){
	const sql = 'update poin_exam set score = $3, status=1 where user_id = $1 and exam_id = $2'; 
       	return pool.query(sql, [userId, examId, score]);
}

async function getTotalQuestion(examId){
	console.log("examId : "+examId);
	const sql = 'select count(*) as total from question where exam_id = $1';
	return pool.query(sql, [examId]);
}

async function getTotalAnswerExam(examId, userId){
	const sql = "select count(a.*) as total from poin_exam_detail a left join poin_exam b on (a.poin_exam_id = b.id)  where b.exam_id = $1 and b.user_id = $2 and a.istrue and b.status = 0";
	console.log(sql);
	return pool.query(sql, [examId, userId]);
}

const getScore = (req, res) =>{
	const {userId, examId} = req.params;

	(async ()=>{
		console.log("get Score");
		console.log(req.params);

		jsonRst = {code: "9200", result:""}

		const totalQuestion = await getTotalQuestion(examId);
		const totalAnswerExam = await getTotalAnswerExam(examId, userId);
	        
		console.log(totalQuestion.rows);
		console.log(totalAnswerExam.rows);

		console.log("Total Qest "+totalQuestion.rows[0].total);
		console.log("Total Ans " +totalAnswerExam.rows[0].total);

		var currTotalQst = totalQuestion.rows[0].total;
		var currTotalAExam = totalAnswerExam.rows[0].total;
		var score = (currTotalAExam/currTotalQst)*100;
                console.log("update poin exam score : "+score);
		const updateScore = await updatePoinExamScore(userId, examId, score);
		jsonRst.result = {score: score}

		res.status(200).json(jsonRst);
		
	})();

}

const getExam = (req, res) =>{
	
	(async ()=>{
		materiId = req.params.materiId;
		console.log("getExam with materi id "+materiId);
		const ex = await exam(materiId);
		if(ex.rows.length > 0){
			examId = ex.rows[0].id;
			const question_list = await question(examId);
                        dataQuestion = []
                        for (var q=0; q<question_list.rows.length; q++){
                                qId = question_list.rows[q].id;
                                qName = question_list.rows[q].name;
                                const answerList = await answers(qId);
                                data = {id: qId, name: qName, answers: answerList.rows[0]}
				dataQuestion.push(data);
                        }

       			res.status(200).json({code: "9200", result: dataQuestion});

		}
	})();

}

const savePoinExam = (req, res) =>{	
	const {userId, examId, answerId, answerOption} = req.body;

	(async ()=> {
		console.log("save exam");
		console.log(req.body);

		jsonRst = {code: "9200", result: ""};

		const p = await getPoin(userId, examId);
		//check apakah trx poin nya ada yg lagi jalan
		console.log("start poin with check get poin");
		console.log(p.rows);
		
		var isiPoin = p.rows.length;
                console.log("total isi "+isiPoin);
		
		if(isiPoin == 0){
		    //todo insert poin exam and poin exam detail
		    console.log("1. start save poin...");
		    const insertPoin = await setPoinExam(userId, examId);
			
		    const answer = await getAnswer(answerId); //harus check query
                        var isAnswerTrue = false;
                        if(answer.rows.length > 0){
                             console.log("open answer"+ answer.rows[0].option_answer);
                             console.log("jawaban "+answerOption);
                             isAnswerTrue = answer.rows[0].option_answer == answerOption;
                        }
		    const idInsetPoinExam = insertPoin.rows[0].id

		    console.log("2. start save poin detail... with id : "+ idInsetPoinExam)	
		    const insertPoinExamDetail = await setPoinExamDetail(idInsetPoinExam, answerId, answerOption, isAnswerTrue);
                    console.log(insertPoinExamDetail.rows);
	
		    console.log("response id : " + insertPoin.rows[0].id);
		    jsonRst.code = "9200";
		    jsonRst.result = insertPoin.rows[0].id;
		}else{
		    console.log("3. lanjut kan update poin detail");	
		    console.log("update id "+p.rows[0].id);
		    //todo update
	            //1. check poin examp detail 
		    pei = p.rows[0].id;
		    const checkDetail = await getPoinExam(pei, answerId);
		    console.log(checkDetail.rows);
		    //2. insert or update
		    if(checkDetail.rows.length > 0){		
			console.log("start poin exam detail...");
			const answer = await getAnswer(answerId); //harus check query
                        var isAnswerTrue = false;
                        if(answer.rows.length > 0){
                             console.log("open answer"+ answer.rows[0].option_answer);
                             console.log("jawaban "+answerOption);
                             isAnswerTrue = answer.rows[0].option_answer == answerOption;
                        }
			console.log("4. update poin exam detail...");
			const updatePExamDetail = await updatePoinExamDetail(pei, answerId, isAnswerTrue, answerOption);
			console.log("4. done update "+updatePExamDetail.rows);
		    }else{			
			console.log("5. insert poin exam detail");
			const answer = await getAnswer(answerId); //harus check query
			var isAnswerTrue = false;
			if(answer.rows.length > 0){
			     console.log("open answer"+ answer.rows[0].option_answer);
			     console.log("jawaban "+answerOption);
			     isAnswerTrue = answer.rows[0].option_answer == answerOption;
			}
			//var poinId = checkDetail.rows[0].poin_exam_id;    
			const insertPoinExamDetail = await setPoinExamDetail(pei, answerId, answerOption, isAnswerTrue);
			console.log("5. done insert");
			console.log(insertPoinExamDetail.rows);    
		    }
		    jsonRst.result = "update id:"+p.rows[0].id;
		}

		res.status(200).json(jsonRst);
	})();
}

module.exports = {
  savePoinExam,
  getExams,
  getExam,
  getScore
}
