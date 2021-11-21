const pool = require('./connection').pool;

const express = require('express');

const router = express.Router();

router.get('/list_discussion', (req, res) =>{

	pool.query('select * from discussion order by id', (error, results) =>{
          if(error){
             throw error
          }

          res.render('main',{
		layout: 'index',
		username: req.session.username,
		list_discussion: true,
		data: results.rows
	  });

        });


});

module.exports = router
