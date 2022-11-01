import 'dart:ffi';
import 'package:intl/intl.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:test1/http.dart';
import 'package:test1/main_application/navigation_home_screen.dart';
import 'package:test1/signing%20up/log_in_screen.dart';
import 'package:test1/signing%20up/sign_up_temp.dart';
import 'sign_up_screen_1.dart';
import 'sign_up_screen_2.dart';
import 'package:flutter/cupertino.dart';
import 'package:age_calculator/age_calculator.dart';

class Sign_Up_page_3 extends StatefulWidget {
  List firstlist;
  Sign_Up_page_3({Key? key, required this.firstlist}) : super(key: key);

  @override
  _Sign_Up_page_3State createState() => _Sign_Up_page_3State();
}

class _Sign_Up_page_3State extends State<Sign_Up_page_3> {
  List checked = [
    false,
    false,
    false,
    false,
    false,
    false,
    false,
    false,
    false,
    false
  ];

  int percent = 0;
  int g = 2000;

  double weight = 0;
  double Height = 0;
  bool checkedValueMale = false;
  bool checkedValueFemale = false;
  int activity = 0;
  double BMR = 0;
  double AMR = 0;
  String date = '';
  int age = 0;
  String gen = "";

  createUser() async {
    date = widget.firstlist[6];
    DateTime dt = DateTime.parse(date);
    DateDuration duration;
    duration = AgeCalculator.age(dt);
    List temp = duration.toString().split(",");
    List years = temp[0].toString().split(":");
    age = int.parse(years[1]);
    gen = widget.firstlist[8].toString();

    if (gen == '1') {
      checkedValueFemale = true;
      checkedValueMale = false;
    }
    if (gen == '0') {
      checkedValueMale = true;
      checkedValueFemale = false;
    }

    double ac = widget.firstlist[7];

    activity = ac.toInt();
    Height = double.parse(widget.firstlist[5]) * 1;
    weight = double.parse(widget.firstlist[4]) * 1;
    if (checkedValueFemale) {
      BMR = 655.1 + (9.563 * weight) + (1.850 * Height) - (4.676 * age);
    } else if (checkedValueMale) {
      BMR = 66.47 + (13.75 * weight) + (5.003 * Height) - (6.755 * age);
    }
    print(activity);
    if (activity == 1) {
      AMR = BMR * 1.2;
    } else if (activity == 26) {
      AMR = BMR * 1.375;
    } else if (activity == 51) {
      AMR = BMR * 1.55;
    } else if (activity == 75) {
      AMR = BMR * 1.725;
    } else if (activity == 100) {
      AMR = BMR * 1.9;
    }
    setState(() {
      print(BMR);
      g = AMR.toInt();
    });
    print(g);
    var result = await http_post("create-user", {
      "first_name": widget.firstlist[0],
      "last_name": widget.firstlist[1],
      "email": widget.firstlist[2],
      "password": widget.firstlist[3],
      "weight": widget.firstlist[4],
      "height": widget.firstlist[5],
      "date_of_birth": widget.firstlist[6],
      "activity_level": widget.firstlist[7],
      "gender": widget.firstlist[8],
      "goal": g,
    });
    print(result);

    if (result.ok) {
      setState(() {
        Navigator.push(
            context,
            MaterialPageRoute(
                builder: (_) => Sign_Up_page_temp(
                      checked: [
                        checked[0],
                        checked[1],
                        checked[2],
                        checked[3],
                        checked[4],
                        checked[5],
                        checked[6],
                        checked[7],
                        checked[8],
                        checked[9],
                        widget.firstlist[0], //first name
                        widget.firstlist[1], //last name
                        widget.firstlist[2], //email
                        widget.firstlist[3], //password
                        widget.firstlist[4], //weight
                      ],
                    )));

        var response = result.data['status'];
      });
    }
  }

  List Diseases = [
    "Heart Diseases",
    "Gastrointestinal Diseases",
    "Anemia",
    "Kidney and urinary tract Diseases",
    "Diabetes",
    "Low or high blood pressure",
    "Eyes illnesses",
    "Goitre",
    "Cancerous Diseases",
    "Dermal Diseases"
  ];

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    return Scaffold(
      body: Center(
        child: Container(
          height: size.height,
          width: size.height,
          decoration: BoxDecoration(
            color: Color.fromARGB(255, 181, 217, 240),
          ),
          child: SafeArea(
            child: Stack(
              children: [
                SingleChildScrollView(
                  child: Column(
                    children: [
                      Padding(
                        padding: EdgeInsets.only(top: size.height * 0.02),
                        child: Align(),
                      ),
                      Padding(
                        padding: EdgeInsets.only(top: size.height * 0.01),
                        child: Align(
                            child: Text('We\'re almost there',
                                style: GoogleFonts.poppins(
                                  color: Color(0xff132137),
                                  fontSize: size.height * 0.03,
                                  fontWeight: FontWeight.w500,
                                ),
                                textAlign: TextAlign.center)),
                      ),
                      Padding(
                        padding: EdgeInsets.only(top: size.height * 0.009),
                        child: Align(
                            child: Text(
                                'If you have any of the Diseases  \nlisted select it before we move on  \n If you don\'t have any just Continue ',
                                style: GoogleFonts.poppins(
                                  color: Color.fromARGB(255, 71, 104, 158),
                                  fontSize: size.height * 0.025,
                                  fontWeight: FontWeight.w500,
                                ),
                                textAlign: TextAlign.center)),
                      ),
                      Column(
                        children: [
                          Padding(
                            padding: EdgeInsets.only(
                                right: size.height * 0.057,
                                top: size.height * 0.037),
                          ),
                          Padding(
                            padding: EdgeInsets.symmetric(
                                horizontal: size.height * 0.015,
                                vertical: size.height * 0.015),
                            child: Container(
                                padding: EdgeInsets.only(
                                    left: size.height * 0.03,
                                    right: size.height * 0.025,
                                    top: size.height * 0.009,
                                    bottom: size.height * 0.01),
                                decoration: BoxDecoration(
                                    color: Color.fromARGB(255, 181, 217, 240),
                                    border: Border.all(
                                      color: Color(0xff132137),
                                    ),
                                    borderRadius:
                                        BorderRadius.all(Radius.circular(30))),
                                child: Column(
                                  children: [
                                    newMethod(context, size, 0),
                                    newMethod(context, size, 1),
                                    newMethod(context, size, 2),
                                    newMethod(context, size, 3),
                                    newMethod(context, size, 4),
                                    newMethod(context, size, 5),
                                    newMethod(context, size, 6),
                                    newMethod(context, size, 7),
                                    newMethod(context, size, 8),
                                    newMethod(context, size, 9),
                                  ],
                                )),
                          ),
                        ],
                      ),
                      SizedBox(
                        height: size.height * 0.017,
                      ),
                      Padding(
                        padding: EdgeInsets.only(bottom: size.height * 0.01),
                      ),
                      AnimatedPadding(
                        duration: const Duration(milliseconds: 500),
                        padding: EdgeInsets.only(top: size.height * 0.01),
                        child: Container(
                          height: size.height * 0.077,
                          width: size.width * 0.77,
                          decoration: BoxDecoration(
                              gradient: LinearGradient(
                                begin: Alignment.centerRight,
                                end: Alignment.centerLeft,
                                stops: [
                                  0.01,
                                  1.0,
                                ],
                                colors: [
                                  Color.fromARGB(255, 71, 104, 158),
                                  Color.fromARGB(255, 19, 33, 55),
                                ],
                              ),
                              borderRadius: BorderRadius.circular(20)),
                          child: FlatButton(
                            onPressed: createUser,
                            child: Text(
                              'Continue',
                              style: GoogleFonts.satisfy(
                                  color: Colors.white,
                                  fontSize: size.width * 0.09,
                                  fontWeight: FontWeight.w500),
                            ),
                          ),
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.only(top: size.height * 0.0),
                      ),
                      SizedBox(
                        width: size.width * 0.5,
                        height: size.height * 0.1,
                        child: Image.asset(
                          'assets/others/logoNavy.png',
                          fit: BoxFit.cover,
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.only(top: size.height * 0.00),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Row newMethod(BuildContext context, Size size, int i) {
    return Row(
      children: [
        SizedBox(
          width: MediaQuery.of(context).size.height * 0.02,
        ),
        Expanded(
          child: Padding(
            padding: EdgeInsets.only(top: size.height * 0.009),
            child: Text(
              Diseases[i],
              style: GoogleFonts.poppins(
                //   color: Color.fromARGB(255, 71, 104, 158),
                fontSize: size.height * 0.025,
                fontWeight: FontWeight.w500,
              ),
            ),
          ),
        ),
        Checkbox(
          checkColor: Color(0xff132137),
          //    fillColor: Color(0xff132137),
          value: checked[i],
          onChanged: (bool? value) {
            setState(() {
              checked[i] = value!;
            });
            print(checked[i]);
          },
        )
      ],
    );
  }
}
