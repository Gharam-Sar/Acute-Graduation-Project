const express = require("express");
const mysql = require("mysql2/promise");

let db = null;
const app = express();

app.use(express.json());

app.post('/create-user', async (req, res, next) => {

  const first_name = req.body.first_name;
  const last_name = req.body.last_name;
  const email = req.body.email;
  const password = req.body.password;
  const weight = req.body.weight;
  const height = req.body.height;
  const date_of_birth = req.body.date_of_birth;
  const activity_level = req.body.activity_level;
  const gender = req.body.gender;  
  const goal = req.body.goal;
console.log(goal);
  await db.query("INSERT INTO acute_users (`first_name`, `last_name`, `email`, `password`, `weight`, `height`, `date_of_birth`, `activity_level`, `gender`, `authentication`, `goal`, `user_level`) VALUES (?,?,?,?,?,?,?,?,?,0,?,0);", [first_name, last_name, email, password, weight, height, date_of_birth, activity_level, gender,goal]);
 res.json({ status: "OK" });
  next();
});


app.post('/user-info', async (req, res, next) => {
  const id = req.body.id;
  const dis1 = req.body.dis1;
  const dis2 = req.body.dis2;
  const dis3 = req.body.dis3;
  const dis4 = req.body.dis4;
  const dis5 = req.body.dis5;
  const dis6 = req.body.dis6;
  const dis7 = req.body.dis7;
  const dis8 = req.body.dis8;
  const dis9 = req.body.dis9;
  const dis10 = req.body.dis10;
  await db.query("INSERT INTO `users_diseases`(`Heart Diseases`, `Gastrointestinal Diseases`, `Anemia`, `Kidney and urinary tract Diseases`, `Diabetes`, `Low or high blood pressure`, `Eyes illnesses`, `Goitre`, `Cancerous Diseases`, `Dermal Diseases`, `user_id`) VALUES (?,?,?,?,?,?,?,?,?,?,?);", [dis1, dis2, dis3, dis4, dis5, dis6, dis7, dis8, dis9, dis10, id]);
  res.json({ status: "OK" });
  next();
});
app.post('/setmeal', async (req, res, next) => {

  const user_id = req.body.user_id;
  const food_id = req.body.food_id;
  const meal_index = req.body.meal_index;
  const time = req.body.time;
  const amount = req.body.amount;
  await db.query("INSERT INTO `eaten_meals` (`user_id`, `food_id`, `meal_index`, `time`,`amount`) VALUES (?,?,?,?,?);", [user_id, food_id, meal_index, time, amount]);

  res.json({ status: "OK" });
  next();
});
app.post('/goal', async (req, res, next) => {
  const id = req.body.id;
  const goal = req.body.goal;
  await db.query("UPDATE `acute_users` SET `goal`= (?) WHERE `user_id`= (?);", [goal, id]);


  res.json({ status: "OK" });
  next();
});
app.get('/ID', async (req, res, next) => {
  const text = req.url;
  const myArray = text.split("%22");

  const first_name = myArray[3];
  const last_name = myArray[7];
  const email = myArray[11];


  const [rows] = await db.query("SELECT `user_id` FROM `acute_users` WHERE `first_name`= (?) and `last_name`= (?) and `email`=(?);", [first_name, last_name, email]);
  var str = JSON.stringify(rows[0]);

  const n = str.split(":");

  const n2 = n[1].split("}");

  res.json(n2[0]);
  const id = n2[0];
  next();
});

app.post('/userfeedback', async (req, res, next) => {
  const id = req.body.id;
  const feedback = req.body.feedback;
  await db.query("INSERT INTO `feedback`(`id`, `feedback`) VALUES (?,?);", [id, feedback]);


  res.json({ status: "OK" });
  next();
});

app.post('/change-auth', async (req, res, next) => {
  const id = req.body.id;
  const auth = req.body.auth;
  await db.query("UPDATE `acute_users` SET `authentication`= (?) WHERE `user_id`= (?);", [auth, id]);


  res.json({ status: "OK" });
  next();
});

app.post('/change-account', async (req, res, next) => {
  const id = req.body.id;
  const firstname = req.body.firstname;
  const lastname = req.body.lastname;
  const email = req.body.email;
  const date = req.body.date;
  await db.query("UPDATE `acute_users` SET `first_name`= (?) , `last_name`= (?) , `email`= (?) , `date_of-birth`= (?) WHERE `user_id`= (?);", [firstname, lastname, email, date, id]);


  res.json({ status: "OK" });
  next();
});

app.post('/change-info', async (req, res, next) => {
  const id = req.body.id;
  const gender = req.body.gender;
  const height = req.body.height;
  const weight = req.body.weight;
  const activity = req.body.activity;
  await db.query("UPDATE `acute_users` SET `gender`= (?) , `height`= (?) , `weight`= (?) , `activity_level`= (?) WHERE `user_id`= (?);", [gender, height, weight, activity, id]);


  res.json({ status: "OK" });
  next();
});

app.post('/change-disease', async (req, res, next) => {
  const id = req.body.id;
  const dis1 = req.body.dis1;
  const dis2 = req.body.dis2;
  const dis3 = req.body.dis3;
  const dis4 = req.body.dis4;
  const dis5 = req.body.dis5;
  const dis6 = req.body.dis6;
  const dis7 = req.body.dis7;
  const dis8 = req.body.dis8;
  const dis9 = req.body.dis9;
  const dis10 = req.body.dis10;
  await db.query("UPDATE `users_diseases` SET `Heart Diseases`= (?) , `Gastrointestinal Diseases`= (?) , `Anemia`= (?) , `Kidney and urinary tract Diseases`=(?), `Diabetes`= (?) , `Low or high blood pressure`= (?) , `Eyes illnesses`=(?), `Goitre`= (?) , `Cancerous Diseases`= (?) , `Dermal Diseases`= (?) WHERE `user_id`= (?);", [dis1, dis2, dis3, dis4, dis5, dis6, dis7, dis8, dis9, dis10, id]);

  res.json({ status: "OK" });
  next();
});

app.get('/userID', async (req, res, next) => {
  const text = req.url;
  const myArray = text.split("%22");

  const email = myArray[3].replaceAll("%20", "");
  const password = myArray[7];
  console.log(email);
  console.log(password);
  const [rows] = await db.query("SELECT `user_id` FROM `acute_users` WHERE  `email`=(?) and `password` = (?);", [ email, password]);
  var str = JSON.stringify(rows[0]);
  const n2 = " ";
  console.log(rows);
if(rows.length>0){const n = str.split(":");
console.log("jj");
  const n2 = n[1].split("}");

  res.json(n2[0]);
  const id = n2[0];}
 
  else  res.json(n2);
  
  next();
});

app.get('/userInfo', async (req, res, next) => {
  const text = req.url;
  const myArray = text.split("%22");

  const idd = myArray[3];

  const [rows] = await db.query("SELECT  * FROM `acute_users` WHERE `user_id` = (?);", [idd]);

  var str = JSON.stringify(rows[0]);

  const myArr = str.split(",");
  const firstname = myArr[1].split(":");
  const lastname = myArr[2].split(":");


  let t = firstname[1] + " " + lastname[1];
  let result = t.replaceAll("\"", "");
  res.json(result);


  next();
});

app.get('/waterinfo', async (req, res, next) => {
  const text = req.url;
  const myArray = text.split("%22");

  const idd = myArray[3];

  const [rows] = await db.query("SELECT  * FROM `acute_users` WHERE `user_id` = (?);", [idd]);

  var str = JSON.stringify(rows[0]);

  const myArr = str.split(",");

  const w = myArr[5].split(":");
  const ac_l = myArr[8].split(":");


  let t = w[1] + " " + ac_l[1];

  let result = t.replaceAll("\"", "");
  res.json(result);


  next();
});
app.get('/bodyinfo', async (req, res, next) => {
  const text = req.url;
  const myArray = text.split("%22");

  const idd = myArray[3];
console.log(idd);
  const [rows] = await db.query("SELECT  * FROM `acute_users` WHERE `user_id` = (?);", [idd]);

  var str = JSON.stringify(rows[0]);
if(rows.length>0){const myArr = str.split(",");
console.log(rows);
  const w = myArr[5].split(":");
  const h=myArr[6].split(":");
  const g=myArr[9].split(":");
  const n=myArr[1].split(":");
  let t = w[1] + " " + h[1]+" "+g[1]+ " "+n[1];

  let result = t.replaceAll("\"", "");
  res.json(result);}else res.json(" ");
  


  next();
});
app.post('/set_notif', async (req, res, next) => {
  const id = req.body.id;
  const pause = req.body.pause;
  const meal = req.body.meal;
  const water = req.body.water;
  const [rows] = await db.query("SELECT * FROM `notification` WHERE `user_id` = (?);", [id]);
  if(rows.length==0){
  await db.query("INSERT INTO `notification`(`user_id`, `pause_all`,`meals`,`water`) VALUES (?,?,?,?);", [id, pause,meal,water]);
  res.json({ status: "OK" });
  }
  next();
});
app.post('/change-notif', async (req, res, next) => {
  const id = req.body.id;
  const pause = req.body.pause;
  const meal = req.body.meal;
  const water = req.body.water;
  await db.query("UPDATE `notification` SET `pause_all`= (?) WHERE `user_id`= (?);", [pause, id]);
  await db.query("UPDATE `notification` SET `meals`= (?) WHERE `user_id`= (?);", [meal, id]);
  await db.query("UPDATE `notification` SET `water`= (?) WHERE `user_id`= (?);", [water, id]);
  res.json({ status: "OK" });
  next();
});

app.get('/get_notif', async (req, res, next) => {
  const text = req.url;
  const myArray = text.split("%22");

  const idd = myArray[3];

  const [rows] = await db.query("SELECT  * FROM `notification` WHERE `user_id` = (?);", [idd]);

  var str = JSON.stringify(rows[0]);
  let result;
  if(rows.length>0){
    const myArr = str.split(",");

    const pause = myArr[1].split(":");
    const meal = myArr[2].split(":");
    const water = myArr[3].split(":");
  
    let t = pause[1] + " " + meal[1]+ " " + water[1];
  
    result = t.replaceAll("\"", "");
    
    result = result.replaceAll("\}", "");
  }
 
  res.json(result);
  next();
});
app.get('/getimages', async (req, res, next) => {
  const text = req.url;
  const myArray = text.split("%22");

  const date = myArray[3];
  
  var date_ob = new Date();
  var day = ("0" + date_ob.getDate()).slice(-2);
  var month = ("0" + (date_ob.getMonth() + 1)).slice(-2);
  var year = date_ob.getFullYear();
  var date2 = year + "-" + month + "-" + day;
console.log(date);
  const [rows] = await db.query("SELECT * FROM `ads` WHERE `status`= 1;");
// console.log(rows);
  var str = JSON.stringify(rows[0]);
  let result=" ";
if(rows.length>0){
  //console.log(rows); 
  console.log(rows.length);
  for (let i = 0; i < rows.length; i++) {

 var str = JSON.stringify(rows[i]);

    const myArr = str.split(",");
    var temp=myArr[2].split(":\"");
    var temp2 = temp[1].replaceAll("\"}", "");
    var temp3=result;
     result=temp3+ temp2+ "linklinklink" ;
    
  
    
  }
  console.log(result);

  res.json(result);

}
  else res.json(" ");
  


  next();
});

app.get('/accountinfo', async (req, res, next) => {
  const text = req.url;
  const myArray = text.split("%22");

  const idd = myArray[3];

  const [rows] = await db.query("SELECT  * FROM `acute_users` WHERE `user_id` = (?);", [idd]);

  var str = JSON.stringify(rows[0]);

  const myArr = str.split(",");
  const firstname = myArr[1].split(":");
  const lastname = myArr[2].split(":");
  const email = myArr[3].split(":");
  const date = myArr[7].split(":");
  let t = firstname[1] + "&" + lastname[1] + "&" + email[1] + "&" + date[1];
  let result = t.replaceAll("\"", "");

  res.json(result);

  next();
});
app.get('/info', async (req, res, next) => {
  const text = req.url;
  const myArray = text.split("%22");

  const idd = myArray[3];

  const [rows] = await db.query("SELECT  * FROM `acute_users` WHERE `user_id` = (?);", [idd]);

  var str = JSON.stringify(rows[0]);

  const myArr = str.split(",");
  const gender = myArr[9].split(":");

  const height = myArr[6].split(":");
  const weight = myArr[5].split(":");
  const activity = myArr[8].split(":");

  let t = gender[1] + "&" + height[1] + "&" + weight[1] + "&" + activity[1];
  let result = t.replaceAll("\"", "");

  res.json(result);

  next();
});

app.get('/disease', async (req, res, next) => {
  const text = req.url;
  const myArray = text.split("%22");

  const idd = myArray[3];

  const [rows] = await db.query("SELECT  * FROM `users_diseases` WHERE `user_id` = (?);", [idd]);

  var str = JSON.stringify(rows);

  const myArr = str.split(",");
  const d1 = myArr[0].split(":");
  const d2 = myArr[1].split(":");
  const d3 = myArr[2].split(":");
  const d4 = myArr[3].split(":");
  const d5 = myArr[4].split(":");
  const d6 = myArr[5].split(":");
  const d7 = myArr[6].split(":");
  const d8 = myArr[7].split(":");
  const d9 = myArr[8].split(":");
  const d10 = myArr[9].split(":");

  let t = d1[1] + "&" + d2[1] + "&" + d3[1] + "&" + d4[1] + "&" + d5[1] + "&" + d6[1] + "&" + d7[1] + "&" + d8[1] + "&" + d9[1] + "&" + d10[1];
  let result = t.replaceAll("\"", "");

  res.json(result);

  next();
});

app.get('/check_email', async (req, res, next) => {
  const text = req.url;
  const myArray = text.split("%22");

  const email = myArray[3];

  const [rows] = await db.query("SELECT * FROM `acute_users` WHERE `email` = (?);", [email]);
  if(rows.length>0){
    res.json("no");  
  }
  else res.json("yes");

  next();
});

app.get('/userauth', async (req, res, next) => {
  const text = req.url;
  const myArray = text.split("%22");

  const idd = myArray[3];

  const [rows] = await db.query("SELECT `authentication` FROM `acute_users` WHERE `user_id` = (?);", [idd]);
if(rows.length>0){var str = JSON.stringify(rows[0]);

  const auth = str.split(":");

  //      let t = firstname[1] +" "+ lastname[1];
  let result = auth[1].replaceAll("\}", "");
  res.json(result);}
  else res.json(" ");
  


  next();
});
app.get('/getgoal', async (req, res, next) => {
  const text = req.url;
  const myArray = text.split("%22");

  const idd = myArray[3];

  const [rows] = await db.query("SELECT `goal` FROM `acute_users` WHERE `user_id` = (?);", [idd]);

  var str = JSON.stringify(rows[0]);

  const goal = str.split(":");

  let result = goal[1].replaceAll("\}", "");
  res.json(result);


  next();
});
app.get('/userpassword', async (req, res, next) => {
  const text = req.url;
  const myArray = text.split("%22");

  const idd = myArray[3];

  const [rows] = await db.query("SELECT `password` FROM `acute_users` WHERE `user_id` = (?);", [idd]);

  var str = JSON.stringify(rows[0]);

  const password = str.split(":");


  let result = password[1].replaceAll("\}", "");
  res.json(result);


  next();
});
app.post('/change-password', async (req, res, next) => {
  const id = req.body.id;
  const password = req.body.password;
  await db.query("UPDATE `acute_users` SET `password`= (?) WHERE `user_id`= (?);", [password, id]);

  res.json({ status: "OK" });
  next();
});

app.get('/food', async (req, res, next) => {
  const text = req.url;
  const myArray = text.split("%22");
  let t = "";
  let result = "";
  let result2 = "";
  const [rows] = await db.query("SELECT  * FROM `foods`");
  var len = rows.length
  for (let i = 0; i < len; i++) {

    var str = JSON.stringify(rows[i]);

    const myArr = str.split(",");
    const foodid = myArr[0].split(":");
    const foodname = myArr[1].split(":");
    const calories = myArr[2].split(":");
    const carbohydrates = myArr[3].split(":");
    const dietary = myArr[4].split(":");
    const fats = myArr[5].split(":");
    const vitamins = myArr[6].split(":");
    const sodium = myArr[7].split(":");
    const proteins = myArr[8].split(":");
    const sugar = myArr[9].split(":");
    const cholesterol = myArr[10].split(":");
    const calcuim = myArr[11].split(":");
    const iron = myArr[12].split(":");
    const potassium = myArr[13].split(":");
    const magnesium = myArr[14].split(":");
    const zinc = myArr[15].split(":");
    t = t + foodid[1] + "," + foodname[1] + "," + calories[1] + "," + carbohydrates[1] + "," + dietary[1] + "," + fats[1]
      + "," + vitamins[1] + "," + sodium[1] + "," + proteins[1] + "," + sugar[1] + "," + cholesterol[1] + "," + calcuim[1] + "," + iron[1]
      + "," + potassium[1] + "," + magnesium[1] + "," + zinc[1] + "&";
  }
  result = t.replaceAll("\}", "");
  result2 = result.replaceAll("\"", "");
  res.json(result2);


  next();
});
app.get('/usermeals', async (req, res, next) => {
  const text = req.url;
  const myArray = text.split("%22");

  const idd = myArray[3];

  let t = "";
  let result = "";
  let result2 = "";

  const [rows] = await db.query("SELECT  * FROM `eaten_meals` WHERE `user_id` = (?);", [idd]);
  var len = rows.length
  for (let i = 0; i < len; i++) {

    var str = JSON.stringify(rows[i]);

    const myArr = str.split(",");
    const food_id = myArr[2].split(":");
    const meal_index = myArr[3].split(":");
    const time = myArr[4].split(":");
    const amount = myArr[5].split(":");
    t = t + food_id[1] + "^" + meal_index[1] + "^" + time[1] + "^" + amount[1] + "&";

  }
  result = t.replaceAll("\}", "");
  result2 = result.replaceAll("\"", "");

  res.json(result2);
  next();
});


app.get('/getmealname', async (req, res, next) => {
  const text = req.url;
  const myArray = text.split("%22");

  const idd = myArray[3];

  const [rows] = await db.query("SELECT * FROM `foods` WHERE `food_id` = (?);", [idd]);

  var str = JSON.stringify(rows[0]);
  const myArr = str.split(",");
  const food_name = myArr[1].split(":");
  const calorie = myArr[2].split(":");
  let t = food_name[1] + "^" + calorie[1];
  let result = t.replaceAll("\"", "");

  res.json(result);
  next();
});
app.get('/getcholestrol', async (req, res, next) => {
  const text = req.url;
  const myArray = text.split("%22");

  const idd = myArray[3];

  const [rows] = await db.query("SELECT * FROM `foods` WHERE `food_id` = (?);", [idd]);
  let result;
  if(rows.length>0){
  var str = JSON.stringify(rows[0]);
  const myArr = str.split(",");
  const cholesterol = myArr[10].split(":");
  const protein = myArr[8].split(":");
  const sugar = myArr[9].split(":");
  const sodium = myArr[7].split(":");
  let t = cholesterol[1] + "^" + protein[1] + "^"+sugar[1]+"^"+sodium[1];
   result = t.replaceAll("\"", "");
  }
  else  result="nn";
  console.log(result);
  res.json(result);
  next();
});

app.post('/timers_meals', async (req, res, next) => {
  const id = req.body.id;
  const meal1 = req.body.meal1;
  const timer1 = req.body.timer1;
  const meal2 = req.body.meal2;
  const timer2 = req.body.timer2;
  const meal3 = req.body.meal3;
  const timer3 = req.body.timer3;
  const meal4 = req.body.meal4;
  const timer4 = req.body.timer4;
  const meal5 = req.body.meal5;
  const timer5 = req.body.timer5;
  const [rows] = await db.query("SELECT * FROM `meals` WHERE `user_id` = (?);", [id]);
  if (rows.length >= 1) {
    await db.query("UPDATE `meals` SET `meal1`= (?) , `time1`= (?) , `meal2`= (?) , `time2`=(?), `meal3`= (?) , `time3`= (?) , `meal4`=(?), `time4`= (?) , `meal5`= (?) , `time5`= (?) WHERE `user_id`= (?);", [meal1, timer1, meal2, timer2, meal3, timer3, meal4, timer4, meal5, timer5, id]);

  }
  else
    await db.query("INSERT INTO `meals`(`meal1`, `time1`, `meal2`, `time2`, `meal3`, `time3`, `meal4`, `time4`, `meal5`, `time5`, `user_id`) VALUES (?,?,?,?,?,?,?,?,?,?,?);", [meal1, timer1, meal2, timer2, meal3, timer3, meal4, timer4, meal5, timer5, id]);


  res.json({ status: "OK" });
  next();
});
app.get('/get_timers_meals', async (req, res, next) => {
  const text = req.url;
  const myArray = text.split("%22");

  const idd = myArray[3];

  const [rows] = await db.query("SELECT * FROM `meals` WHERE `user_id` = (?);", [idd]);

  var str = JSON.stringify(rows[0]);
  let t;
  let result;
  if(rows.length>0){
  const myArr = str.split(",");


  const meal1 = myArr[0].split(":");
  const timer1 = myArr[1].split(":");
  const meal2 = myArr[2].split(":");
  const timer2 = myArr[3].split(":");
  const meal3 = myArr[4].split(":");
  const timer3 = myArr[5].split(":");
  const meal4 = myArr[6].split(":");
  const timer4 = myArr[7].split(":");
  const meal5 = myArr[8].split(":");
  const timer5 = myArr[9].split(":");
   t = meal1[1] + "^" + timer1[1] + ":" + timer1[2] + "^" + meal2[1] + "^" + timer2[1] + ":" + timer2[2] + "^" + meal3[1] + "^" + timer3[1] + ":" + timer3[2] + "^" + meal4[1] + "^" + timer4[1] + ":" + timer4[2] + "^" + meal5[1] + "^" + timer5[1] + ":" + timer5[2];
   result = t.replaceAll("\"", "");
  }
  else result=null;
  
  res.json(result);
  next();
});
app.get('/water_prog', async (req, res, next) => {
  const text = req.url;
  const myArray = text.split("%22");

  const idd = myArray[3]; 
  const today = new Date();
  var ddd=JSON.stringify(today);
  console.log(today);

  var dddd=ddd.split("\"")
  var ddddd= dddd[1].split("T");
  var dates=" ";
 

  var ress = " ";
 
for (let i=1;i<8;i++){
 const dd = new Date();
dd.setDate(today.getDate() - i);
var ddd=JSON.stringify(dd);
var dddd=ddd.split("\"")
var ddddd= dddd[1].split("T");
dates=dates+ddddd[0]+" ";
const [rows] = await db.query("SELECT `drink_amount` FROM `water` WHERE `user_id`=(?) and `date`=(?);", [idd,ddddd[0]]);
if(rows.length>0){
var str = JSON.stringify(rows[0]);
var ss=str.split(":");
var sss=ss[1].split("}");
 ress = ress +sss[0]+" ";}else ress = ress +"0"+" ";
}
const [rows] = await db.query("SELECT `goal` FROM `water_timer` WHERE `user_id`=(?);", [idd]);
var str = JSON.stringify(rows[0]);
var ss=str.split(":");
var sss=ss[1].split("}");

 console.log(ress+"dates"+dates+"dates"+sss[0]);
   res.json(ress+"dates"+dates+"dates"+sss[0]);

 
  next();
});
app.post('/set_water_timer', async (req, res, next) => {
  const id = req.body.id;
  const plan = req.body.plan;
  const glass_size = req.body.glass_size;
  const goal = req.body.goal;
  const glass1 = req.body.glass1;
  const timer1 = req.body.timer1;
  const glass2 = req.body.glass2;
  const timer2 = req.body.timer2;
  const glass3 = req.body.glass3;
  const timer3 = req.body.timer3;
  const glass4 = req.body.glass4;
  const timer4 = req.body.timer4;
  const glass5 = req.body.glass5;
  const timer5 = req.body.timer5;

  const glass6 = req.body.glass6;
  const timer6 = req.body.timer6;
  const glass7 = req.body.glass7;
  const timer7 = req.body.timer7;
  const glass8 = req.body.glass8;
  const timer8 = req.body.timer8;
  const glass9 = req.body.glass9;
  const timer9 = req.body.timer9;
  const glass10 = req.body.glass10;
  const timer10 = req.body.timer10;

  const glass11 = req.body.glass11;
  const timer11 = req.body.timer11;
  const glass12 = req.body.glass12;
  const timer12 = req.body.timer12;
  const glass13 = req.body.glass13;
  const timer13 = req.body.timer13;
  const glass14 = req.body.glass14;
  const timer14 = req.body.timer14;
  const [rows] = await db.query("SELECT * FROM `water_timer` WHERE `user_id` = (?);", [id]);
  if (rows.length >= 1) {
    await db.query("UPDATE `water_timer` SET `plan`= (?) , `glass_size`= (?) , `goal`= (?) , `glass1`= (?) , `time1`= (?) , `glass2`= (?) , `time2`=(?), `glass3`= (?) , `time3`= (?) , `glass4`=(?), `time4`= (?) , `glass5`= (?) , `time5`= (?), `glass6`=(?), `time6`= (?) , `glass7`=(?) , `time7`= (?) , `glass8`=(?) , `time8`= (?) , `glass9`=(?) , `time9`= (?) , `glass10`=(?), `time10`= (?) , `glass11`=(?), `time11`= (?) , `glass12`=(?) , `time12`= (?), `glass13`=(?) , `time13`= (?), `glass14`=(?) , `time14`= (?) WHERE `user_id`= (?);", [plan, glass_size, goal, glass1, timer1, glass2, timer2, glass3, timer3, glass4, timer4, glass5, timer5, glass6, timer6, glass7, timer7, glass8, timer8, glass9, timer9, glass10, timer10, glass11, timer11, glass12, timer12, glass13, timer13, glass14, timer14, id]);

  }
  else
    await db.query("INSERT INTO `water_timer`(`plan`,`glass_size`,`goal`,`glass1`, `time1`, `glass2`, `time2`, `glass3`, `time3`, `glass4`, `time4`, `glass5`, `time5`,`glass6`, `time6`, `glass7`, `time7`, `glass8`, `time8`, `glass9`, `time9`, `glass10`, `time10`,`glass11`, `time11`, `glass12`, `time12`, `glass13`, `time13`, `glass14`, `time14`,`user_id`) VALUES (?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?);", [plan, glass_size, goal, glass1, timer1, glass2, timer2, glass3, timer3, glass4, timer4, glass5, timer5, glass6, timer6, glass7, timer7, glass8, timer8, glass9, timer9, glass10, timer10, glass11, timer11, glass12, timer12, glass13, timer13, glass14, timer14, id]);


  res.json({ status: "OK" });

  next();
});
app.get('/get_water_timer', async (req, res, next) => {
  const text = req.url;
  const myArray = text.split("%22");

  const idd = myArray[3];

  const [rows] = await db.query("SELECT * FROM `water_timer` WHERE `user_id` = (?);", [idd]);

  if(rows.length>0){
  var str = JSON.stringify(rows[0]);
  const myArr = str.split(",");
  const glass_size = myArr[2].split(":");
  const goal = myArr[3].split(":");
  let t = glass_size[1] + "^" + goal[1];
  let result = t.replaceAll("\"", "");
 
  res.json(result);}
  

  next();
});
app.get('/get_timers_water', async (req, res, next) => {
  const text = req.url;
  const myArray = text.split("%22");

  const idd = myArray[3];

  const [rows] = await db.query("SELECT * FROM `water_timer` WHERE `user_id` = (?);", [idd]);

  var str = JSON.stringify(rows[0]);
  let t;
  let result;
  if(rows.length>0){
  const myArr = str.split(",");
  const glass1 = myArr[4].split(":");
  const timer1 = myArr[5].split(":");
  const glass2 = myArr[6].split(":");
  const timer2 = myArr[7].split(":");
  const glass3 = myArr[8].split(":");
  const timer3 = myArr[9].split(":");
  const glass4 = myArr[10].split(":");
  const timer4 = myArr[11].split(":");
  const glass5 = myArr[12].split(":");
  const timer5 = myArr[13].split(":");

  const glass6 = myArr[14].split(":");
  const timer6 = myArr[15].split(":");
  const glass7 = myArr[16].split(":");
  const timer7 = myArr[17].split(":");
  const glass8 = myArr[18].split(":");
  const timer8 = myArr[19].split(":");
  const glass9 = myArr[20].split(":");
  const timer9 = myArr[21].split(":");
  const glass10 = myArr[22].split(":");
  const timer10 = myArr[23].split(":");
  const glass11 = myArr[24].split(":");
  const timer11 = myArr[25].split(":");
  const glass12 = myArr[26].split(":");
  const timer12 = myArr[27].split(":");
  const glass13 = myArr[28].split(":");
  const timer13 = myArr[29].split(":");
  const glass14 = myArr[30].split(":");
  const timer14 = myArr[31].split(":");
 
   t = glass1[1] + "^" + timer1[1] + ":" + timer1[2] + "^" + glass2[1] + "^" + timer2[1] + ":" + timer2[2] + "^" + glass3[1] + "^" + timer3[1] + ":" + timer3[2] + "^" + glass4[1] + "^" + timer4[1] + ":" + timer4[2] + "^" + glass5[1] + "^" + timer5[1] + ":" + timer5[2]+ "^" +
   +glass6[1] + "^" + timer6[1] + ":" + timer6[2] + "^" + glass7[1] + "^" + timer7[1] + ":" + timer7[2] + "^" + glass8[1] + "^" + timer8[1] + ":" + timer8[2] + "^" + glass9[1] + "^" + timer9[1] + ":" + timer9[2] + "^" + glass10[1] + "^" + timer10[1] + ":" + timer10[2]+ "^" +
   +glass11[1] + "^" + timer11[1] + ":" + timer11[2] + "^" + glass12[1] + "^" + timer12[1] + ":" + timer12[2] + "^" + glass13[1] + "^" + timer13[1] + ":" + timer13[2] + "^" + glass14[1] + "^" + timer14[1] + ":" + timer14[2];
   result = t.replaceAll("\"", "");
  }
  else result=null;
  console.log(result);
  res.json(result);
  next();
});
app.post('/water_amount', async (req, res, next) => {
  const id = req.body.id;
  const drink_amount = req.body.drink_amount;
  const time = req.body.time;
  const date = req.body.date;

  var date_ob = new Date();
  var day = ("0" + date_ob.getDate()).slice(-2);
  var month = ("0" + (date_ob.getMonth() + 1)).slice(-2);
  var year = date_ob.getFullYear();
  var date2 = year + "-" + month + "-" + day;

  const [rows] = await db.query("SELECT * FROM `water` WHERE `user_id` = (?) and `date` = (?);", [id,date2]);
  if (rows.length > 0) {
    await db.query("UPDATE `water` SET `drink_amount`= (?) , `time`= (?)   WHERE `user_id`= (?) and  `date`= (?);", [drink_amount,time,id,date]);
  
  }
  if (rows.length == 0) {
    await db.query("INSERT INTO `water`(`drink_amount`, `time`, `date` , `user_id`) VALUES (?,?,?,?);", [drink_amount,time,date,id]);
  }

  res.json({ status: "OK" });
  next();
});
app.post('/get_foods', async (req, res, next) => {
  const id = req.body.id;
  const date = req.body.date;

  const [rows] = await db.query("SELECT * FROM `eaten_meals` WHERE `user_id` = (?);", [id]);
  var ids="";
  var amounts="";
var count=0;
  if (rows.length >0 ) {
   // console.log(rows);
    var len = rows.length
    for (let i = 0; i < len; i++) {
      var str = JSON.stringify(rows[i]);
      const myArr = str.split(",");
      const myAr= myArr[4].split("T");
      const myA=myAr[0].split("\"")
     // console.log(myA[3]);
      if(myA[3]==date)
      {
        count++;
        const myid=myArr[0].split(":");
        const ids_temp=ids;
        ids=ids_temp+"id"+myid[1];
       
        const myAmoun=myArr[5].split(":");
        const myAmount=myAmoun[1].split("}");
        const myAmount_temp=amounts;
        amounts=myAmount_temp+"am"+myAmount[0];
       

      }
    }
   var result=count+" "+ids+" "+amounts;
 console.log(result);
 res.json({ status: result });
  }
  else{  

  res.json({ status: "OK" });}
  
  next();
}


);
app.get('/get_water_amount', async (req, res, next) => {
  const text = req.url;
  const myArray = text.split("%22");

  const idd = myArray[3];
  var date_ob = new Date();
  var day = ("0" + date_ob.getDate()).slice(-2);
  var month = ("0" + (date_ob.getMonth() + 1)).slice(-2);
  var year = date_ob.getFullYear();
  var date2 = year + "-" + month + "-" + day;
  const [rows] = await db.query("SELECT * FROM `water` WHERE `user_id` = (?) and `date` = (?);", [idd,date2]);
  let t;
  let result;
  if(rows.length>0){
  var str = JSON.stringify(rows[0]);
  const myArr = str.split(",");
  const drink_amount = myArr[2].split(":");
  const time = myArr[3].split(":");
   t = drink_amount[1] + "^" + time[1]+":"+ time[2];
   result = t.replaceAll("\"", "");
  }
  else result = null+"^"+null;
  console.log(result);
  res.json(result);

  next();

});
app.get('/get_foodprogress', async (req, res, next) => {
  const text = req.url;
  const myArray = text.split("%22");

  const idd = myArray[3];

  const [rows] = await db.query("SELECT * FROM `foods` WHERE `food_id` = (?);", [idd]);
  let result;
  if(rows.length>0){
  var str = JSON.stringify(rows[0]);
  const myArr = str.split(",");
  const cholesterol = myArr[10].split(":");
  const protein = myArr[8].split(":");
  const carbs = myArr[3].split(":");

  let t = cholesterol[1] + "^" + protein[1] + "^"+carbs[1];
   result = t.replaceAll("\"", "");
  }
  else  result="nn";
  console.log(result);
  res.json(result);
  next();
});
async function main() {
  db = await mysql.createConnection({
    host: "localhost",
    user: "root",
    password: "",
    database: "acuteDB",
    timezone: "+00:00",
    charset: "utf8mb4_general_ci",
  });

  app.listen(8000);
}

main();