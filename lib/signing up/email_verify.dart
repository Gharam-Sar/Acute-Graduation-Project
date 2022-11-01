import 'dart:ffi';

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';
import 'package:test1/http.dart';
import 'package:test1/signing%20up/log_in_screen.dart';
import 'package:test1/signing%20up/sign_up_screen_1.dart';
import 'package:test1/signing%20up/sign_up_screen_2.dart';
import 'package:flutter_verification_code/flutter_verification_code.dart';

import '../main_application/navigation_home_screen.dart';

class email_page extends StatefulWidget {
  List firstlist;
  email_page({Key? key, required this.firstlist}) : super(key: key);

  @override
  _email_pageState createState() => _email_pageState();
}

class _email_pageState extends State<email_page> {
  List m = [];
  List m2 = [];
  List meal_id = [];
  List meal_index = [];
  List date = [];
  List j = [];
  List images = [];
  List Meals = [];
  List indexx = [];
  List amount = [];
  List meal_amount = [];

  show_meals(String id) async {
    setState(() {});
  }

  final TextEditingController _otpController = TextEditingController();
  bool _onEditing = true;
  String _code = '';
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: Center(
        child: Container(
          height: size.height,
          width: size.height,
          decoration: BoxDecoration(
            color: Color.fromARGB(255, 181, 217, 240),
          ),
          child: SingleChildScrollView(
            child: Column(children: [
              Row(children: [
                Padding(
                  padding: EdgeInsets.only(top: size.height * 0.13),
                ),
                IconButton(
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  icon: Icon(Icons.arrow_back),
                  color: Color(0xff132137),
                ),
              ]),
              Container(
                constraints: BoxConstraints(maxWidth: 190, maxHeight: 190),
                child: Image.asset(
                  'assets/others/email_e.png',
                  fit: BoxFit.contain,
                ),
              ),
              Padding(
                padding: EdgeInsets.only(top: size.height * 0.025),
              ),
              Text(
                'Email Verification',
                style: GoogleFonts.poppins(
                  color: Color(0xff132137),
                  fontSize: size.height * 0.042,
                  fontWeight: FontWeight.bold,
                ),
              ),
              Text(
                'Enter the code sent to your email',
                style: GoogleFonts.poppins(
                    color: Color.fromARGB(255, 47, 84, 148),
                    fontSize: size.height * 0.02,
                    fontWeight: FontWeight.w600),
              ),
              SizedBox(
                height: size.height * 0.011,
              ),
              VerificationCode(
                length: 6,
                textStyle: TextStyle(fontSize: 22, color: Color(0xff132137)),
                underlineColor: Color.fromARGB(255, 87, 125, 207),
                keyboardType: TextInputType.number,
                underlineUnfocusedColor: Color(0xff132137),
                onCompleted: (value) {
                  setState(() {
                    _code = value;
                  });
                },
                onEditing: (value) {
                  setState(() {
                    _onEditing = value;
                  });
                  if (!_onEditing) FocusScope.of(context).unfocus();
                },
              ),
              SizedBox(
                height: size.height * 0.05,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    "Didn't receive the code?",
                    style: TextStyle(
                        fontSize: 15,
                        color: Color.fromARGB(255, 47, 84, 148),
                        fontWeight: FontWeight.w600),
                  ),
                  TextButton(
                      onPressed: () {
                        if (fromlogin == "true") {
                          verification.sendOtp(widget.firstlist[1]);
                          if (verification.result) {
                            buildSnackError(
                              'check your Email for a code.',
                              context,
                              size,
                            );
                          } else
                            buildSnackError(
                              'resend failed',
                              context,
                              size,
                            );
                        } else {
                          verification.sendOtp(widget.firstlist[2]);
                          if (verification.result) {
                            buildSnackError(
                              'check your Email for a code.',
                              context,
                              size,
                            );
                          } else
                            buildSnackError(
                              'resend failed',
                              context,
                              size,
                            );
                        }
                      },
                      child: Text(
                        "Resend",
                        style: TextStyle(
                            fontSize: 15,
                            color: Color.fromARGB(255, 19, 33, 55),
                            fontWeight: FontWeight.w600),
                      ))
                ],
              ),
              AnimatedPadding(
                duration: const Duration(milliseconds: 500),
                padding: EdgeInsets.only(top: size.height * 0.007),
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
                    onPressed: () async {
                      if (_onEditing)
                        buildSnackError(
                          'Please enter full code',
                          context,
                          size,
                        );
                      else {
                        print(widget.firstlist[0]);
                        print(_code);
                        if (fromlogin == "true") {
                          if (verification.verify(widget.firstlist[1], _code)) {
                            print(fromlogin);

                            var result = await http_get("usermeals", {
                              "id": widget.firstlist[0],
                            });
                            m = result.data.split("&");

                            for (int i = 0; i < m.length - 1; i++) {
                              if (m2.isEmpty || m2.length <= m.length) {
                                m2 = m[i].split("^");

                                meal_id.add(m2[0]);
                                meal_index.add(m2[1]);
                                date.add(m2[2]);
                                amount.add(m2[3]);
                              }
                            }
                            final DateTime date1 = DateTime.now();

                            List<String> d1 = date1.toString().split(" ");

                            for (int l = 0; l < date.length; l++) {
                              final DateTime date2 = DateTime.parse(date[l]);
                              List<String> d2 = date2.toString().split(" ");

                              if (d1[0] == d2[0]) {
                                if (indexx.isEmpty ||
                                    indexx.length < meal_index.length)
                                  indexx.add(meal_index[l]);
                                if (meal_amount.isEmpty ||
                                    meal_amount.length < amount.length)
                                  meal_amount.add(amount[l]);
                                if (j.isEmpty || j.length < date.length)
                                  j.add(l);
                              }
                            }

                            for (int l = 0; l < j.length; l++) {
                              var result = await http_get("getmealname", {
                                "id": meal_id[j[l]],
                              });
                              if (Meals.isEmpty || Meals.length < j.length) {
                                Meals.add(result.data);
                              }
                            }
                            var result3 = await http_get("bodyinfo", {
                              "id": widget.firstlist[0],
                            });

                            var arr = result3.data.split(' ');
                            String weight = arr[0];
                            String height = arr[1];
                            String gender = arr[2];
                            String name = arr[3];
                            String datef =
                                DateFormat('yyyy-MM-dd').format(DateTime.now());
                            print(datef);
                            var result4 = await http_get("getimages", {
                              "date": datef,
                            });

                            List arrrr = result4.data.split("\"linklinklink");
                            for (int lll = 0; lll < arrrr.length; lll++) {
                              String ttt =
                                  arrrr[lll].toString().replaceAll(" ", "");
                              images.add(ttt);
                            }
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (_) => NavigationHomeScreen(
                                          firstlist: [
                                            widget.firstlist[0],
                                            weight,
                                            height,
                                            gender,
                                            name
                                          ],
                                          Meals: Meals,
                                          meal_amount: meal_amount,
                                          images: images,
                                        )));
                          } else
                            buildSnackError(
                              'Code  must match',
                              context,
                              size,
                            );
                        } else {
                          print(widget.firstlist[2]);
                          print(_code);
                          if (verification.verify(widget.firstlist[2], _code)) {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (_) => Sign_Up_page_2(
                                          firstlist: [
                                            widget.firstlist[0],
                                            widget.firstlist[1],
                                            widget.firstlist[2],
                                            widget.firstlist[3],
                                          ],
                                        )));
                          } else
                            buildSnackError(
                              'Code  must match',
                              context,
                              size,
                            );
                        }
                      }
                    },
                    child: Text(
                      'Verify',
                      style: TextStyle(color: Colors.white, fontSize: 27),
                    ),
                  ),
                ),
              ),
            ]),
          ),
        ),
      ),
    );
  }

  ScaffoldFeatureController<SnackBar, SnackBarClosedReason> buildSnackError(
      String error, context, size) {
    return ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        duration: const Duration(seconds: 3),
        backgroundColor: Color(0xff132137),
        content: SizedBox(
          height: size.height * 0.03,
          child: Center(
            child: Text(error,
                style: GoogleFonts.poppins(
                  color: Color.fromARGB(255, 218, 226, 238),
                  fontSize: size.height * 0.02,
                  fontWeight: FontWeight.w600,
                )),
          ),
        ),
      ),
    );
  }
}
