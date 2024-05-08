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
F_Name,M_Name,L_Name,DOB,Gender,Nationality,ID_type,ID_no,Category,Email,Mobile_no,Add_l1,Add_l2,City,State,Pincode,
phd_uni,phd_Dept,phd_sn,phd_dos,phd_yoj,phd_title,
pg_uni,pg_deg,pg_bra,pg_yoj,pg_yoc,pg_dur,pg_per,pg_div,
ug_uni,ug_deg,ug_bra,ug_yoj,ug_yoc,ug_dur,ug_per,ug_div,
add_uni=[],add_deg=[],add_bra=[],add_yoj=[],add_yoc=[],add_dur=[],add_per=[],add_div=[],cnt_ae = 0,
Eh_Position=[],Eh_Organisation,Eh_DOJ,Eh_DOL,EmpHis,
Rs_Name=[],Rs_Degree,Rs_Title,Rs_Status,Rs_DOS,Rs_DOC,ResSup,
Aw_Name=[],Aw_Presentor,Aw_Year,Aw,
Rso_Name=[],Rso_Status,Rso
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
            DOB = DOB.toISOString().split("T")[0];
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

function queryDB(sql) {
    return new Promise((resolve, reject) => {
        db.query(sql,function(err, result, fields) {
            if (err) {
                reject(err);
            } else {
                resolve(result);
            }
        });
    });
}

app.get("/form2", async function(req,res){

    try{
        const PhDr = await queryDB('SELECT * FROM phd WHERE Application_Number = "' + AppNo + '";');
        if(PhDr.length>0){
            phd_uni=PhDr[0].University;
            phd_Dept = PhDr[0].Department;
            phd_sn = PhDr[0].Supervisior_Name;
            phd_dos = PhDr[0].Date_Of_Success;
            phd_dos = phd_dos.toISOString().split("T")[0];
            phd_yoj = PhDr[0].Year_Of_Joining;
            phd_title = PhDr[0].Title;
        }

        const pgr = await queryDB('SELECT * FROM pg WHERE Application_Number = "' + AppNo + '";');
        if(pgr.length>0){
            pg_uni=pgr[0].University;
            pg_deg=pgr[0].Degree;
            pg_bra=pgr[0].Branch;
            pg_yoj=pgr[0].Year_Of_Joining;
            pg_yoc=pgr[0].Year_Of_Completion;
            pg_dur=pgr[0].Duration;
            pg_per=pgr[0].Percentage;
            pg_div=pgr[0].Division;
        }

        const ugr = await queryDB('SELECT * FROM ug WHERE Application_Number = "' + AppNo + '";');
        if(ugr.length>0){
            ug_uni=ugr[0].University;
            ug_deg=ugr[0].Degree;
            ug_bra=ugr[0].Branch;
            ug_yoj=ugr[0].Year_Of_Joining;
            ug_yoc=ugr[0].Year_Of_Completion;
            ug_dur=ugr[0].Duration;
            ug_per=ugr[0].Percentage;
            ug_div=ugr[0].Division;
        }

        const aedur = await queryDB('SELECT * FROM edu_add WHERE Application_Number = "' + AppNo + '";');
        if(aedur.length>0){
            cnt_ae = aedur.length;
            add_uni=[];add_deg=[];add_bra=[];add_yoj=[];add_yoc=[];add_dur=[];add_per=[];add_div=[];
            for(let i =0;i<aedur.length;i++){
                add_uni[i]=aedur[i].University;
                add_deg[i]=aedur[i].Degree;
                add_bra[i]=aedur[i].Branch;
                add_yoj[i]=aedur[i].Year_Of_Joining;
                add_yoc[i]=aedur[i].Year_Of_Completion;
                add_dur[i]=aedur[i].Duration;
                add_per[i]=aedur[i].Percentage;
                add_div[i]=aedur[i].Division;
            }
        }

        res.redirect("/form2f");

    }
    catch(error){
        console.error("Error fetching data:", error);
    }

});

app.get("/form2f",function(req,res){
    res.render("form2",{Username:Username,AppNo:AppNo,
        phd_uni:phd_uni,phd_Dept:phd_Dept,phd_sn:phd_sn,phd_dos:phd_dos,phd_yoj:phd_yoj,phd_title:phd_title,
        pg_uni:pg_uni,pg_deg:pg_deg,pg_bra:pg_bra,pg_yoj:pg_yoj,pg_yoc:pg_yoc,pg_dur:pg_dur,pg_per:pg_per,pg_div:pg_div,
        ug_uni:ug_uni,ug_deg:ug_deg,ug_bra:ug_bra,ug_yoj:ug_yoj,ug_yoc:ug_yoc,ug_dur:ug_dur,ug_per:ug_per,ug_div:ug_div,
        add_uni:add_uni,add_deg:add_deg,add_bra:add_bra,add_yoj:add_yoj,add_yoc:add_yoc,add_dur:add_dur,add_per:add_per,add_div:add_div,cnt_ae:cnt_ae
    });
});

app.post("/form2f",function(req,res){
    phd_uni = req.body.phd_uni;
    phd_Dept = req.body.phd_Dept;
    phd_sn = req.body.phd_sn;
    phd_dos = req.body.phd_dos;
    phd_yoj = req.body.phd_yoj;
    phd_title = req.body.phd_title;

    pg_uni=req.body.pg_uni;
    pg_deg=req.body.pg_deg;
    pg_bra=req.body.pg_bra;
    pg_yoj=req.body.pg_yoj;
    pg_yoc=req.body.pg_yoc;
    pg_dur=req.body.pg_dur;
    pg_per=req.body.pg_per;
    pg_div=req.body.pg_div;

    ug_uni=req.body.ug_uni;
    ug_deg=req.body.ug_deg;
    ug_bra=req.body.ug_bra;
    ug_yoj=req.body.ug_yoj;
    ug_yoc=req.body.ug_yoc;
    ug_dur=req.body.ug_dur;
    ug_per=req.body.ug_per;
    ug_div=req.body.ug_div;

    add_uni=req.body.add_uni;
    add_deg=req.body.add_deg;
    add_bra=req.body.add_bra;
    add_yoj=req.body.add_yoj;
    add_yoc=req.body.add_yoc;
    add_dur=req.body.add_dur;
    add_per=req.body.add_per;
    add_div=req.body.add_div;

    query = 'DELETE FROM phd WHERE Application_Number = "' + AppNo + '";';
    db.query(query,function(err,result,field){});

    query = 'INSERT INTO phd VALUES ("'+AppNo +'","'+ phd_Dept +'","'+ phd_uni+'","'+phd_sn+'","'+phd_yoj+'","'+phd_dos+'","'+phd_title+'");';
    db.query(query,function(err,result,field){
    });

    query = 'DELETE FROM pg WHERE Application_Number = "' + AppNo + '";';
    db.query(query,function(err,result,field){});

    query = 'INSERT INTO pg VALUES ("'+AppNo +'","'+ pg_uni +'","'+ pg_deg +'","'+ pg_bra +'","'+ pg_yoj +'","'+ pg_yoc +'","'+ pg_dur +'","'+ pg_per +'","'+ pg_div+'");';
    db.query(query,function(err,result,field){});

    query = 'DELETE FROM ug WHERE Application_Number = "' + AppNo + '";';
    db.query(query,function(err,result,field){});

    query = 'INSERT INTO ug VALUES ("'+AppNo +'","'+ ug_uni +'","'+ ug_deg +'","'+ ug_bra +'","'+ ug_yoj +'","'+ ug_yoc +'","'+ ug_dur +'","'+ ug_per +'","'+ ug_div+'");';
    db.query(query,function(err,result,field){});

    query = 'DELETE FROM edu_add WHERE Application_Number = "' + AppNo + '";';
    db.query(query,function(err,result,field){});

    // console.log(add_uni.length);
    let nf = 0;
    if(add_uni !== undefined) nf = add_uni.length;
    for(let i = 0;i<nf;i++){

        query = 'INSERT INTO edu_add VALUES ("'+AppNo +'","'+ add_uni[i] +'","'+ add_deg[i] +'","'+ add_bra[i] +'","'+ add_yoj[i] +'","'+ add_yoc[i] +'","'+ add_dur[i] +'","'+ add_per[i] +'","'+ add_div[i]+'");';
        db.query(query,function(err,result,field){});

    }
    

    res.redirect("/form3");
});

//<----------------------------------------------------------------------->

//Form Page 3 <---------------------------------------------------------->
app.get("/form3",function(req,res){
    Promise.all([
        new Promise((resolve, reject) => {
            query = 'SELECT * FROM employment_history WHERE Application_Number = "' + AppNo + '";';
            db.query(query,function(err,result,field){
                if(result==undefined){
                    EmpHis=[];
                }
                else{
                    EmpHis=result;
                }
                resolve();
            });
        }),
        new Promise((resolve, reject) => {
            query = 'SELECT * FROM research_supervision WHERE Application_Number = "' + AppNo + '";';
            db.query(query,function(err,result,field){
                if(result==undefined){
                    ResSup=[];
                }
                else{
                    ResSup=result;
                }
                resolve();
            });
        }),
        new Promise((resolve, reject) => {
            query = 'SELECT * FROM awards WHERE Application_Number = "' + AppNo + '";';
            db.query(query,function(err,result,field){
                if(result==undefined){
                    Aw=[];
                }
                else{
                    Aw=result;
                }
                resolve();
            });
        }),
        new Promise((resolve, reject) => {
            query = 'SELECT * FROM professional_society WHERE Application_Number = "' + AppNo + '";';
            db.query(query,function(err,result,field){
                if(result==undefined){
                    Rso=[];
                }
                else{
                    Rso=result;
                }
                resolve();
            });
        })
    ]).then(() => {
        res.redirect("/form3f");
    });
});


app.get("/form3f",function(req,res){
    res.render("form3",{AppNo:AppNo,Username:Username,EmpHis:EmpHis,ResSup:ResSup,Aw:Aw,Rso:Rso});

});

app.post("/form3f",function(req,res){
    Eh_Position=req.body.Eh_Position;
    Eh_Organisation=req.body.Eh_Organisation;
    Eh_DOJ=req.body.Eh_DOJ;
    Eh_DOL=req.body.Eh_DOL;
    Rs_Name =req.body.Rs_Name;
    Rs_Degree =req.body.Rs_Degree;
    Rs_Title =req.body.Rs_Title;
    Rs_Status =req.body.Rs_Status;
    Rs_DOC =req.body.Rs_DOC;
    Rs_DOS =req.body.Rs_DOS;
    Aw_Name =req.body.Aw_Name;
    Aw_Presentor =req.body.Aw_Presentor;
    Aw_Year =req.body.Aw_Year;
    Rso_Name =req.body.Rso_Name;
    Rso_Status =req.body.Rso_Status;
    query = 'DELETE FROM employment_history WHERE Application_Number = "' + AppNo + '";';
    db.query(query,function(err,result,field){});

    let cnt = 0;
    if(Eh_Position !== undefined) cnt = Eh_Position.length;
    for(let i=0; i<cnt;i++){
        query = 'INSERT INTO employment_history VALUES ("'+AppNo+'","'+Eh_Position[i]+'","'+Eh_Organisation[i]+'","'+Eh_DOJ[i]+'","'+Eh_DOL[i]+'");';
        db.query(query,function(err,result,field){});
    }

    
    query = 'DELETE FROM research_supervision WHERE Application_Number = "' + AppNo + '";';
    db.query(query,function(err,result,field){});
    let cnt2=0;
    if(Rs_Name !== undefined) cnt2 = Rs_Name.length;
    for(let i=0; i<cnt2;i++){
        query = 'INSERT INTO research_supervision VALUES ("'+AppNo+'","'+Rs_Name[i]+'","'+Rs_Degree[i]+'","'+Rs_Title[i]+'","'+Rs_Status[i]+'","'+Rs_DOS[i]+'","'+Rs_DOC[i]+'");';
        db.query(query,function(err,result,field){});
    }
    query = 'DELETE FROM awards WHERE Application_Number = "' + AppNo + '";';
    db.query(query,function(err,result,field){});
    let cnt3=0;
    if(Aw_Name !== undefined) cnt3 = Aw_Name.length;
    for(let i=0; i<cnt3;i++){
        query = 'INSERT INTO awards VALUES ("'+AppNo+'","'+Aw_Name[i]+'","'+Aw_Presentor[i]+'","'+Aw_Year[i]+'");';
        db.query(query,function(err,result,field){});
    }
    query = 'DELETE FROM professional_society WHERE Application_Number = "' + AppNo + '";';
    db.query(query,function(err,result,field){});
    let cnt4=0;
    if(Rso_Name !== undefined) cnt4 = Rso_Name.length;
    for(let i=0; i<cnt4;i++){
        query = 'INSERT INTO professional_society VALUES ("'+AppNo+'","'+Rso_Name[i]+'","'+Rso_Status[i]+'");';
        db.query(query,function(err,result,field){});
    }
    res.redirect("/form1");
});

// ------------------------------------------------------------

app.listen(3000, () => {
    console.log("The app start on http://localhost:3000");
});