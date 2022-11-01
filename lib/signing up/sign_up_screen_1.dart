import 'dart:ffi';
import 'dart:convert';
import 'dart:io';
import 'package:test1/http.dart';
import 'package:test1/signing%20up/email_verify.dart';
import 'package:email_auth/email_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:test1/signing%20up/log_in_screen.dart';
import 'package:crypto/crypto.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:test1/signing%20up/sign_up_screen_2.dart';

class Sign_Up_page extends StatefulWidget {
  Sign_Up_page({Key? key}) : super(key: key);

  @override
  _Sign_Up_pageState createState() => _Sign_Up_pageState();
}

class _Sign_Up_pageState extends State<Sign_Up_page> {
  checkemail() async {
    var res = await http_get("check_email", {
      "email": textfieldsStrings[2],
    });

    if (res.data == "yes") {
      if (_firstnamekey.currentState!.validate()) {
        if (_lastNamekey.currentState!.validate()) {
          if (_emailKey.currentState!.validate()) {
            if (_passwordKey.currentState!.validate()) {
              if (_confirmPasswordKey.currentState!.validate()) {
                if (checkedValue == false) {
                  buildSnackError(
                      'Agree to the Terms Of Use in order to continue',
                      context,
                      MediaQuery.of(context).size * 0.8);
                } else {
                  // List firstlist =[];
                  verification.sendOtp(textfieldsStrings[2]);
                  var data =
                      utf8.encode(textfieldsStrings[3]); // data being hashed
                  var hashvalue = sha1.convert(data);
                  print(hashvalue.toString());
                  // Navigator.push(
                  //     context,
                  //     MaterialPageRoute(
                  //         builder: (_) => email_page(
                  //               firstlist: [
                  //                 textfieldsStrings[0],
                  //                 textfieldsStrings[1],
                  //                 textfieldsStrings[2],
                  //                 hashvalue.toString(),
                  //               ],
                  //             )
                  //         ));
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (_) => Sign_Up_page_2(
                                firstlist: [
                                  textfieldsStrings[0],
                                  textfieldsStrings[1],
                                  textfieldsStrings[2],
                                  hashvalue.toString(),
                                ],
                              )));
                }
              }
            }
          }
        }
      }
    }
    if (res.data == "no") {
      buildSnackError('Sign up with another email,this one is taken', context,
          MediaQuery.of(context).size * 0.7);
    }
    setState(() {});
  }

  bool checkedValue = false;
  List textfieldsStrings = [
    "", //firstName
    "", //lastName
    "", //email
    "", //password
    "", //confirmPassword
  ];
  final _firstnamekey = GlobalKey<FormState>();
  final _lastNamekey = GlobalKey<FormState>();
  final _emailKey = GlobalKey<FormState>();
  final _passwordKey = GlobalKey<FormState>();
  final _confirmPasswordKey = GlobalKey<FormState>();

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
                        child: Align(
                          child: Text(
                            'Welcome',
                            style: GoogleFonts.satisfy(
                                color: Color(0xff132137),
                                fontSize: size.height * 0.04,
                                fontWeight: FontWeight.w500),
                          ),
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.only(top: size.height * 0.00),
                        child: Align(
                            child: Text(
                          'Let\'s Create your Account',
                          style: GoogleFonts.poppins(
                            color: Color(0xff132137),
                            fontSize: size.height * 0.025,
                            fontWeight: FontWeight.w500,
                          ),
                        )),
                      ),
                      Padding(
                        padding: EdgeInsets.only(top: size.height * 0.01),
                      ),
                      buildTextField(
                        "First Name",
                        Icons.person_outlined,
                        false,
                        size,
                        (valuename) {
                          if (valuename.length <= 2) {
                            buildSnackError(
                              'Invalid name',
                              context,
                              size,
                            );
                            return '';
                          }
                          return null;
                        },
                        _firstnamekey,
                        0,
                      ),
                      buildTextField(
                        "Last Name",
                        Icons.person_outlined,
                        false,
                        size,
                        (valuesurname) {
                          if (valuesurname.length <= 2) {
                            buildSnackError(
                              'Invalid last name',
                              context,
                              size,
                            );
                            return '';
                          }
                          return null;
                        },
                        _lastNamekey,
                        1,
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
                          2,
                        ),
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
                          3,
                        ),
                      ),
                      Form(
                        child: buildTextField(
                          "Confirm Passsword",
                          Icons.lock_outline,
                          true,
                          size,
                          (valuepassword) {
                            if (valuepassword != textfieldsStrings[3]) {
                              buildSnackError(
                                'Passwords must match',
                                context,
                                size,
                              );
                              return '';
                            }
                            return null;
                          },
                          _confirmPasswordKey,
                          4,
                        ),
                      ),
                      Padding(
                          padding: EdgeInsets.symmetric(
                            horizontal: size.width * 0.015,
                            vertical: size.height * 0.025,
                          ),
                          child: CheckboxListTile(
                            title: RichText(
                              textAlign: TextAlign.left,
                              text: TextSpan(
                                children: [
                                  TextSpan(
                                    text:
                                        "By checking this box , you agree to give us personal Information regarding your body and health , the Information will be used to provide you with the help you need . ",
                                    style: TextStyle(
                                        color:
                                            Color.fromARGB(255, 107, 102, 103),
                                        fontSize: size.height * 0.02,
                                        fontWeight: FontWeight.w800),
                                  ),
                                ],
                              ),
                            ),
                            activeColor: const Color(0xff7B6F72),
                            value: checkedValue,
                            onChanged: (newValue) {
                              setState(() {
                                checkedValue = newValue!;
                              });
                            },
                            controlAffinity: ListTileControlAffinity.leading,
                          )),
                      AnimatedPadding(
                        duration: const Duration(milliseconds: 500),
                        padding: EdgeInsets.only(top: size.height * 0.001),
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
                            onPressed: checkemail,
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
                        padding: EdgeInsets.only(top: size.height * 0.001),
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
                      RichText(
                        textAlign: TextAlign.left,
                        text: TextSpan(
                          children: [
                            TextSpan(
                              text: "Already have an Account? ",
                              style: TextStyle(
                                  color: Color(0xff132137),
                                  fontSize: size.height * 0.022,
                                  fontWeight: FontWeight.w600),
                            ),
                            WidgetSpan(
                              child: InkWell(
                                  onTap: () {
                                    Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                            builder: (_) => Log_in_page()));
                                  },
                                  child: Text(
                                    "Login",
                                    style: TextStyle(
                                        color:
                                            // Color.fromARGB(255, 71, 104, 158),
                                            Color.fromARGB(255, 71, 104, 158),
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

class verification {
  static EmailAuth emailAuth = new EmailAuth(
    sessionName: "Acute Login",
  );
  static late bool result;
  static void sendOtp(String s) async {
    result = await emailAuth.sendOtp(recipientMail: s, otpLength: 6);
  }

  static bool verify(String s1, String s2) {
    bool res = (emailAuth.validateOtp(recipientMail: s1, userOtp: s2));
    if (res) {
      return true;
    } else
      return false;
  }
}
