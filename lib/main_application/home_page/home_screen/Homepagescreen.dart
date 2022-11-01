import 'package:flutter_image_slideshow/flutter_image_slideshow.dart';

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';
import 'package:test1/http.dart';
import 'dart:math' as math;

import 'package:test1/main_application/home_page/wave_view.dart';
import 'package:velocity_x/velocity_x.dart';

class Homepagescreen extends StatefulWidget {
  List firstlist;
  List Meals;
  List meal_amount;
  List images;
  int amount_drink = 0;
  Homepagescreen({
    Key? key,
    required this.firstlist,
    required this.Meals,
    required this.meal_amount,
    required this.images,
  }) : super(key: key);

  @override
  _HomepagescreenState createState() => _HomepagescreenState();
}

List<int> ind = [
  1,
];
double BMI = 0;

class _HomepagescreenState extends State<Homepagescreen> {
  var sug = [
    "You need protein",
    "You've consumed a lot of carbs\neat some veggies",
    "You need some carbs"
  ];
  var sug_food = ["Chicken", "Broccoli", "Rice"];
  int body_index = 0;
  bool meals_found = false;
  int count = 0;
  List meal_names = [];
  List meal_amounts = [];
  List meal_cal = [];

  var mealImages = [
    'assets/others/meal.gif',
    'assets/others/Foods.gif',
    'assets/others/meal4.gif',
    'assets/others/meal3.gif',
    'assets/others/meal22.gif',
    'assets/others/meal5.gif',
    'assets/others/meal6.gif',
  ];
  var sug_image = [
    'assets/others/sug2.gif',
    'assets/others/sug1.gif',
    'assets/others/sug3.gif',
  ];
  var body_images = [
    'assets/others/f1.png',
    'assets/others/f2.png',
    'assets/others/f3.png',
    'assets/others/f4.png',
    'assets/others/f5.png',
    'assets/others/m1.png',
    'assets/others/m2.png',
    'assets/others/m3.png',
    'assets/others/m4.png',
    'assets/others/m5.png'
  ];
  var body_names = [
    'Under Weight',
    'Normal',
    'Over Weight',
    'Obese',
    'Extremely Obese',
    'Under Weight',
    'Normal',
    'Over Weight',
    'Obese',
    'Extremely Obese',
  ];
  var body_adv = [
    'You need to Gain Some weight',
    'Keep up the good work',
    'Try losing some weight',
    'You need to lose some weight',
    'You desperately need to lose some weight ',
    'You need to Gain Some weight',
    'Keep up the good work',
    'Try losing some weight',
    'You need to lose some weight',
    'You desperately need to lose some weight ',
  ];
  String st = "";
  String idd = "";
  bool from_meals = false;
  int water_goal = 0;
  int amount_drink = 0;
  int glass_size = 0;
  List meal_checked = [];
  String time = "";
  List l = [5, 4, 3, 2, 1, 0];
  String datef = DateFormat('yyyy-MM-dd').format(DateTime.now());
  String timef = DateFormat("HH:mm").format(DateTime.now());
  double p = 1.0;
  get_amount() async {
    var result = await http_get("get_water_amount", {
      "id": widget.firstlist[0],
    });

    setState(() {
      List myinfo = result.data.split("^");
      if (myinfo[0] == "null")
        amount_drink = 0;
      else
        amount_drink = int.parse(myinfo[0]);
      if (myinfo[1] == "null")
        time = "You haven't drank yet";
      else
        time = 'Last drink at ' + myinfo[1] + "     ";

      double p2 = (water_goal - amount_drink) / water_goal;
      p = (1 - p2) * 100;
      p = p.roundToDouble();
    });
  }

  get_water() async {
    var result = await http_get("get_water_timer", {
      "id": widget.firstlist[0],
    });

    setState(() {
      List myinfo = result.data.split("^");
      water_goal = int.parse(myinfo[1]);
      glass_size = int.parse(myinfo[0]);
    });
  }

  double Top = 0;

  @override
  initState() {
    print("meme mama");
    // print(widget.Meals);
    print(widget.images);
    get_water();
    get_amount();
    count = widget.Meals.length;
    if (widget.Meals.length > 0)
      meals_found = true;
    else
      meals_found = false;

    for (int i = 0; i < widget.Meals.length; i++) {
      var tt = widget.Meals[i].toString();
      List arr = tt.split("^");
      print(widget.Meals[i]);
      print(arr);
      meal_names.add(arr[0]);
      meal_amounts.add(arr[1]);

      double d = double.parse(widget.meal_amount[i]);
      print(d);
      double am = (d * double.parse(arr[1])) / 100;

      meal_cal.add(am.toString());
    }
    print(meal_names);
    print(meal_amounts);
    print(widget.Meals);
    print(widget.firstlist[1]);
    print(widget.firstlist[2]);
    num meters = double.parse(widget.firstlist[2]) / 100;

    num squ_meters = meters * meters;

    BMI = double.parse(widget.firstlist[1]) / squ_meters;
    if (BMI <= 18.5) {
      if (widget.firstlist[3] == "1")
        body_index = 0;
      else
        body_index = 5;
    }
    if (BMI >= 18.6 && BMI <= 24.9) {
      if (widget.firstlist[3] == "1")
        body_index = 1;
      else
        body_index = 6;
    }
    if (BMI >= 25 && BMI <= 29.9) {
      if (widget.firstlist[3] == "1")
        body_index = 2;
      else
        body_index = 7;
    }
    if (BMI >= 30 && BMI <= 39.9) {
      if (widget.firstlist[3] == "1")
        body_index = 3;
      else
        body_index = 8;
    }
    if (BMI >= 40) {
      if (widget.firstlist[3] == "1")
        body_index = 4;
      else
        body_index = 9;
    }

    super.initState();
  }

  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    bool found = true;
    return Scaffold(
      backgroundColor: Color.fromARGB(255, 181, 217, 240),
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        backgroundColor: Colors.white,
        toolbarHeight: MediaQuery.of(context).size.height * 0.10,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.vertical(
            bottom: Radius.circular(30),
          ),
        ),
        elevation: 1,
        title: Container(
          alignment: Alignment.topCenter,
          child: SizedBox(
            width: MediaQuery.of(context).size.width * 0.4,
            height: MediaQuery.of(context).size.height * 0.07,
            child: Image.asset(
              'assets/others/logoNavy.png',
              fit: BoxFit.cover,
            ),

            //
          ),
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Padding(
              padding: EdgeInsets.all(MediaQuery.of(context).size.width * 0.05),
              child: Text(
                'Ads of the Day',
                style: TextStyle(
                  fontWeight: FontWeight.w600,
                  fontSize: MediaQuery.of(context).size.width * 0.045,
                  letterSpacing: 0.5,
                  color: Color.fromARGB(255, 19, 33, 55),
                ),
              ),
            ),
            Padding(
              padding: EdgeInsets.all(MediaQuery.of(context).size.width * 0.02),
              child: Container(
                  decoration: BoxDecoration(
                    color: Color.fromARGB(255, 181, 217, 240),
                    boxShadow: <BoxShadow>[
                      BoxShadow(
                          color: Color.fromARGB(255, 0, 0, 0).withOpacity(0.2),
                          offset: Offset(1.1, 1.1),
                          blurRadius: 20.0),
                    ],
                  ),
                  constraints: BoxConstraints.expand(
                      height: MediaQuery.of(context).size.height * 0.4),
                  child: ad_slides(context)),
            ),
            Padding(
              padding: EdgeInsets.all(MediaQuery.of(context).size.width * 0.05),
              child: Text(
                'Meals of the Day',
                style: TextStyle(
                  fontWeight: FontWeight.w600,
                  fontSize: MediaQuery.of(context).size.width * 0.045,
                  letterSpacing: 0.5,
                  color: Color.fromARGB(255, 19, 33, 55),
                ),
              ),
            ),
            meals_found
                ? Column(
                    children: [
                      SingleChildScrollView(
                        scrollDirection: Axis.horizontal,
                        child: Row(
                          children: <Widget>[
                            for (int ii = 0; ii < count; ii++)
                              for (int i in ind) addMeal(context, size, ii),
                            Padding(
                                padding: EdgeInsets.all(
                                    MediaQuery.of(context).size.width * 0.01))
                          ],
                        ),
                      ),
                    ],
                  )
                : Container(
                    padding: EdgeInsets.only(
                        left: MediaQuery.of(context).size.width * 0.05,
                        top: MediaQuery.of(context).size.width * 0.05),
                    child: Text(
                      "No Meals yet",
                      style: TextStyle(
                          color: Color.fromARGB(255, 136, 60, 89),
                          fontSize: size.width * 0.05,
                          fontWeight: FontWeight.w600),
                    ),
                  ),
            Padding(
              padding: EdgeInsets.all(MediaQuery.of(context).size.width * 0.05),
              child: Text(
                'Suggested Meals',
                style: TextStyle(
                  fontWeight: FontWeight.w600,
                  fontSize: MediaQuery.of(context).size.width * 0.045,
                  letterSpacing: 0.5,
                  color: Color.fromARGB(255, 19, 33, 55),
                ),
              ),
            ),
            Column(
              children: [
                SingleChildScrollView(
                  scrollDirection: Axis.horizontal,
                  child: Row(
                    children: <Widget>[
                      for (int ii = 0; ii < 3; ii++)
                        for (int i in ind) add_sug_Meal(context, size, ii),
                      Padding(
                          padding: EdgeInsets.all(
                              MediaQuery.of(context).size.width * 0.01))
                    ],
                  ),
                ),
              ],
            ),
            Padding(
              padding: EdgeInsets.only(
                top: MediaQuery.of(context).size.width * 0.04,
              ),
              child: Text(
                'Body Check',
                style: TextStyle(
                  fontWeight: FontWeight.w600,
                  fontSize: MediaQuery.of(context).size.width * 0.045,
                  letterSpacing: 0.5,
                  color: Color.fromARGB(255, 19, 33, 55),
                ),
              ),
            ),
            summary(context, size, body_index),
            Padding(
              padding: EdgeInsets.only(
                top: MediaQuery.of(context).size.width * 0.02,
              ),
              child: Text(
                'Water Check',
                style: TextStyle(
                  fontWeight: FontWeight.w600,
                  fontSize: MediaQuery.of(context).size.width * 0.045,
                  letterSpacing: 0.5,
                  color: Color.fromARGB(255, 19, 33, 55),
                ),
              ),
            ),
            Padding(
              padding: EdgeInsets.only(
                  top: MediaQuery.of(context).size.height * 0.02),
            ),
            water(context, size),
            Padding(
              padding: EdgeInsets.only(
                  top: MediaQuery.of(context).size.height * 0.1),
            )
          ],
        ),
      ),
    );
  }

  Widget ad_slides(BuildContext context) {
    return ImageSlideshow(
      width: double.infinity,
      initialPage: 0,
      indicatorColor: Color(0xff132137),
      indicatorBackgroundColor: Colors.grey,
      children: [
        for (int ii = 0; ii < widget.images.length - 1; ii++)
          for (int i in ind) Image.network(widget.images[ii]),
      ],
      onPageChanged: (value) {},
      autoPlayInterval: 3000,
      isLoop: true,
    );
  }

  Widget addMeal(BuildContext context, Size size, int i) {
    return Padding(
        padding: EdgeInsets.only(left: size.height * 0.03),
        child: Stack(
          children: [
            Container(
              width: size.width * 0.4,
              height: size.height * 0.3,
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: const BorderRadius.only(
                  bottomRight: Radius.circular(8.0),
                  bottomLeft: Radius.circular(8.0),
                  topLeft: Radius.circular(8.0),
                  topRight: Radius.circular(50.0),
                ),
                boxShadow: <BoxShadow>[
                  BoxShadow(
                      color: Colors.black.withOpacity(0.3),
                      offset: const Offset(1.1, 4.0),
                      blurRadius: 8.0),
                ],
              ),
              child: Padding(
                  padding: EdgeInsets.only(),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Container(
                        width: size.width * 0.25,
                        height: size.width * 0.25,
                        child: SizedBox(
                          child: Image.asset(mealImages[i % 7]),
                        ),
                      ),
                      Text(
                        meal_names[i],
                        textAlign: TextAlign.left,
                        style: TextStyle(
                            color: Color.fromARGB(255, 9, 78, 153),
                            fontSize: size.width * 0.047,
                            fontWeight: FontWeight.w600),
                      ),
                      Padding(
                        padding: EdgeInsets.only(top: size.height * 0.01),
                      ),
                      Text(
                        widget.meal_amount[i] + " gm",
                        textAlign: TextAlign.left,
                        style: TextStyle(
                            color: Color.fromARGB(255, 136, 60, 89),
                            fontSize: size.width * 0.042,
                            fontWeight: FontWeight.w600),
                      ),
                      Padding(
                        padding: EdgeInsets.only(top: size.height * 0.01),
                      ),
                      Text(
                        meal_cal[i] + " Kcal",
                        textAlign: TextAlign.left,
                        style: TextStyle(
                            color: Color.fromARGB(255, 136, 60, 89),
                            fontSize: size.width * 0.042,
                            fontWeight: FontWeight.w600),
                      ),
                    ],
                  )),
            ),
          ],
        ));
  }

  Widget add_sug_Meal(BuildContext context, Size size, int i) {
    return InkWell(
        onTap: () {
          showAlertDialog(context, sug[i]);
        },
        child: Padding(
            padding: EdgeInsets.only(left: size.height * 0.03),
            child: Stack(
              children: [
                Container(
                  width: size.width * 0.4,
                  height: size.height * 0.3,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: const BorderRadius.only(
                      bottomRight: Radius.circular(8.0),
                      bottomLeft: Radius.circular(8.0),
                      topLeft: Radius.circular(8.0),
                      topRight: Radius.circular(50.0),
                    ),
                    boxShadow: <BoxShadow>[
                      BoxShadow(
                          color: Colors.black.withOpacity(0.3),
                          offset: const Offset(1.1, 4.0),
                          blurRadius: 8.0),
                    ],
                  ),
                  child: Padding(
                      padding: EdgeInsets.only(),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Container(
                            width: size.width * 0.25,
                            height: size.width * 0.25,
                            child: SizedBox(
                              child: Image.asset(sug_image[i]),
                            ),
                          ),
                          Text(
                            sug_food[i],
                            textAlign: TextAlign.left,
                            style: TextStyle(
                                color: Color.fromARGB(255, 9, 78, 153),
                                fontSize: size.width * 0.047,
                                fontWeight: FontWeight.w600),
                          ),
                          Padding(
                            padding: EdgeInsets.only(top: size.height * 0.01),
                          ),
                        ],
                      )),
                ),
              ],
            )));
  }

  Widget summary(BuildContext context, Size size, int i) {
    return Padding(
      padding: EdgeInsets.only(
          left: size.width * 0.05,
          right: size.width * 0.05,
          top: size.width * 0.04,
          bottom: size.width * 0.02),
      child: Container(
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.only(
              topLeft: Radius.circular(8.0),
              bottomLeft: Radius.circular(8.0),
              bottomRight: Radius.circular(8.0),
              topRight: Radius.circular(8.0)),
          boxShadow: <BoxShadow>[
            BoxShadow(
                color: Colors.grey.withOpacity(0.2),
                offset: Offset(1.1, 1.1),
                blurRadius: 10.0),
          ],
        ),
        child: Padding(
            padding: EdgeInsets.only(
                top: size.height * 0.04,
                left: size.width * 0.05,
                right: size.width * 0.05),
            child: Row(
              children: [
                Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: <Widget>[
                    Row(
                      children: [
                        InkWell(
                            onTap: () {
                              showAlertDialog2(context,
                                  "Body mass index is an easy screening method for weight categorization for underweight, healthy weight, overweight, obesity and extreme obesity");
                            },
                            child: Row(
                              children: [
                                Padding(
                                  padding: EdgeInsets.only(
                                      bottom: size.width * 0.02),
                                  child: Icon(
                                    Icons.error_outline,
                                    color: Color.fromARGB(255, 19, 33, 55),
                                  ),
                                ),
                                Container(
                                  padding: EdgeInsets.only(
                                      left: size.width * 0.007,
                                      bottom: size.width * 0.02),
                                  width: size.width * 0.32,
                                  child: Text(
                                    "Hey " + widget.firstlist[4],
                                    textAlign: TextAlign.center,
                                    style: GoogleFonts.poppins(
                                        color: Color.fromARGB(255, 218, 22, 97),
                                        fontSize: size.width * 0.037,
                                        fontWeight: FontWeight.w600),
                                  ),
                                ),
                              ],
                            )),
                      ],
                    ),
                    Container(
                      padding: EdgeInsets.only(bottom: size.width * 0.0),
                      width: size.width * 0.4,
                      child: Text(
                        'this is your Body Check',
                        textAlign: TextAlign.center,
                        style: GoogleFonts.poppins(
                            color: Color.fromARGB(255, 9, 78, 153),
                            fontSize: size.width * 0.035,
                            fontWeight: FontWeight.w600),
                      ),
                    ),
                    Row(
                      children: [
                        Padding(
                          padding: EdgeInsets.only(),
                          child: Text(widget.firstlist[1],
                              textAlign: TextAlign.center,
                              style: GoogleFonts.poppins(
                                fontWeight: FontWeight.w600,
                                fontSize: size.width * 0.05,
                                color: Color.fromARGB(255, 218, 22, 97),
                              )),
                        ),
                        Padding(
                          padding: EdgeInsets.only(
                            bottom: size.height * 0,
                            left: size.width * 0.01,
                          ),
                          child: Text(
                            'Kg',
                            textAlign: TextAlign.center,
                            style: GoogleFonts.poppins(
                              fontWeight: FontWeight.w600,
                              fontSize: size.width * 0.035,
                              letterSpacing: -0.2,
                              color: Color.fromARGB(255, 19, 33, 55),
                            ),
                          ),
                        ),
                      ],
                    ),
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: <Widget>[
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.end,
                          children: <Widget>[
                            Padding(
                              padding: EdgeInsets.only(),
                              child: Text(widget.firstlist[2],
                                  textAlign: TextAlign.center,
                                  style: GoogleFonts.poppins(
                                    fontWeight: FontWeight.w600,
                                    fontSize: size.width * 0.05,
                                    color: Color.fromARGB(255, 218, 22, 97),
                                  )),
                            ),
                            Padding(
                              padding: EdgeInsets.only(
                                bottom: size.height * 0.005,
                                left: size.width * 0.01,
                              ),
                              child: Text(
                                'cm',
                                textAlign: TextAlign.center,
                                style: GoogleFonts.poppins(
                                  fontWeight: FontWeight.w600,
                                  fontSize: size.width * 0.035,
                                  letterSpacing: -0.2,
                                  color: Color.fromARGB(255, 19, 33, 55),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: <Widget>[
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.end,
                          children: <Widget>[
                            Container(
                              width: size.width * 0.3,
                              padding: EdgeInsets.only(
                                left: size.width * 0.01,
                                right: size.width * 0.01,
                              ),
                              child: Text("Your BMI:",
                                  textAlign: TextAlign.center,
                                  style: GoogleFonts.poppins(
                                    fontWeight: FontWeight.w500,
                                    fontSize: size.width * 0.035,
                                    color: Color.fromARGB(255, 19, 33, 55),
                                  )),
                            ),
                            Text(BMI.toStringAsFixed(1),
                                textAlign: TextAlign.center,
                                style: GoogleFonts.poppins(
                                  fontWeight: FontWeight.w600,
                                  fontSize: size.width * 0.035,
                                  color: Color.fromARGB(255, 218, 22, 97),
                                )),
                          ],
                        ),
                      ],
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: <Widget>[
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.end,
                          children: <Widget>[
                            Container(
                              width: size.width * 0.3,
                              padding: EdgeInsets.only(
                                  top: size.height * 0.0,
                                  left: size.width * 0.01,
                                  right: size.width * 0.01,
                                  bottom: size.height * 0.01),
                              child: Text("Your body is " + body_names[i],
                                  textAlign: TextAlign.center,
                                  style: GoogleFonts.poppins(
                                    fontWeight: FontWeight.w600,
                                    fontSize: size.width * 0.03,
                                    color: Color.fromARGB(255, 19, 33, 55),
                                  )),
                            ),
                          ],
                        ),
                      ],
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: <Widget>[
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.end,
                          children: <Widget>[
                            Container(
                              width: size.width * 0.4,
                              padding: EdgeInsets.only(
                                  top: size.height * 0.0,
                                  left: size.width * 0.01,
                                  right: size.width * 0.01,
                                  bottom: size.height * 0.03),
                              child: Text(body_adv[i],
                                  textAlign: TextAlign.center,
                                  style: GoogleFonts.poppins(
                                    fontWeight: FontWeight.w600,
                                    fontSize: size.width * 0.03,
                                    color: Color.fromARGB(255, 218, 22, 97),
                                  )),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ],
                ),
                Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Container(
                      padding: EdgeInsets.only(
                        right: size.width * 0.03,
                      ),
                      width: size.width * 0.34,
                      height: size.height * 0.34,
                      child: Image.asset(
                        body_images[i],
                        fit: BoxFit.cover,
                      ),
                    )
                  ],
                )
              ],
            )),
      ),
    );
  }

  Widget water(BuildContext context, Size size) {
    return Padding(
      padding: EdgeInsets.only(
          right: MediaQuery.of(context).size.height * 0.03,
          left: MediaQuery.of(context).size.height * 0.03,
          bottom: MediaQuery.of(context).size.height * 0.3),
      child: Container(
        height: size.height * 0.27,
        decoration: BoxDecoration(
            color: Color.fromARGB(255, 255, 255, 255),
            border: Border.all(
              color: Color.fromARGB(255, 255, 255, 255),
            ),
            borderRadius: BorderRadius.all(Radius.circular(30))),
        child: Stack(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.end,
              children: <Widget>[
                Padding(
                  padding: EdgeInsets.only(
                      left: size.height * 0.03,
                      bottom: size.height * 0.02,
                      top: size.height * 0.035),
                  child: Text(
                    amount_drink.toString(),
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontWeight: FontWeight.w600,
                      fontSize: MediaQuery.of(context).size.width * 0.08,
                      color: Color.fromARGB(255, 10, 55, 102),
                    ),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(
                      left: size.height * 0.005,
                      bottom: size.height * 0.0275,
                      top: size.height * 0.03),
                  child: Text(
                    'ml',
                    style: TextStyle(
                      fontWeight: FontWeight.w500,
                      fontSize: 18,
                      letterSpacing: -0.2,
                      color: Color.fromARGB(255, 10, 55, 102),
                    ),
                  ),
                ),
              ],
            ),
            Row(children: <Widget>[
              Padding(
                padding: EdgeInsets.only(
                  left: size.height * 0.03,
                  top: size.height * 0.1,
                ),
                child: Text(
                  'of daily goal ' + water_goal.toString() + 'ml',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontWeight: FontWeight.w500,
                    fontSize: MediaQuery.of(context).size.width * 0.04,
                    color: Color.fromARGB(255, 10, 55, 102),
                    letterSpacing: 0.0,
                  ),
                ),
              ),
            ]),
            Padding(
              padding: EdgeInsets.only(
                right: size.height * 0.22,
                top: size.height * 0.16,
              ),
              child: Container(
                height: 2,
                decoration: BoxDecoration(
                  color: Color.fromARGB(255, 9, 78, 153),
                  borderRadius: const BorderRadius.all(Radius.circular(4.0)),
                ),
              ),
            ),
            Row(
              children: [
                Padding(
                  padding: EdgeInsets.only(
                      left: size.height * 0.03, top: size.height * 0.17),
                  child: Icon(
                    Icons.access_time,
                    color: Color(0xFFFB475F).withOpacity(.65),
                    size: 17,
                  ),
                ).py24(),
                Padding(
                  padding: EdgeInsets.only(top: size.height * 0.17),
                  child: Text(
                    time,
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontWeight: FontWeight.w500,
                      fontSize: MediaQuery.of(context).size.width * 0.031,
                      letterSpacing: 0.0,
                      color: Color(0xFFFB475F).withOpacity(.65),
                    ),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(
                      left: size.height * 0.05,
                      right: size.height * 0.03,
                      top: size.height * 0.024),
                  child: Container(
                    width: 60,
                    height: 150,
                    decoration: BoxDecoration(
                      color: Color.fromARGB(255, 181, 217, 240),
                      borderRadius: const BorderRadius.only(
                          topLeft: Radius.circular(80.0),
                          bottomLeft: Radius.circular(80.0),
                          bottomRight: Radius.circular(80.0),
                          topRight: Radius.circular(80.0)),
                      boxShadow: <BoxShadow>[
                        BoxShadow(
                            color: Colors.grey.withOpacity(0.4),
                            offset: const Offset(2, 2),
                            blurRadius: 4),
                      ],
                    ),
                    child: WaveView(
                      percentageValue: p,
                    ),
                  ),
                )
              ],
            )
          ],
        ),
      ),
    );
  }

  showAlertDialog(BuildContext context, String txt) {
    showDialog(
        context: context,
        builder: (BuildContext context) {
          return Dialog(
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(30.0)), //this right here
            child: Container(
              height: MediaQuery.of(context).size.height * 0.4,
              child: Padding(
                padding:
                    EdgeInsets.all(MediaQuery.of(context).size.height * 0.01),
                child: Column(
                  // mainAxisAlignment: MainAxisAlignment.center,
                  // crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(height: MediaQuery.of(context).size.height * 0.02),
                    Text(
                      'Why is this Suggested?',
                      textAlign: TextAlign.center,
                      style: GoogleFonts.poppins(
                        color: Color(0xff132137),
                        fontSize: MediaQuery.of(context).size.height * 0.024,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                    SizedBox(height: MediaQuery.of(context).size.height * 0.04),
                    Text(
                      txt,
                      textAlign: TextAlign.center,
                      style: GoogleFonts.poppins(
                        color: Color.fromARGB(255, 34, 99, 204),
                        fontSize: MediaQuery.of(context).size.height * 0.023,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                    SizedBox(height: MediaQuery.of(context).size.height * 0.03),
                    CircleAvatar(
                      backgroundColor: Color.fromARGB(255, 33, 53, 85),
                      radius: 30,
                      child: IconButton(
                        icon: Icon(
                          Icons.close,
                          color: Color.fromARGB(255, 255, 255, 255),
                        ),
                        onPressed: () {
                          Navigator.pop(context);
                        },
                      ),
                    ),
                  ],
                ),
              ),
            ),
          );
        });
  }

  showAlertDialog2(BuildContext context, String txt) {
    showDialog(
        context: context,
        builder: (BuildContext context) {
          return Dialog(
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(30.0)), //this right here
            child: Container(
              height: MediaQuery.of(context).size.height * 0.43,
              child: Padding(
                padding:
                    EdgeInsets.all(MediaQuery.of(context).size.height * 0.01),
                child: Column(
                  // mainAxisAlignment: MainAxisAlignment.center,
                  // crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(height: MediaQuery.of(context).size.width * 0.01),
                    Text(
                      'What is BMI?',
                      textAlign: TextAlign.center,
                      style: GoogleFonts.poppins(
                        color: Color(0xff132137),
                        fontSize: MediaQuery.of(context).size.height * 0.024,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                    //  SizedBox(height: MediaQuery.of(context).size.height * 0.04),
                    Text(
                      txt,
                      textAlign: TextAlign.center,
                      style: GoogleFonts.poppins(
                        color: Color.fromARGB(255, 34, 99, 204),
                        fontSize: MediaQuery.of(context).size.height * 0.02,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                    SizedBox(height: MediaQuery.of(context).size.height * 0.03),
                    CircleAvatar(
                      backgroundColor: Color.fromARGB(255, 33, 53, 85),
                      radius: 30,
                      child: IconButton(
                        icon: Icon(
                          Icons.close,
                          color: Color.fromARGB(255, 255, 255, 255),
                        ),
                        onPressed: () {
                          Navigator.pop(context);
                        },
                      ),
                    ),
                  ],
                ),
              ),
            ),
          );
        });
  }
}
