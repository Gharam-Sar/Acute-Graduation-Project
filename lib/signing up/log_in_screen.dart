import 'dart:convert';
import 'dart:ffi';
import 'package:intl/intl.dart';
import 'package:test1/main_application/custom_drawer/reset_password.dart';

import 'package:test1/signing%20up/email_verify.dart';
import 'package:test1/signing%20up/forgot_password_page.dart';
import 'package:crypto/crypto.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:test1/signing%20up/sign_up_screen_1.dart';

import '../http.dart';
import '../main_application/navigation_home_screen.dart';

class Log_in_page extends StatefulWidget {
  const Log_in_page({Key? key}) : super(key: key);

  @override
  _Log_in_pageState createState() => _Log_in_pageState();
}

String fromlogin = "false";

class _Log_in_pageState extends State<Log_in_page> {
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
  String weight = "";
  String height = "";

  loginUserinfo() async {
    var data = utf8.encode(textfieldsStrings[1]); // data being hashed
    var hashvalue = sha1.convert(data);
    print(textfieldsStrings[0]);
    print(textfieldsStrings[1]);
    var result = await http_get("userID", {
      "email": textfieldsStrings[0],
      "password": hashvalue.toString(),
    });
    print("object");
    if (result.data == " ") {
    } else {
      print(result.data);
      var res = await http_get("userauth", {
        "id": result.data,
      });

      if (res.data == "1") {
        verification.sendOtp(textfieldsStrings[0]);
        fromlogin = "true";
        Navigator.push(
            context,
            MaterialPageRoute(
                builder: (_) => email_page(
                      firstlist: [result.data, textfieldsStrings[0]],
                    )));
      } else {
        fromlogin = "true";

        var result2 = await http_get("usermeals", {
          "id": result.data,
        });
        m = result2.data.split("&");

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
            if (indexx.isEmpty || indexx.length < meal_index.length)
              indexx.add(meal_index[l]);
            if (meal_amount.isEmpty || meal_amount.length < amount.length)
              meal_amount.add(amount[l]);
            if (j.isEmpty || j.length < date.length) j.add(l);
          }
        }

        for (int l = 0; l < j.length; l++) {
          var result2 = await http_get("getmealname", {
            "id": meal_id[j[l]],
          });
          if (Meals.isEmpty || Meals.length < j.length) {
            Meals.add(result2.data);
          }
        }
        var result3 = await http_get("bodyinfo", {
          "id": result.data,
        });
        print(result.data);
        String datef = DateFormat('yyyy-MM-dd').format(DateTime.now());
        print(datef);
        var result4 = await http_get("getimages", {
          "date": datef,
        });

        List arrrr = result4.data.split("\"linklinklink");
        for (int lll = 0; lll < arrrr.length; lll++) {
          String ttt = arrrr[lll].toString().replaceAll(" ", "");
          images.add(ttt);
        }

        print(images);
        var arr = result3.data.split(' ');

        weight = arr[0];
        height = arr[1];
        String gender = arr[2];
        String name = arr[3];

        Navigator.push(
            context,
            MaterialPageRoute(
                builder: (_) => NavigationHomeScreen(
                      firstlist: [result.data, weight, height, gender, name],
                      Meals: Meals,
                      meal_amount: meal_amount,
                      images: images,
                    )));
      }
    }
  }

  bool checkedValue = false;

  List textfieldsStrings = [
    "", //email
    "", //password
  ];

  final _emailKey = GlobalKey<FormState>();
  final _passwordKey = GlobalKey<FormState>();
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
            image: DecorationImage(
                image: AssetImage("assets/others/login_background2.png"),
                fit: BoxFit.cover),
          ),
          child: SafeArea(
            child: Stack(
              children: [
                SingleChildScrollView(
                  child: Column(
                    children: [
                      Padding(
                        padding: EdgeInsets.only(top: size.height * 0.1),
                        child: Align(
                          child: Text(
                            'Welcome Back',
                            style: GoogleFonts.satisfy(
                                color: Color.fromARGB(255, 181, 217, 240),
                                fontSize: size.height * 0.04,
                                fontWeight: FontWeight.w500),
                          ),
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.only(top: size.height * 0.01),
                        child: Align(
                          child: Text(
                            'Fill in your information to Access your Account',
                            style: GoogleFonts.poppins(
                              color: Color.fromARGB(255, 255, 255, 255),
                              fontSize: size.height * 0.025,
                              fontWeight: FontWeight.w500,
                            ),
                            textAlign: TextAlign.center,
                          ),
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.only(top: size.height * 0.02),
                      ),
                      Padding(
                        padding: EdgeInsets.only(top: size.height * 0.01),
                      ),
                      Form(
                        child: buildTextField(
                          "Email",
                          Icons.email_outlined,
                          false,
                          size,
                          (valuemail) {
                            if (valuemail.length < 5) {
                              buildSnackError(
                                'Invalid email',
                                context,
                                size,
                              );
                              return '';
                            }
                            if (!RegExp(
                                    r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+.[a-zA-Z]+")
                                .hasMatch(valuemail)) {
                              buildSnackError(
                                'Invalid email',
                                context,
                                size,
                              );
                              return '';
                            }

                            return null;
                          },
                          _emailKey,
                          0,
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.only(top: size.height * 0.01),
                      ),
                      Form(
                        child: buildTextField(
                          "Passsword",
                          Icons.lock_outline,
                          true,
                          size,
                          (valuepassword) {
                            if (valuepassword.length < 6) {
                              buildSnackError(
                                'Invalid password',
                                context,
                                size,
                              );
                              return '';
                            }
                            return null;
                          },
                          _passwordKey,
                          1,
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.only(top: size.height * 0.02),
                      ),
                      InkWell(
                        onTap: () {
                          from_setting = false;
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => ForgotPasswordPage(
                                      firstlist: [],
                                    )),
                          );
                        },
                        child: Text(
                          "Forgot your Password?",
                          style: TextStyle(
                            color: Color.fromARGB(255, 181, 217, 240),
                            decoration: TextDecoration.underline,
                            fontSize: size.height * 0.022,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                      ),
                      AnimatedPadding(
                        duration: const Duration(milliseconds: 500),
                        padding: EdgeInsets.only(top: size.height * 0.06),
                        child: Container(
                          height: size.height * 0.079,
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
                                  Color.fromARGB(255, 172, 184, 206),
                                  Color.fromARGB(255, 123, 165, 228),
                                ],
                              ),
                              borderRadius: BorderRadius.circular(20)),
                          child: FlatButton(
                            onPressed: loginUserinfo,
                            child: Text(
                              'Login',
                              style: GoogleFonts.satisfy(
                                  color: Color(0xff132137),
                                  fontSize: size.width * 0.08,
                                  fontWeight: FontWeight.w500),
                            ),
                          ),
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.only(top: size.height * 0.01),
                      ),
                      SizedBox(
                        width: size.width * 0.5,
                        height: size.height * 0.1,
                        child: Image.asset(
                          'assets/others/logolightblue.png',
                          fit: BoxFit.cover,
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.only(top: size.height * 0.001),
                      ),
                      RichText(
                        textAlign: TextAlign.left,
                        text: TextSpan(
                          children: [
                            TextSpan(
                              text: "Create a new Account? ",
                              style: TextStyle(
                                  color: Color.fromARGB(255, 181, 217, 240),
                                  fontSize: size.height * 0.023,
                                  fontWeight: FontWeight.w600),
                            ),
                            WidgetSpan(
                              child: InkWell(
                                  onTap: () {
                                    fromlogin = "false";
                                    Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                            builder: (_) => Sign_Up_page()));
                                  },
                                  child: Text(
                                    "Sign Up",
                                    style: TextStyle(
                                        color:
                                            // Color.fromARGB(255, 71, 104, 158),
                                            Color.fromARGB(255, 255, 255, 255),
                                        fontSize: size.height * 0.024,
                                        fontWeight: FontWeight.w600),
                                  )),
                            ),
                          ],
                        ),
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

  bool pwVisible = false;
  Widget buildTextField(
    String hintText,
    IconData icon,
    bool password,
    size,
    FormFieldValidator validator,
    Key key,
    int stringToEdit,
  ) {
    return Padding(
      padding: EdgeInsets.only(top: size.height * 0.025),
      child: Container(
        width: size.width * 0.9,
        height: size.height * 0.058,
        decoration: BoxDecoration(
          color: const Color(0xffF7F8F8),
          borderRadius: const BorderRadius.all(Radius.circular(15)),
        ),
        child: Form(
          key: key,
          child: TextFormField(
            style: TextStyle(color: Color(0xff132137)),
            onChanged: (value) {
              setState(() {
                textfieldsStrings[stringToEdit] = value;
              });
            },
            validator: validator,
            textInputAction: TextInputAction.next,
            obscureText: password ? !pwVisible : false,
            decoration: InputDecoration(
              errorStyle: const TextStyle(height: 0),
              hintStyle: const TextStyle(
                color: Color(0xffADA4A5),
              ),
              border: InputBorder.none,
              contentPadding: EdgeInsets.only(
                top: size.height * 0.012,
              ),
              hintText: hintText,
              prefixIcon: Padding(
                padding: EdgeInsets.only(
                  top: size.height * 0.005,
                ),
                child: Icon(
                  icon,
                  color: const Color(0xff7B6F72),
                ),
              ),
              suffixIcon: password
                  ? Padding(
                      padding: EdgeInsets.only(
                        top: size.height * 0.005,
                      ),
                      child: InkWell(
                        onTap: () {
                          setState(() {
                            pwVisible = !pwVisible;
                          });
                        },
                        child: pwVisible
                            ? const Icon(
                                Icons.visibility_off_outlined,
                                color: Color(0xff7B6F72),
                              )
                            : const Icon(
                                Icons.visibility_outlined,
                                color: Color(0xff7B6F72),
                              ),
                      ),
                    )
                  : null,
            ),
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
