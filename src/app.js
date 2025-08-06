const express = require('express')

const app  = express()
app.use(express.json())

app.use('/', (request, response)=>{
return response.json("Olá!")
});

app.listen(3000, ()=> console.log("Api rodando"))