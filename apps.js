const http = require('http');
const express = require('express');
const bodyParser = require('body-parser');

const db = require('./router/queries');
const data_materi = require('./router/materi');

const app = express();
const hostname = '127.0.0.1';
const port = 3000;

app.use(bodyParser.json())
app.use(
	bodyParser.urlencoded({
		extended: true,
	})
)

app.get('/', (req, res) =>{
	res.json({info: 'API E-Learning'});
})

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
