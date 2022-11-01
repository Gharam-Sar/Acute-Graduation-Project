import 'dart:ffi';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:test1/signing%20up/log_in_screen.dart';

import 'package:flutter/cupertino.dart';
import 'package:test1/signing%20up/sign_up_screen_3.dart';

int gender = 0;
double activitylevel = 0;

class Sign_Up_page_2 extends StatefulWidget {
  List firstlist;
  Sign_Up_page_2({Key? key, required this.firstlist}) : super(key: key);

  @override
  _Sign_Up_page_2State createState() => _Sign_Up_page_2State();
}

class _Sign_Up_page_2State extends State<Sign_Up_page_2> {
  final TextEditingController txt = TextEditingController();
  DateTime dateTime = DateTime.now();
  bool checkedValueMale = false;
  bool checkedValueFemale = false;

  List textfieldsStrings2 = [
    "", //weight
    "", //height
    "", //age
    "", //activitylevel
    "", //gender
  ];
  final _weightkey = GlobalKey<FormState>();
  final _heightkey = GlobalKey<FormState>();
  final _ageKey = GlobalKey<FormState>();

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
                      ),
                      Padding(
                        padding: EdgeInsets.only(top: size.height * 0.01),
                        child: Align(
                            child: Text(
                          'Let\'s Get your Profile Ready',
                          textAlign: TextAlign.center,
                          style: GoogleFonts.poppins(
                            color: Color(0xff132137),
                            fontSize: size.height * 0.025,
                            fontWeight: FontWeight.w500,
                          ),
                        )),
                      ),
                      Padding(
                        padding: EdgeInsets.only(top: size.height * 0.00),
                      ),
                      buildTextField(
                        "Weight",
                        Icons.accessibility_new_outlined,
                        false,
                        size,
                        (valueWeight) {
                          if (valueWeight.length > 3) {
                            buildSnackError(
                              'Invalid Weight',
                              context,
                              size,
                            );
                            return '';
                          }
                          return null;
                        },
                        _weightkey,
                        0,
                      ),
                      buildTextField(
                        "Height",
                        Icons.accessibility_new_outlined,
                        false,
                        size,
                        (valueHeight) {
                          if (valueHeight.length > 3) {
                            buildSnackError(
                              'Invalid Height',
                              context,
                              size,
                            );
                            return '';
                          }
                          return null;
                        },
                        _heightkey,
                        1,
                      ),
                      buildDateField(
                        "Tab the icon to choose your Date of Birth",
                        false,
                        size,
                        (valuedate) {
                          if (valuedate.length < 9) {
                            buildSnackError(
                              'Tab the icon to choose your Date of Birth',
                              context,
                              size,
                            );
                            return '';
                          }
                          OnTap() {
                            buildSnackError(
                              'Tab the icon to choose your Date of Birth',
                              context,
                              size,
                            );
                            return '';
                          }

                          return null;
                        },
                        _ageKey,
                        2,
                      ),
                      Padding(
                        padding: EdgeInsets.only(bottom: size.height * 0.03),
                      ),
                      Padding(
                        padding: EdgeInsets.only(bottom: size.height * 0.01),
                        child: MyStatefulWidget(),
                      ),
                      Padding(
                        padding: EdgeInsets.only(
                            top: size.height * 0.01,
                            left: size.height * 0.02,
                            right: size.height * 0.02),
                        child: Align(
                            child: Text(
                          'Descripe the Level of your Physical Activity',
                          style: GoogleFonts.poppins(
                              color: Color.fromARGB(255, 71, 104, 158),
                              fontSize: size.height * 0.02,
                              fontWeight: FontWeight.w600),
                          textAlign: TextAlign.center,
                        )),
                      ),
                      Padding(
                        padding: EdgeInsets.only(bottom: size.height * 0.0),
                        child: SliderScreen(),
                      ),
                      AnimatedPadding(
                        duration: const Duration(milliseconds: 500),
                        padding: EdgeInsets.only(top: size.height * 0.025),
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
                            onPressed: () {
                              if (gender == 0) {
                                buildSnackError(
                                    'please select your Gender', context, size);
                              } else if (gender == 1) {
                                checkedValueFemale = true;
                                textfieldsStrings2[4] = 1;
                              } else if (gender == 2) {
                                checkedValueMale = true;
                                textfieldsStrings2[4] = 0;
                              }
                              textfieldsStrings2[3] = activitylevel;
                              if (_weightkey.currentState!.validate()) {
                                if (_heightkey.currentState!.validate()) {
                                  if (_ageKey.currentState!.validate()) {
                                    if (checkedValueFemale ||
                                        checkedValueMale) {
                                      Navigator.push(
                                          context,
                                          MaterialPageRoute(
                                              builder: (_) => Sign_Up_page_3(
                                                    firstlist: [
                                                      widget.firstlist[
                                                          0], //firstname
                                                      widget.firstlist[
                                                          1], //lastname
                                                      widget
                                                          .firstlist[2], //email
                                                      widget.firstlist[
                                                          3], //password
                                                      textfieldsStrings2[
                                                          0], //weight
                                                      textfieldsStrings2[
                                                          1], //height
                                                      textfieldsStrings2[
                                                          2], //date
                                                      textfieldsStrings2[
                                                          3], //activitylevel
                                                      textfieldsStrings2[
                                                          4], //gender
                                                    ],
                                                  )));
                                    } else {
                                      buildSnackError(
                                          'Make sure all fields are filled ',
                                          context,
                                          size);
                                    }
                                  }
                                }
                              }
                            },
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
                        padding: EdgeInsets.only(top: size.height * 0.000),
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
                textfieldsStrings2[stringToEdit] = value;
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

  Widget buildDateField(
    String hintText,
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
            readOnly: true,
            controller: txt,
            onChanged: (value) {
              setState(() {});
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
                  top: size.height * 0.00,
                ),
                child: IconButton(
                  color: const Color(0xff7B6F72),
                  onPressed: () {
                    Utils.showSheet(
                      context,
                      child: buildDatePicker(),
                      onClicked: () {
                        final value = DateFormat('yyyy-MM-dd').format(dateTime);

                        txt.text = value;
                        print("date");
                        print(value);
                        textfieldsStrings2[2] = value;
                        Navigator.pop(context);
                      },
                    );
                  },
                  icon: Icon(Icons.date_range_rounded),
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

  Widget buildDatePicker() => SizedBox(
        height: 180,
        child: CupertinoDatePicker(
          minimumYear: 1900,
          maximumYear: DateTime.now().year,
          initialDateTime: dateTime,
          mode: CupertinoDatePickerMode.date,
          onDateTimeChanged: (dateTime) =>
              setState(() => this.dateTime = dateTime),
        ),
      );
}

class Utils {
  static List<Widget> modelBuilder<M>(
          List<M> models, Widget Function(int index, M model) builder) =>
      models
          .asMap()
          .map<int, Widget>(
              (index, model) => MapEntry(index, builder(index, model)))
          .values
          .toList();

  /// Alternativaly: You can display an Android Styled Bottom Sheet instead of an iOS styled bottom Sheet
  // static void showSheet(
  //   BuildContext context, {
  //   required Widget child,
  // }) =>
  //     showModalBottomSheet(
  //       context: context,
  //       builder: (context) => child,
  //     );

  static void showSheet(
    BuildContext context, {
    required Widget child,
    required VoidCallback onClicked,
  }) =>
      showCupertinoModalPopup(
        context: context,
        builder: (context) => CupertinoActionSheet(
          actions: [
            child,
          ],
          cancelButton: CupertinoActionSheetAction(
            child: Text('Done'),
            onPressed: onClicked,
          ),
        ),
      );

  static void showSnackBar(BuildContext context, String text) {
    final snackBar = SnackBar(
      content: Text(text, style: TextStyle(fontSize: 24)),
    );

    ScaffoldMessenger.of(context)
      ..removeCurrentSnackBar()
      ..showSnackBar(snackBar);
  }
}

class MyStatefulWidget extends StatefulWidget {
  const MyStatefulWidget() : super();
  @override
  State<MyStatefulWidget> createState() => _MyStatefulWidgetState();
}

/// This is the private State class that goes with MyStatefulWidget.
class _MyStatefulWidgetState extends State<MyStatefulWidget> {
  int value = 0;

  Widget CustomRadioButton(String text, int index) {
    return OutlineButton(
      onPressed: () {
        setState(() {
          value = index;
          gender = index;
          print(value);
        });
      },
      child: Text(
        text,
        style: TextStyle(
          fontSize: MediaQuery.of(context).size.width * 0.05,
          color: (value == index)
              ? Color.fromARGB(255, 71, 104, 158)
              : Color(0xff132137),
        ),
      ),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
      borderSide: BorderSide(
        width: MediaQuery.of(context).size.width * 0.008,
        color: (value == index)
            ? Color.fromARGB(255, 71, 104, 158)
            : Color(0xff132137),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Padding(
          padding: EdgeInsets.only(
              right: MediaQuery.of(context).size.height * 0.125),
        ),
        CustomRadioButton("Female", 1),
        Padding(
          padding:
              EdgeInsets.only(right: MediaQuery.of(context).size.height * 0.01),
        ),
        CustomRadioButton("Male", 2),
      ],
    );
  }
}

class SliderScreen extends StatefulWidget {
  @override
  State<SliderScreen> createState() => _SliderScreenState();
}

class _SliderScreenState extends State<SliderScreen> {
  RangeValues values = RangeValues(1, 100);
  RangeLabels labels = RangeLabels('1', "100");
  int divisions = 4;
  List strLabels = ["Not Active", "", "Avarage", "", "Athlete"];

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: ListView(
        shrinkWrap: true,
        children: [
          Container(
            width: MediaQuery.of(context).size.width * .95,
            child: Column(
              children: [
                SliderTheme(
                  data: SliderThemeData(
                    trackHeight: MediaQuery.of(context).size.height * 0.015,
                  ),
                  child: RangeSlider(
                    divisions: divisions,
                    activeColor: Color(0xff132137),
                    inactiveColor: Color.fromARGB(255, 71, 104, 158),
                    min: 1,
                    max: 100,
                    values: values,
                    labels: labels,
                    onChanged: (value) {
                      print(" ${value.end}");

                      setState(() {
                        values = value;
                        activitylevel = value.end;
                        labels = RangeLabels(
                            "No physical Activity", "Your physical Activity"
                            //    "${value.start.toInt().toString()}\$"
                            );
                      });
                    },
                  ),
                ),
                Padding(
                  padding: EdgeInsets.symmetric(
                      horizontal: MediaQuery.of(context).size.width * 0.02),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: strLabels.map((i) {
                      return Text(
                        '$i',
                        style: TextStyle(
                            color: Color.fromARGB(255, 71, 104, 158),
                            fontSize: MediaQuery.of(context).size.height * 0.02,
                            fontWeight: FontWeight.w500),
                      );
                    }).toList(),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
