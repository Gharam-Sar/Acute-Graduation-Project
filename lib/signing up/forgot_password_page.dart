import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:flutter_verification_code/flutter_verification_code.dart';
import 'package:test1/signing%20up/new_password.dart';
import 'package:test1/signing%20up/sign_up_screen_1.dart';
import 'package:crypto/crypto.dart';

import '../http.dart';

class ForgotPasswordPage extends StatefulWidget {
  List firstlist;
  ForgotPasswordPage({Key? key, required this.firstlist}) : super(key: key);

  @override
  _ForgotPasswordPageState createState() => _ForgotPasswordPageState();
}

class _ForgotPasswordPageState extends State<ForgotPasswordPage> {
  String s = "";

  loginUserinfo() async {
    // Size size = MediaQuery.of(context).size;

    var result = await http_get("ID", {
      "first_name": textfieldsStrings[0],
      "last_name": textfieldsStrings[1],
      "email": email,
    });
    Size size = MediaQuery.of(context).size;
    s = result.data;
    print(s);
    setState(() {
      if (_onEditing)
        buildSnackError(
          'Please enter full code',
          context,
          size,
        );
      else {
        if (verification.verify(email, _code)) {
          Navigator.push(
              context,
              MaterialPageRoute(
                  builder: (_) => NewPasswordPage(firstlist: [s])));
        } else
          buildSnackError(
            'Code  must match',
            context,
            size,
          );
      }
    });
  }

  bool _onEditing = true;
  String _code = '';
  String email = '';
  List textfieldsStrings = [
    "", //first name
    "", // last name
  ];
  final _firstnamekey = GlobalKey<FormState>();
  final _lastNamekey = GlobalKey<FormState>();
  final _emailKey = GlobalKey<FormState>();

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
                        padding: EdgeInsets.symmetric(
                            horizontal: size.width * 0.025),
                        child: Row(
                          children: [
                            InkWell(
                              onTap: () =>
                                  Navigator.pop(context), //go back to authPage
                              child: Icon(
                                Icons.arrow_back,
                                color: Color.fromARGB(255, 181, 217, 240),
                                size: size.height * 0.03,
                              ),
                            ),
                            Padding(
                              padding: EdgeInsets.symmetric(
                                  horizontal: size.width * 0.02,
                                  vertical: size.height * 0.02),
                              child: Text(
                                'Back',
                                style: GoogleFonts.poppins(
                                    color: Color.fromARGB(255, 181, 217, 240),
                                    fontSize: size.height * 0.018,
                                    fontWeight: FontWeight.w600),
                              ),
                            ),
                          ],
                        ),
                      ),
                      Padding(
                        padding:
                            EdgeInsets.symmetric(vertical: size.width * 0.002),
                      ),
                      Padding(
                        padding: EdgeInsets.only(
                          top: size.height * 0.007,
                          left: size.width * 0.05,
                        ),
                        child: Align(
                          child: Text(
                            'Reset Your Password',
                            style: GoogleFonts.satisfy(
                                color: Color.fromARGB(255, 181, 217, 240),
                                fontSize: size.height * 0.035,
                                fontWeight: FontWeight.w500),
                          ),
                        ),
                      ),
                      Align(
                        child: Text(
                          "\nForgot your Password?\n That's okay, it happens to everyone!\nPlease provide your email to reset the password",
                          style: GoogleFonts.poppins(
                            color: Color.fromARGB(255, 255, 255, 255),
                            fontSize: size.height * 0.02,
                            fontWeight: FontWeight.w500,
                          ),
                          textAlign: TextAlign.center,
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.only(top: size.height * 0.008),
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
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          Form(
                            child: buildemailTextField(
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
                            ),
                          ),
                          Container(
                            padding: EdgeInsets.only(top: size.height * 0.024),
                            child: InkWell(
                              onTap: () {
                                verification.sendOtp(email);
                                if (verification.result) {
                                  buildSnackError(
                                    'You received a code via email.',
                                    context,
                                    size,
                                  );
                                } else
                                  buildSnackError(
                                    'send failed,Invalid Email',
                                    context,
                                    size,
                                  );
                              },
                              child: Icon(
                                Icons.send,
                                color: Color.fromARGB(255, 172, 184, 206),
                                size: 36.0,
                              ),
                            ),
                          ),
                        ],
                      ),
                      Padding(
                        padding: EdgeInsets.only(top: size.height * 0.02),
                      ),
                      Text(
                        "Enter the code you received via email",
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          color: Color.fromARGB(255, 181, 217, 240),
                          fontSize: size.height * 0.02,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                      VerificationCode(
                        length: 6,
                        underlineWidth: 2.5,
                        textStyle: TextStyle(
                            fontSize: 22,
                            color: Color.fromARGB(255, 255, 255, 255)),
                        underlineColor: Color.fromARGB(255, 255, 255, 255),
                        keyboardType: TextInputType.number,
                        underlineUnfocusedColor:
                            Color.fromARGB(255, 255, 255, 255),
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
                      AnimatedPadding(
                        duration: const Duration(milliseconds: 500),
                        padding: EdgeInsets.only(top: size.height * 0.02),
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
                                  Color.fromARGB(255, 172, 184, 206),
                                  Color.fromARGB(255, 123, 165, 228),
                                ],
                              ),
                              borderRadius: BorderRadius.circular(20)),
                          child: FlatButton(
                            onPressed: loginUserinfo,
                            child: Text(
                              'Send Instructions',
                              style: GoogleFonts.satisfy(
                                  color: Color(0xff132137),
                                  fontSize: size.width * 0.07,
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
                          'assets/others/logolightblue.png',
                          fit: BoxFit.cover,
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.only(top: size.height * 0.001),
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

  Widget buildemailTextField(
    String hintText,
    IconData icon,
    bool password,
    size,
    FormFieldValidator validator,
  ) {
    return Padding(
      padding:
          EdgeInsets.only(top: size.height * 0.025, left: size.height * 0.025),
      child: Container(
        width: size.width * 0.83,
        height: size.height * 0.058,
        decoration: BoxDecoration(
          color: const Color(0xffF7F8F8),
          borderRadius: const BorderRadius.all(Radius.circular(15)),
        ),
        child: Form(
          key: _emailKey,
          child: TextFormField(
            style: TextStyle(color: Color(0xff132137)),
            onChanged: (value) {
              setState(() {
                email = value;
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
                top: size.height * 0.01,
              ),
              hintText: hintText,
              prefixIcon: Padding(
                padding: EdgeInsets.only(
                  top: size.height * 0.008,
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
        duration: const Duration(seconds: 2),
        backgroundColor: Color(0xff132137),
        content: SizedBox(
          height: size.height * 0.02,
          child: Center(
            child: Text(error),
          ),
        ),
      ),
    );
  }
}
