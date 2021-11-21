const pool = require('./connection').pool;



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

module.exports = {
	getDiscussions,
}

