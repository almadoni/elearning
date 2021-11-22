const pool = require('./connection').pool;

//var sync = require('synchronize');

const getDiscussions = (req, res) => {

        pool.query('select * from discussion where actived = 0', (error, results) =>{
          if(error){
	     res.status(200).json({code: "9999", result: error})
             throw error
          }

          //res.status(200).json(results.rows)
          console.log("Total discussion :"+results.rows.length)

         if(results.rows.length > 0){		
	  res.status(200).json({code: "9200", result: results.rows})	
	 }else{
	   res.status(200).json({code: "9999", result: "Error"})
	 }


        })
}


const getDiscussionsWithComment = (req, res) => {


	(async () =>{
		var jsonRst = {code: "9200", result: ""}
		var dataArray = []
		
		const hasil = await getDiscussionList();
		
		for(var i=0; i<hasil.rows.length; i++){
		   diss = hasil.rows[i]		 
		   console.log("discussion id"+ diss.id);
	           const commentRst = await getCommentList(diss.id)
		   
		   dataArray.push({materi: diss.materi, data: commentRst.rows})
		}
		jsonRst.result = dataArray

		res.status(200).json(jsonRst);
	})();

	
	/*var query1 = sync.await(discussio);

	for(var i =0; i< query1.length; i++){
	   console.log("id : "+ query1[i].id);
	}*/

//	res.status(200).json(dataJson);
}

async function getDiscussionList(){
   const sql = 'select * from discussion where actived = 0';
   return pool.query(sql);
}

async function getCommentList(discussion_id){
	const sql = 'select * from commentar where discussion_id = $1';
	return pool.query(sql, [discussion_id]);
}


module.exports = {
	getDiscussions,
	getDiscussionsWithComment,
}

