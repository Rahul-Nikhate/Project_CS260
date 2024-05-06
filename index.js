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


var AppNo,Username,Department,Position;

//Sign IN Page <----------------------------------------------------------------------------->

app.get("/",function(req,res){
    res.render("index");
});

app.post("/",function(req,res){
    let SignUp = req.body.SignUp;
    if(SignUp == "SignUp"){
        res.redirect("/SignUp");
        return;
    }
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
});

//<------------------------------------------------------------------->


//Sign UP <----------------------------------------------------------->

app.get("/SignUp",function(req,res){
    res.render("signup")
});

app.post("/SignUp",function(req,res){
    let SignIn = req.body.SignIn;
    if(SignIn == "SignIn"){
        res.redirect("/");
        return;
    }
    Username = req.body.Username;
    let email = req.body.Email;
    let password = req.body.Password;
    let RePassword = req.body.RePassword;
    Department = req.body.Department;
    Position = req.body.Position;
    if(password === RePassword){
        query = 'INSERT INTO applications (Email,Password,Post,Department,Username) VALUES ("' + email + '","' + password + '","' + Position + '","' + Department + '","' + Username + '";';
        db.query(query,function(err,result,fields){
        });
        res.redirect("/");
        return;
    }
    else{
        notifier.notify({
            title : "Alert",
            message: "The Re-entered Password does not match"
        });
        res.redirect("/SignUp");
        return;
    }
});

//<-------------------------------------------------------------------->

app.get("/form1",function(req,res){
    res.redirect("/form1f");
});

app.get("/form1f",function(req,res){
    res.render("form1");
});

app.listen(3000, () => {
    console.log("The app start on http://localhost:3000");
});