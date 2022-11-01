import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';
import 'package:flutter/material.dart';
import 'package:percent_indicator/percent_indicator.dart';
import 'package:velocity_x/velocity_x.dart';

import '../../http.dart';
import 'package:age_calculator/age_calculator.dart';

class calorie_calc extends StatefulWidget {
  List firstlist;
  List meal_amount;
  List Meals;
  calorie_calc(
      {Key? key,
      required this.firstlist,
      required this.meal_amount,
      required this.Meals})
      : super(key: key);
  @override
  _calorie_calcState createState() => _calorie_calcState();
}

class _calorie_calcState extends State<calorie_calc> {
  double eaten = 0;
  double goal = 2000;
  getgoal() async {
    double e = 0;
    double am = 0;
    var res = await http_get("getgoal", {"id": widget.firstlist[0]});
    for (int n = 0; n < widget.Meals.length; n++) {
      List l = widget.Meals[n].split("^");

      double d = double.parse(widget.meal_amount[n]);
      am = (d * double.parse(l[1])) / 100;

      e = e + am;
    }
    eaten = e;

    setState(() {
      goal = double.parse(res.data);
    });
  }

  @override
  void initState() {
    // TODO: implement initState
    getgoal();

    super.initState();
  }

  TextEditingController _textFieldController = TextEditingController();

  String codeDialog = "";
  String valueText = "";
  @override
  Widget build(BuildContext context) {
    var now = new DateTime.now();
    var formatter = new DateFormat('yyyy-MM-dd');
    String formattedDate = formatter.format(now);
    Size size = MediaQuery.of(context).size;

    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        backgroundColor: Color.fromARGB(255, 181, 217, 240),
        elevation: 1,
        leading: IconButton(
          icon: Icon(
            Icons.arrow_back,
            color: Color.fromARGB(255, 181, 217, 240),
          ),
          onPressed: () {
            //   Navigator.pop(context);
          },
        ),
        title: Text(
          formattedDate,
          style: TextStyle(
              color: Color.fromARGB(255, 19, 33, 55),
              fontSize: size.width * 0.057,
              fontWeight: FontWeight.w500),
        ),
      ),
      body: SingleChildScrollView(
        child: Stack(
          children: [
            Opacity(
              opacity: 0.5,
              child: ClipPath(
                clipper: WaveClipper(),
                child: Container(
                  color: Color.fromARGB(255, 181, 217, 240),
                  height: size.height * 0.5,
                  alignment: Alignment.center,
                ),
              ),
            ),
            ClipPath(
              clipper: WaveClipper(),
              child: Container(
                padding: EdgeInsets.only(
                  bottom: size.height * 0.09,
                ),
                child: CircularPercentIndicator(
                  radius: size.width * 0.32,
                  lineWidth: size.width * 0.055,
                  progressColor: Color(0xff132137),
                  backgroundColor: Color(0xff132137).withAlpha(50),
                  percent: calc(eaten, goal),
                  circularStrokeCap: CircularStrokeCap.round,
                  center: Column(
                    children: [
                      Padding(
                          padding: EdgeInsets.only(
                        bottom: size.height * 0.09,
                      )),
                      Text(
                        "Goal",
                        style: TextStyle(
                            color: Color.fromARGB(255, 9, 78, 153),
                            fontSize: size.width * 0.05,
                            fontWeight: FontWeight.w600),
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.baseline,
                        textBaseline: TextBaseline.alphabetic,
                        children: <Widget>[
                          Text(
                            goal.toString(),
                            style: TextStyle(
                                color: Color.fromARGB(255, 19, 33, 55),
                                fontSize: size.width * 0.055,
                                fontWeight: FontWeight.w500),
                          ),
                          Text(
                            "Kcal",
                            style: TextStyle(
                                fontSize: size.height * 0.02,
                                color: Color(0xFF8D8E98),
                                fontWeight: FontWeight.w600),
                          ),
                        ],
                      ),
                      Padding(
                          padding: EdgeInsets.only(
                        bottom: size.height * 0.01,
                      )),
                      Text(
                        "Just a bit more",
                        style: TextStyle(
                            color: Color.fromARGB(255, 9, 78, 153),
                            fontSize: size.width * 0.045,
                            fontWeight: FontWeight.w600),
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.baseline,
                        textBaseline: TextBaseline.alphabetic,
                        children: <Widget>[
                          if (eaten < goal) ...[
                            Text(
                              (goal - eaten).toString(),
                              style: TextStyle(
                                  color: Color.fromARGB(255, 19, 33, 55),
                                  fontSize: size.width * 0.057,
                                  fontWeight: FontWeight.w500),
                            ),
                          ] else ...[
                            Text(
                              0.toString(),
                              style: TextStyle(
                                  color: Color.fromARGB(255, 19, 33, 55),
                                  fontSize: size.width * 0.057,
                                  fontWeight: FontWeight.w500),
                            ),
                          ],
                          Text(
                            "Kcal",
                            style: TextStyle(
                                fontSize: size.height * 0.02,
                                color: Color(0xFF8D8E98),
                                fontWeight: FontWeight.w600),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
                color: Color.fromARGB(255, 181, 217, 240),
                height: size.height * 0.485,
                alignment: Alignment.center,
              ),
            ),
            Column(
              children: [
                Padding(
                    padding: EdgeInsets.all(
                  size.height * 0.25,
                )),
                Text(
                  "Your Calories can be altered if you have any plan",
                  textAlign: TextAlign.center,
                  style: TextStyle(
                      color: Color.fromARGB(255, 9, 78, 153),
                      fontSize: size.width * 0.045,
                      fontWeight: FontWeight.w600),
                ).py24(),
                AnimatedPadding(
                  duration: const Duration(milliseconds: 500),
                  padding: EdgeInsets.only(
                      top: size.height * 0.025,
                      left: size.height * 0.07,
                      right: size.height * 0.07),
                  child: Container(
                    height: size.height * 0.087,
                    width: size.width,
                    decoration: BoxDecoration(
                        color: Color.fromARGB(255, 181, 217, 240),
                        borderRadius: BorderRadius.circular(30)),
                    child: FlatButton(
                      onPressed: () {
                        showAlertDialog(context);
                      },
                      child: Text(
                        'Set your goal',
                        style: GoogleFonts.satisfy(
                            color: Color(0xff132137),
                            fontSize: size.width * 0.08,
                            fontWeight: FontWeight.w500),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  set_goal() async {
    var result3 = await http_post("goal", {
      "id": widget.firstlist[0],
      "goal": goal,
    });
    print(result3.data);
  }

  showAlertDialog(BuildContext context) {
    showDialog(
        context: context,
        builder: (BuildContext context) {
          return Dialog(
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(30.0)), //this right here
            child: Container(
              height: MediaQuery.of(context).size.height * 0.5,
              child: Padding(
                padding:
                    EdgeInsets.all(MediaQuery.of(context).size.height * 0.02),
                child: Column(
                  // mainAxisAlignment: MainAxisAlignment.center,
                  // crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(
                        height: MediaQuery.of(context).size.height * 0.007),
                    IconButton(
                      icon: Icon(
                        Icons.close,
                        color: Color(0xff132137),
                      ),
                      onPressed: () {
                        _textFieldController.clear();
                        Navigator.pop(context);
                      },
                    ),
                    Text(
                      'Set your calorie needs',
                      textAlign: TextAlign.center,
                      style: GoogleFonts.poppins(
                        color: Color.fromARGB(255, 9, 78, 153),
                        fontSize: MediaQuery.of(context).size.height * 0.02,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                    TextField(
                      keyboardType: TextInputType.number,
                      style: TextStyle(
                          color: Color.fromARGB(255, 28, 48, 82),
                          fontSize: MediaQuery.of(context).size.width * 0.05,
                          fontWeight: FontWeight.w500),
                      onChanged: (value) {
                        setState(() {
                          valueText = value;
                        });
                      },
                      controller: _textFieldController,
                      decoration: InputDecoration(hintText: ""),
                    ).py(12),
                    InkWell(
                      onTap: () async {
                        await set_info();
                        _textFieldController.text = g.toString();
                        valueText = g.toString();
                      },
                      child: Text(
                          'go with default option depending on your weight',
                          textAlign: TextAlign.center,
                          style: GoogleFonts.poppins(
                            color: Color.fromARGB(255, 9, 78, 153),
                            decoration: TextDecoration.underline,
                            fontSize: MediaQuery.of(context).size.height * 0.02,
                            fontWeight: FontWeight.w600,
                          )),
                    ),
                    SizedBox(
                        height: MediaQuery.of(context).size.height * 0.033),
                    AnimatedPadding(
                      duration: const Duration(milliseconds: 500),
                      padding: EdgeInsets.only(
                          top: MediaQuery.of(context).size.height * 0.025,
                          left: MediaQuery.of(context).size.height * 0.07,
                          right: MediaQuery.of(context).size.height * 0.07),
                      child: Container(
                        height: MediaQuery.of(context).size.height * 0.07,
                        width: MediaQuery.of(context).size.width * 0.42,
                        decoration: BoxDecoration(
                            color: Color.fromARGB(255, 181, 217, 240),
                            borderRadius: BorderRadius.circular(20)),
                        child: FlatButton(
                          onPressed: () {
                            setState(() {
                              goal = double.parse(valueText);
                            });
                            set_goal();
                            _textFieldController.clear();

                            Navigator.pop(context);
                          },
                          child: Text(
                            'Save',
                            style: TextStyle(
                                color: Color(0xff132137),
                                fontSize:
                                    MediaQuery.of(context).size.width * 0.07,
                                fontWeight: FontWeight.w500),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          );
        });
  }

  int g = 0;

  double weight = 0;
  double Height = 0;
  bool checkedValueMale = false;
  bool checkedValueFemale = false;
  double activity = 0;
  double BMR = 0;
  double AMR = 0;
  String date = '';
  int age = 0;
  List<String> myinfo = [];
  List<String> myinfo2 = [];

  set_info() async {
    var result = await http_get("info", {
      "id": widget.firstlist[0],
    });
    var result2 = await http_get("accountinfo", {
      "id": widget.firstlist[0],
    });

    myinfo2 = result2.data.split("&");

    var d = myinfo2[3].split('T');
    date = d[0];
    DateTime dt = DateTime.parse(date);
    DateDuration duration;
    duration = AgeCalculator.age(dt);
    List temp = duration.toString().split(",");
    List years = temp[0].toString().split(":");
    age = int.parse(years[1]);
    myinfo = result.data.split("&");

    if (myinfo[0] == '1') {
      checkedValueFemale = true;
      checkedValueMale = false;
    }
    if (myinfo[0] == '0') {
      checkedValueMale = true;
      checkedValueFemale = false;
    }
    activity = double.parse(myinfo[3]);
    Height = double.parse(myinfo[1]);
    weight = double.parse(myinfo[2]);
    if (checkedValueFemale) {
      BMR = 655.1 + (9.563 * weight) + (1.850 * Height) - (4.676 * age);
    } else if (checkedValueMale) {
      BMR = 66.47 + (13.75 * weight) + (5.003 * Height) - (6.755 * age);
    }
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
      g = AMR.toInt();
    });
  }
}

class WaveClipper extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    debugPrint(size.width.toString());
    var path = new Path();
    path.lineTo(0, size.height);
    var firstStart = Offset(size.width / 5, size.height);
    var firstEnd = Offset(size.width / 2.25, size.height - 50.0);
    path.quadraticBezierTo(
        firstStart.dx, firstStart.dy, firstEnd.dx, firstEnd.dy);
    var secondStart =
        Offset(size.width - (size.width / 3.24), size.height - 105);
    var secondEnd = Offset(size.width, size.height - 40.0);
    path.quadraticBezierTo(
        secondStart.dx, secondStart.dy, secondEnd.dx, secondEnd.dy);
    path.lineTo(size.width, 0);
    path.close();
    return path;
  }

  @override
  bool shouldReclip(covariant CustomClipper<Path> oldClipper) {
    return true;
  }
}

double calc(double e, double goal) {
  double d2;
  if (e > goal)
    d2 = 1;
  else {
    double d = ((goal - e) / goal);
    d2 = 1 - d;
  }
  return d2;
}
