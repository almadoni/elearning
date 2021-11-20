const express = require('express');

const router = express.Router();

//const pg = require('pg');
//var geoip = require('geoip-lite');

//const ipLocation = require("iplocation");

//const pool = new pg.Pool({
//	user: 'almadoni',
//	host: '127.0.0.1',
//	database: 'alumni_mankobar',
//	password: 'doni',
///	port: '5432'
//});
//

const pool = require('./connection').pool;

router.post('/login/auth', (reg, res) =>{
  console.log('start user auth ....')
  const {username, password} = reg.body;

  const sql = "select * from accounts where (username=$1 or email=$1) and password=$2";
  
  console.log("username : "+username);
  console.log("password : "+password);
  
  const query = pool.query(sql, [username, password], (err, results) => {
    if(err) throw err;
    console.log(results.rows);

    console.log("length is : "+results.rows.length);

    currId = 0
    if(results.rows.length > 0){
      currId = results.rows[0].id
    }
    var utcDateString = new Date(new Date().toUTCString()).toISOString();
    console.log("Date utc : "+utcDateString)
    console.log("id is :"+currId)
    date = new Date()
    console.log("current date : "+date)
    const query = pool.query('update accounts set last_login=$2 where id=$1;'
      ,[currId, date],(error, result) =>{
      console.log("success upload last login")
    });

    if(results.rows.length > 0){
      reg.session.loggedin = true;
      reg.session.username = results.rows[0].email;
      reg.session.fullname = results.rows[0].fullname;
      reg.session.userid = results.rows[0].id
      reg.session.status = results.rows[0].status
      res.redirect('../')  
    }else{
      res.render('login', {
        layout: 'login',
        message: 'User salah password salah' 
      });    
    }
    
  }); 

});

router.get('/login', (reg, res) =>{
  console.log("date : "+ new Date())

  var ip = reg.headers['x-forwarded-for'] || 
     reg.connection.remoteAddress || 
     reg.socket.remoteAddress ||
     reg.connection.socket.remoteAddress;

  console.log("client ip : "+ip)
 
  //var geo = geoip.lookup(ip);
 
  //console.log(geo);
  
  console.log('view login...');
  reg.session.loggedin = false; 
  res.render('login', {
    layout: 'login' 
  });
});
  

router.get('/logout', (reg, res) =>{
  console.log('view logout...');
  reg.session.destroy(); 
  res.render('login', {
    layout: 'login' 
  }); 
});
  
module.exports = router;

