const pool = require('./connection').pool;

const login = (req, res) => {
	console.log(req.body);
	const {username, password} = req.body;

	pool.query('select * from accounts where username=$1 and password=$2',[username, password], (error, results) =>{
          if(error){
             console.log("Result :"+error);
	     throw error
	  }
         
	 console.log("Total :"+results.rows.length)

         if(results.rows.length > 0){		
	  res.status(200).json({code: "9200", result: results.rows[0]})	
	 }else{
	   res.status(200).json({code: "9999", result: "Error"})
	 }

	})
}

const getUsers = (req, res) => {

        pool.query('select * from accounts', (error, results) =>{
          if(error){
             throw error
          }

          res.status(200).json(results.rows)

        })
}

const createUser = (req, res) =>{
	const {username, password, fullname, email, mhs_id, fcm_id} = req.body;
	pool.query("INSERT INTO accounts (username, password, fullname, email, mahasiswa_id, firebase_id) values ($1, $2, $3, $4, $5, $6)",
		[username, password, fullname, email, mhs_id, fcm_id], (error, results) =>{
		if(error){
		   throw error
		}	
		res.status(201).send(`User added with ID ${results.insertId}`);
	})
}

const register = (req, res) =>{
	console.log(req.body);
        const {username, password, fullname, email, nomahasiswa} = req.body;
        pool.query("INSERT INTO accounts (username, password, fullname, email, mahasiswa_id) values ($1, $2, $3, $4, $5)",
                [username, password, fullname, email, nomahasiswa], (error, results) =>{
                if(error){
		   res.status(200).json({code: "9999", result: error});	
                   throw error
                }
                res.status(200).json({code: "9200", result: "OK"});
        })
}


const updateUser = (req, res) =>{
	const id = req.params.id;
	const fcm_id = req.params.fcmid;

	pool.query("UPDATE accounts set firebase_id =$1 WHERE id = $2", [id, fcm_id], (error, results) =>{
		if(error){
		   throw error
		}
		res.status(200).json({result: "OK"})
	})
}


module.exports = {
	login,
	getUsers,
	createUser,
	updateUser,
	register,
}
