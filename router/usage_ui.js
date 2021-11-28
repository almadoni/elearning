const pool = require('./connection').pool;

const express = require('express');

const router = express.Router();

router.get('/list_usage', (req, res) =>{

	pool.query("select a.*, to_char(create_date, 'Day, DD HH12:MI:SS') as created_date,b.fullname from usage_history a left join accounts b on (a.user_id = b.id) order by created_date desc", (error, results) =>{
          if(error){
             throw error
          }

          res.render('main',{
		layout: 'index',
		username: req.session.username,
		list_usage: true,
		data: results.rows
	  });

        });


});

module.exports = router;


