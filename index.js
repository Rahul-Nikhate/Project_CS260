const path = require('path');
const express = require('express'); 
const ejs = require("express");
const app = express();
const mysql = require("mysql2");

const db = mysql.createConnection({
    host: 'localhost',
    database: 'faculty_recruitment',
    user: 'root',
    password: 'Pass@123'
});

db.connect(function(error){
    if(error){
        throw error;
    }
    else{
        console.log("Database connected");
    }
});

app.use(express.static("public"));

app.set('views', path.join(__dirname, 'views'));
app.set('view engine', 'ejs');

app.get("/",function(req,res){
    res.render("index");
});

app.listen(3000, () => {
    console.log(`The app start on http://localhost:3000`);
});