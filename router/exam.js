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
	const sql = 'select * from exam a left join materi b on (a.materi_id = b.id) where b.id = $1';
	return pool.query(sql,[materiId]);
}

async function getPoin(userId, examId){
	const sql = 'select * from poin_exam where user_id = $1 and exam_id = $2 and status = 0';
	return pool.query(sql, [userId, examId]);
}

async function getPoinExam(examId, answerId){
	const sql = 'select * from poin_exam_detail where poin_exam_id = $1 and answer_id = $2';
	return pool.query(sql,[examId, answerId]);
}

async function setPoinExam(userId, examId){
	const sql = 'INSERT into poin_exam (user_id, exam_id, score, status) values($1, $2, 0, 0) returning id';
	return pool.query(sql, [userId, examId]);
}

const getExam = (req, res) =>{
	(async ()=>{
		materiId = req.params.materiId;
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
		jsonRst = {code: "9999", result: ""};

		const p = await getPoin(userId, examId);
		//check apakah trx poin nya ada yg lagi jalan
		if(p.rows.length == 0){
		    //todo insert poin exam and poin exam detail
		    const insertPoin = await setPoinExam(userId, examId);
		    console.log("response id : " + insertPoin.rows[0].id);
		    jsonRst.code = "9200";
		    jsonRst.result = insertPoin.rows[0].id;
		}else{
		    console.log("update id "+p.rows[0].id);
		    //todo update
	            //1. check poin examp detail 
		    pei = p.rows[0].id;
		    const checkDetail = await getPoinExam(pei, answerId);
		    console.log(checkDetail.rows);
		    //2. insert or update
		    jsonRst.result = "update id:"+p.rows[0].id;
		}

		res.status(200).json(jsonRst);
	})();
}

module.exports = {
  savePoinExam,
  getExams,
  getExam	
}
