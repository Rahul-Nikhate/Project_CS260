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


var AppNo,Username,Department,Position,
F_Name,M_Name,L_Name,DOB,Gender,Nationality,ID_type,
ID_no,Category,Email,Mobile_no,Add_l1,Add_l2,City,State,Pincode
;

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
    let Emailt=req.body.Email;
    let Password=req.body.Password;
    query = 'Select * from applications WHERE Email="'+Emailt+'" AND Password="'+Password+'";'
    db.query(query,function(err,result,field){
        if(result.length>0){
            AppNo = result[0].Application_Number;
            Username=result[0].Username;
            Department = result[0].Department;
            Position = result[0].Post;
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
    Username = req.body.Username;
    let email = req.body.Email;
    let password = req.body.Password;
    let RePassword = req.body.RePassword;
    Department = req.body.Department;
    Position = req.body.Position;
    if(password === RePassword){
        query = 'INSERT INTO applications (Email,Password,Post,Department,Username) VALUES ("' + email + '","' + password + '","' + Position + '","' + Department + '","' + Username + '");';
        db.query(query,function(err,result,fields){
            if(err) throw err;
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


//Form Page 1 <--------------------------------------------------------->

app.get("/form1",function(req,res){
    query = 'SELECT * FROM personal_info WHERE Application_Number = "' + AppNo + '";';
    db.query(query,function(err,result,field){
        if(result.length>0){
            F_Name = result[0].First_Name;
            M_Name = result[0].Middle_Name;
            L_Name = result[0].Last_Name;
            DOB = result[0].DOB;
            Gender = result[0].Gender;
            Nationality = result[0].Nationality;
            ID_type = result[0].ID_type;
            ID_no = result[0].ID_number;
            Category = result[0].Category;
            Email = result[0].Email;
            Mobile_no = result[0].MobileNumber;
            Add_l1 = result[0].AddressLine1;
            Add_l2 = result[0].AddressLine2;
            City = result[0].City;
            State = result[0].State;
            Pincode = result[0].Pincode;
        }
    });
    res.redirect("/form1f");
});

app.get("/form1f",function(req,res){
    res.render("form1",{Username:Username,AppNo:AppNo,F_Name : F_Name,M_Name:M_Name,L_Name:L_Name,DOB:DOB,Gender:Gender,Nationality:Nationality,ID_type:ID_type,
        ID_no:ID_no,Category:Category,Email:Email,Mobile_no:Mobile_no,Add_l1:Add_l1,Add_l2:Add_l2,City:City,State:State,Pincode:Pincode,Department:Department,Position:Position});
});

app.post("/form1f",function(req,res){
    F_Name = req.body.F_Name;
    M_Name = req.body.M_Name;
    L_Name = req.body.L_Name;
    DOB = req.body.DOB;
    Gender = req.body.Gender;
    Nationality = req.body.Nationality;
    ID_type = req.body.ID_type;
    ID_no = req.body.ID_no;
    Category = req.body.Category;
    Email = req.body.Email;
    Mobile_no = req.body.Mobile_no;
    Add_l1 = req.body.Add_l1;
    Add_l2 = req.body.Add_l2;
    City = req.body.City;
    State = req.body.State;
    Pincode = req.body.Pincode;
    Department = req.body.Department;
    Position = req.body.Position;
    query = 'DELETE FROM personal_info WHERE Application_Number = "' + AppNo + '";';
    db.query(query,function(err,result,field){});
    query = 'INSERT INTO personal_info VALUES ("'+ AppNo + '","'  + F_Name + '","' + M_Name + '","' + L_Name + '","' + DOB + '","' + Gender + '","' + 
            Nationality + '","' + ID_type + '","' + ID_no + '","' + Category + '","' + Email + '","' + Mobile_no + '","' + Add_l1 + '","' + Add_l2 + '","' + City + '","' + State + '","' + Pincode + '");';
    db.query(query,function(err,result,field){});
    query= 'UPDATE applications SET Department = "'+Department+'", Post = "'+Position+'" WHERE Application_Number = "'+AppNo+'";';
    db.query(query,function(err,result,field){
    });
    res.redirect("/form2");
});

//<---------------------------------------------------------------------->

//Form Page 2 <---------------------------------------------------------->

app.get("/form2",function(req,res){

});

app.get("/form2f",function(req,res){

});

app.post("/form2f",function(req,res){

});

//<----------------------------------------------------------------------->

app.listen(3000, () => {
    console.log("The app start on http://localhost:3000");
});