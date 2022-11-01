import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:test1/http.dart';
import 'package:test1/signing%20up/forgot_password_page.dart';

import 'package:crypto/crypto.dart';
import 'dart:convert';

class resete_password_page extends StatefulWidget {
  List firstlist;
  resete_password_page({Key? key, required this.firstlist}) : super(key: key);

  @override
  _resete_password_pageState createState() => _resete_password_pageState();
}

String password = '';
bool from_setting = false;

class _resete_password_pageState extends State<resete_password_page> {
  get_password() async {
    var result = await http_get("userpassword", {
      "id": widget.firstlist[0],
    });

    password = result.data.replaceAll(RegExp('[^A-Za-z0-9]'), '');
    setState(() {});
  }

  changepassword() async {
    var data = utf8.encode(textfieldsStrings[1]); // data being hashed
    var hashvalue = sha1.convert(data);

    var result = await http_post("change-password", {
      "id": widget.firstlist[0],
      "password": hashvalue.toString(),
    });

    setState(() {});
  }

  List textfieldsStrings = [
    "", //currentpassword
    "", //newpassword
    "", //confirmPassword
  ];
  final _currentpasswordKey = GlobalKey<FormState>();
  final _passwordKey = GlobalKey<FormState>();
  final _confirmPasswordKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
        resizeToAvoidBottomInset: false,
        appBar: AppBar(
          backgroundColor: Color.fromARGB(255, 181, 217, 240),
          toolbarHeight: MediaQuery.of(context).size.height * 0.11,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.vertical(
              bottom: Radius.circular(30),
            ),
          ),
          elevation: 1,
          leading: IconButton(
            icon: Icon(
              Icons.arrow_back,
              color: Color.fromARGB(255, 19, 33, 55),
            ),
            onPressed: () {
              Navigator.pop(context);
            },
          ),
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
          actions: [
            IconButton(
              icon: Icon(
                Icons.settings,
                color: Color.fromARGB(255, 181, 217, 240),
              ),
              onPressed: () {
                Navigator.pop(context);
              },
            ),
          ],
        ),
        body: Container(
          color: Color.fromARGB(245, 245, 245, 245),
          padding: EdgeInsets.only(
              left: size.height * 0.04, right: size.height * 0.04),
          child: GestureDetector(
              onTap: () {
                FocusScope.of(context).unfocus();
              },
              child: ListView(children: [
                Padding(
                  padding: EdgeInsets.only(
                    top: MediaQuery.of(context).size.height * 0.06,
                  ),
                ),
                Text(
                  "Reset Your Password",
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: MediaQuery.of(context).size.width * 0.064,
                    fontWeight: FontWeight.w600,
                    color: Color(0xff132137),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(
                    top: MediaQuery.of(context).size.height * 0.03,
                  ),
                ),
                Form(
                  child: buildTextField(
                    "Current Passsword",
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
                    _currentpasswordKey,
                    0,
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(
                    top: MediaQuery.of(context).size.height * 0.007,
                  ),
                ),
                Form(
                  child: buildTextField(
                    "New Passsword",
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
                  padding: EdgeInsets.only(
                    top: MediaQuery.of(context).size.height * 0.007,
                  ),
                ),
                Form(
                  child: buildTextField(
                    "Confirm New Passsword",
                    Icons.lock_outline,
                    true,
                    size,
                    (valuepassword) {
                      if (valuepassword != textfieldsStrings[1]) {
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
                    2,
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(top: size.height * 0.02),
                ),
                InkWell(
                  onTap: () {
                    from_setting = true;
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => ForgotPasswordPage(
                              firstlist: [widget.firstlist[0]])),
                    );
                  },
                  child: Text(
                    "Forgot your Password?",
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      color: Color(0xff132137),
                      decoration: TextDecoration.underline,
                      fontSize: size.height * 0.022,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ),
                AnimatedPadding(
                  duration: const Duration(milliseconds: 500),
                  padding: EdgeInsets.only(top: size.height * 0.07),
                  child: Container(
                    height: size.height * 0.077,
                    width: size.width * 0.77,
                    decoration: BoxDecoration(
                        color: Color.fromARGB(255, 181, 217, 240),
                        borderRadius: BorderRadius.circular(20)),
                    child: FlatButton(
                      onPressed: () async {
                        get_password();
                        var data = utf8
                            .encode(textfieldsStrings[0]); // data being hashed
                        var hashvalue = sha1.convert(data).toString();

                        String h = hashvalue;

                        if (_passwordKey.currentState!.validate()) {
                          if (_confirmPasswordKey.currentState!.validate()) {
                            if (password == h) {
                              changepassword();
                              Navigator.pop(context);
                            } else
                              buildSnackError(
                                  "The current password is incorrect!",
                                  context,
                                  size);
                          }
                        }
                      },
                      child: Text(
                        'Reset Password',
                        style: GoogleFonts.satisfy(
                            color: Color(0xff132137),
                            fontSize: size.width * 0.07,
                            fontWeight: FontWeight.w500),
                      ),
                    ),
                  ),
                ),
              ])),
        ));
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
        height: size.height * 0.06,
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
                color: Color.fromARGB(255, 71, 104, 158),
              ),
              contentPadding: EdgeInsets.only(
                top: size.height * 0.02,
              ),
              hintText: hintText,
              prefixIcon: Padding(
                padding: EdgeInsets.only(
                  top: size.height * 0.005,
                ),
                child: Icon(
                  icon,
                  color: Color.fromARGB(255, 71, 104, 158),
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
                                color: Color.fromARGB(255, 71, 104, 158),
                              )
                            : const Icon(
                                Icons.visibility_outlined,
                                color: Color.fromARGB(255, 71, 104, 158),
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
