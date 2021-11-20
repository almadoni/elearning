//const http = require('http');
const express = require('express');
const bodyParser = require('body-parser');

const login = require('./router/login');
const db = require('./router/queries');
const data_materi = require('./router/materi');

const app = express();
const hostname = '127.0.0.1';
const port = 3000;

const hbs = require('hbs')
const session = require('express-session');

const {engine} = require('express-handlebars');

app.set('view engine', 'hbs');
app.engine('hbs', engine({
    layoutsDir: __dirname + '/views',
    extname: 'hbs',
    defaultLayout: 'planB',
    partialsDir: __dirname + '/views/partials/'
}));

app.use(session({
  secret: 'secret', //plaese change session id
  resave: true,
  saveUninitialized: true
}));

app.use(bodyParser.json())
app.use(
	bodyParser.urlencoded({
		extended: true,
	})
)

/*
app.get('/', (req, res) =>{
	res.json({info: 'API E-Learning'});
})
*/

app.use('/assets',express.static(__dirname + '/public'));


app.get('/', (req, res) => {
// Using the index.hbs file instead of planB

  if (req.session.loggedin) {
    console.log("star /....")
    res.render('main', {
    layout: 'index',
    page1: true,
    // dateFormat: dateFormat,
    username: req.session.username,
    fullname: req.session.fullname,
    now: new Date()});

  } else {
    res.redirect('login');
  }
});


app.use('/', login);

app.get('/api/users', db.getUsers)
app.post('/api/login', db.login)
app.post('/api/adduser', db.createUser)
app.post('/api/register', db.register)
app.put('/api/updateuser/:fcmid/:id', db.updateUser)

//for materi
app.get('/api/materies/:id', data_materi.getMateries)

app.listen(port, hostname, () => {
  console.log(`Server running at http://${hostname}:${port}/`);
});
