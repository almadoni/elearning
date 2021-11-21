const pool = require('./connection').pool;

const express = require('express');

const router = express.Router();

router.get('/list_comment', (req, res) =>{

	pool.query('select * from commentar order by id', (error, results) =>{
          if(error){
             throw error
          }

          res.render('main',{
		layout: 'index',
		username: req.session.username,
		list_comment: true,
		data: results.rows
	  });

        });


});

module.exports = router
