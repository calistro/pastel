import express from 'express'
import mongoose from'mongoose'
import bodyParser from 'body-parser'
import routes from './api/routes/userRoute'
import gameRoute from './api/routes/gameRoutes'
import graphlHTTP from 'express-graphql'
import schema from './api/schemas/userSchema'

export const app = express()

const port = process.env.PORT || 3000

mongoose.Promise = global.Promise
mongoose.connect('mongodb://localhost/msgdb')
app.use('/graphql', graphlHTTP({
    schema: schema,
    graphiql: true
}))
app.use(bodyParser.urlencoded({ extended: true }))
app.use(bodyParser.json({ type: 'application/json' }))
routes(app)
gameRoute(app)
app.listen(port)
console.log('PASTEL2')