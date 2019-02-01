var express = require('express')

app = express()

port = process.env.PORT || 43774

mongoose = require('mongoose')

User = require('./api/models/user')

bodyParser = require('body-parser')

mongoose.Promise = global.Promise
mongoose.connect('mongodb://localhost/msgdb')
app.use(bodyParser.urlencoded({ extended: true }))
app.use(bodyParser.json({ type: 'application/*+json' }))
var routes = require('./api/routes/userRoute')
routes(app)
app.listen(port)
console.log('PASTEL2')