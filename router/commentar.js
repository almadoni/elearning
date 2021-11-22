const pool = require('./connection').pool;



const getCommentars = (req, res) => {

        pool.query('select * from commentar', (error, results) =>{
          if(error){
             res.status(200).json({code: "9999", result: error})
             throw error
          }

         // res.status(200).json(results.rows)

	 console.log("Commentars :"+results.rows.length)

         if(results.rows.length > 0){		
	  res.status(200).json({code: "9200", result: results.rows})	
	 }else{
	   res.status(200).json({code: "9999", result: "Error"})
	 }

        })
}

const getComments = (req, res) => {

        discussion_id = req.params.discussion_id;

        pool.query('select * from commentar where discussion_id = $1',[discussion_id], (error, results) =>{
          if(error){
             res.status(200).json({code: "9999", result: error})
             throw error
          }

         console.log("Commentars :"+results.rows.length)

         if(results.rows.length > 0){
           res.status(200).json({code: "9200", result: results.rows})
         }else{
           res.status(200).json({code: "9999", result: "Error"})
         }

        })
}



const addComment = (req, res) =>{
	console.log(req.body);
        const {discussion_id, user_id, comment} = req.body;
        pool.query("INSERT INTO commentar (discussion_id, user_id, comment) values ($1, $2, $3)",
                [discussion_id, user_id, comment], (error, results) =>{
                if(error){
		   res.status(200).json({code: "9999", result: error});
                   throw error
                }
                res.status(200).json({code: "9200", result: "OK"});
        })
}


module.exports = {
	getCommentars,
	getComments,
	addComment
}

