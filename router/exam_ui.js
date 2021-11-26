const pool = require('./connection').pool;

const express = require('express');

const router = express.Router();

router.get('/list_exam', (req, res) =>{

	pool.query('select a.id as exam_id, a.name as name_exam, b.name as name_materi, b.create_date from exam a left join materi b on (a.materi_id = b.id)', (error, results) =>{
          if(error){
             throw error
          }

          res.render('main',{
		layout: 'index',
		username: req.session.username,
		list_exam: true,
		data: results.rows
	  });

        });


});

router.get('/list_exam_detail/:examId', (req, res) =>{
	examId = req.params.examId
        pool.query('select * from question where exam_id = $1',[examId], (error, results) =>{
          if(error){
             throw error
          }

          res.render('main',{
                layout: 'index',
                username: req.session.username,
                list_exam_detail: true,
		is_admin: true,
                data: results.rows
          });

        });


});


module.exports = router
