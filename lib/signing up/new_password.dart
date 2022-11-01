import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';
import 'package:test1/main_application/custom_drawer/reset_password.dart';

import 'package:test1/signing%20up/log_in_screen.dart';
import '../http.dart';
import 'package:crypto/crypto.dart';
import 'dart:convert';

import '../main_application/navigation_home_screen.dart';

class NewPasswordPage extends StatefulWidget {
  List firstlist;
  NewPasswordPage({Key? key, required this.firstlist}) : super(key: key);

  @override
  _NewPasswordPageState createState() => _NewPasswordPageState();
}

class _NewPasswordPageState extends State<NewPasswordPage> {
  List m = [];
  List m2 = [];
  List meal_id = [];
  List meal_index = [];
  List date = [];
  List j = [];

  List Meals = [];
  List indexx = [];
  List amount = [];
  List meal_amount = [];
  List images = [];
  show_meals(String id) async {
    setState(() {});
  }

  changepassword() async {
    var data = utf8.encode(textfieldsStrings[0]); // data being hashed
    var hashvalue = sha1.convert(data);

    var result = await http_post("change-password", {
      "id": widget.firstlist[0],
      "password": hashvalue.toString(),
    });

    setState(() {});
  }

  List textfieldsStrings = [
    "", //password
    "", //confirmPassword
  ];
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
                            EdgeInsets.symmetric(vertical: size.width * 0.02),
                      ),
                      Padding(
                        padding: EdgeInsets.only(
                          top: size.height * 0.05,
                          left: size.width * 0.05,
                        ),
                        child: Align(
                          child: Text(
                            'Reset Your Password',
                            style: GoogleFonts.satisfy(
                                color: Color.fromARGB(255, 181, 217, 240),
                                fontSize: size.height * 0.04,
                                fontWeight: FontWeight.w500),
                          ),
                        ),
                      ),
                      Padding(
                        padding:
                            EdgeInsets.symmetric(vertical: size.width * 0.01),
                      ),
                      Align(
                        child: Text(
                          "\n The information you provided has been verified , you can now set a new password",
                          style: GoogleFonts.poppins(
                            color: Color.fromARGB(255, 255, 255, 255),
                            fontSize: size.height * 0.025,
                            fontWeight: FontWeight.w500,
                          ),
                          textAlign: TextAlign.center,
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
                          0,
                        ),
                      ),
                      Form(
                        child: buildTextField(
                          "Confirm New Passsword",
                          Icons.lock_outline,
                          true,
                          size,
                          (valuepassword) {
                            if (valuepassword != textfieldsStrings[0]) {
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
                          1,
                        ),
                      ),
                      AnimatedPadding(
                        duration: const Duration(milliseconds: 500),
                        padding: EdgeInsets.only(top: size.height * 0.06),
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
                            onPressed: () async {
                              if (_passwordKey.currentState!.validate()) {
                                if (_confirmPasswordKey.currentState!
                                    .validate()) {
                                  changepassword();
                                  if (from_setting) {
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

                                    List<String> d1 =
                                        date1.toString().split(" ");

                                    for (int l = 0; l < date.length; l++) {
                                      final DateTime date2 =
                                          DateTime.parse(date[l]);
                                      List<String> d2 =
                                          date2.toString().split(" ");

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
                                      var result =
                                          await http_get("getmealname", {
                                        "id": meal_id[j[l]],
                                      });
                                      if (Meals.isEmpty ||
                                          Meals.length < j.length) {
                                        Meals.add(result.data);
                                      }
                                    }

                                    var result4 = await http_get("bodyinfo", {
                                      "id": widget.firstlist[0],
                                    });

                                    var arr = result4.data.split(' ');
                                    String weight = arr[0];
                                    String height = arr[1];
                                    String gender = arr[2];
                                    String name = arr[3];
                                    String datef = DateFormat('yyyy-MM-dd')
                                        .format(DateTime.now());
                                    print(datef);
                                    var result5 = await http_get("getimages", {
                                      "date": datef,
                                    });

                                    List arrrr =
                                        result5.data.split("\"linklinklink");
                                    for (int lll = 0;
                                        lll < arrrr.length;
                                        lll++) {
                                      String ttt = arrrr[lll]
                                          .toString()
                                          .replaceAll(" ", "");
                                      images.add(ttt);
                                    }
                                    Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                            builder: (_) =>
                                                NavigationHomeScreen(
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
                                    Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                            builder: (_) => Log_in_page()));
                                }
                              }
                            },
                            child: Text(
                              'Reset Password',
                              style: GoogleFonts.satisfy(
                                  color: Color(0xff132137),
                                  fontSize: size.width * 0.08,
                                  fontWeight: FontWeight.w500),
                            ),
                          ),
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.only(top: size.height * 0.03),
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
        height: size.height * 0.06,
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
                top: size.height * 0.02,
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
