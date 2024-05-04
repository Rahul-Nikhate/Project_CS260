const path = require('path');
const express = require('express'); 
const ejs = require("express");
const app = express();
const mysql = require("mysql2");
const { fuchsia } = require('color-name');

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



let AppNo;



app.get("/",function(req,res){
    res.render("index");
});

app.post("/index",function(req,res){

    // query = 'SELECT * FROM info WHERE '
    Email=req.body.Email;
    Password=req.body.Password;
    query = 'Select Application_Number from applications WHERE Email="'+EMail+'" AND Password="'+Password+'";'
    db.query(query,function(err,result,field){
        if(result[0].length>0){
            AppNo = res[0];
            res.redirect("/form1");
        }
        else{
            throw err;
        }
    });

});

app.get("/form1",function(req,res){
    res.redirect("/form1f");
});

app.get("/form1f",function(req,res){
    res.render("form1");
});

app.listen(3000, () => {
    console.log("The app start on http://localhost:3000");
});