const path = require('path');
const express = require('express'); 
const ejs = require("express");
const app = express();
const mysql = require("mysql2");
const bodyParser = require("body-parser");
const notifier = require('node-notifier');

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
app.use(bodyParser.urlencoded({extended:true}));


var AppNo;


app.get("/",function(req,res){
    res.render("index");
});

app.post("/",function(req,res){

    // query = 'SELECT * FROM info WHERE '
    let Email=req.body.Email;
    let Password=req.body.Password;
    query = 'Select Application_Number from applications WHERE Email="'+Email+'" AND Password="'+Password+'";'
    db.query(query,function(err,result,field){
        if(result.length>0){
            AppNo = result[0];
            res.redirect("/form1");
        }
        else{
            notifier.notify({
                title : "Alert",
                message: "Incorrect Email or Password"
            });
            res.redirect("/");
        }
    });
    // console.log(Email);
    // res.redirect("/");
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