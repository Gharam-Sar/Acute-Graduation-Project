import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'package:google_fonts/google_fonts.dart';
import 'package:test1/http.dart';
import 'package:test1/main_application/home_page/timers/water_plan_1.dart';
import 'package:test1/main_application/home_page/timers/water_plan_2.dart';
import 'package:test1/main_application/home_page/timers/water_plan_3.dart';

String id = "";
String weight = "";

String activity_level = "";

class water_timers extends StatefulWidget {
  List firstlist;
  water_timers({Key? key, this.animationController, required this.firstlist})
      : super(key: key);

  final AnimationController? animationController;
  @override
  _water_timersState createState() => _water_timersState();
}

class _water_timersState extends State<water_timers> {
  waterUserinfo(int i) async {
    var result = await http_get("waterinfo", {
      "id": widget.firstlist[0],
    });

    var arr = result.data.split(' ');
    weight = arr[0];
    activity_level = arr[1];

    if (i == 0) {
      num ww = double.parse(weight) * 1000;
      double div = 30.0;
      num water_amount = ww ~/ div;
      var drink_amount = water_amount ~/ 5;
      Navigator.push(
          context,
          MaterialPageRoute(
              builder: (_) => water_plan_1(
                    firstlist: [id, weight, activity_level, drink_amount],
                  )));
    }
    if (i == 1) {
      num ww = double.parse(weight) * 1000;
      double div = 30.0;
      num water_amount = ww ~/ div;
      water_amount += 500;
      var drink_amount = water_amount ~/ 5;
      Navigator.push(
          context,
          MaterialPageRoute(
              builder: (_) => water_plan_2(
                    firstlist: [id, weight, activity_level, drink_amount],
                  )));
    }
    if (i == 2) {
      int activity_levell = 0;
      if (activity_level == "1") activity_levell = 0;
      if (activity_level == "26") activity_levell = 1;
      if (activity_level == "51") activity_levell = 2;
      if (activity_level == "75") activity_levell = 3;
      if (activity_level == "100") activity_levell = 4;
      num ww = double.parse(weight) * 1000;
      double div = 30.0;
      num water_amount = ww ~/ div;
      print(activity_level);
      for (int i = 0; i <= activity_levell; i++) water_amount += 350;

      var drink_amount = water_amount ~/ 5;
      Navigator.push(
          context,
          MaterialPageRoute(
              builder: (_) => water_plan_3(
                    firstlist: [id, weight, activity_level, drink_amount],
                  )));
    }
    setState(() {});
  }

  TimeOfDay selectedTime = TimeOfDay.now();
  final ScrollController scrollController = ScrollController();
  double topBarOpacity = 0.0;

  int plan_num = 0;

  List checked_plan = [false, false, false];
  List plan_name = [
    "Normal intake \nPlan",
    "Extra intake \nPlan",
    "Workout Hydration plan"
  ];
  List plan_desc = [
    "This plan will ensure you \nget the needed \namount of water \nwith no additions ",
    "This plan will ensure you \nget the needed amount\nof water and more \nto be extra hydrated ",
    "This plan will ensure you \nget your needed \namount of water based \non your activity level",
  ];
  List size_glasses = [200, 250, 500];
  List plan_glasses = ["00:00", "00:00", "00:00"];

  Duration initialtimer = new Duration();

  String time = "";
  @override
  void initState() {
    scrollController.addListener(() {
      if (scrollController.offset >= 24) {
        if (topBarOpacity != 1.0) {
          setState(() {
            topBarOpacity = 1.0;
          });
        }
      } else if (scrollController.offset <= 24 &&
          scrollController.offset >= 0) {
        if (topBarOpacity != scrollController.offset / 24) {
          setState(() {
            topBarOpacity = scrollController.offset / 24;
          });
        }
      } else if (scrollController.offset <= 0) {
        if (topBarOpacity != 0.0) {
          setState(() {
            topBarOpacity = 0.0;
          });
        }
      }
    });
    super.initState();
  }

  TextEditingController _controller = new TextEditingController();
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    id = widget.firstlist[0];
    return Scaffold(
      backgroundColor: Color.fromARGB(245, 245, 245, 245),
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        backgroundColor: Color.fromARGB(255, 181, 217, 240),
        toolbarHeight: MediaQuery.of(context).size.height * 0.10,
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
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(
              height: size.height * 0.02,
            ),
            SizedBox(
              height: size.height * 0.02,
            ),
            Row(children: [
              Expanded(
                child: Padding(
                  padding: EdgeInsets.only(),
                  child: Text(
                    "Browse through the plans to find the correct one for you ",
                    textAlign: TextAlign.center,
                    style: GoogleFonts.poppins(
                        color: Color.fromARGB(255, 9, 78, 153),
                        fontSize: size.width * 0.045,
                        fontWeight: FontWeight.w600),
                  ),
                ),
              ),
            ]),
            plan(
              context,
              size,
              0,
            ),
            plan(
              context,
              size,
              1,
            ),
            plan(
              context,
              size,
              2,
            ),
          ],
        ),
      ),
    );
  }

  plan(BuildContext context, Size size, int i) {
    return Padding(
      padding: EdgeInsets.only(
        left: MediaQuery.of(context).size.height * 0.02,
        right: MediaQuery.of(context).size.height * 0.02,
        top: MediaQuery.of(context).size.height * 0.02,
        bottom: MediaQuery.of(context).size.height * 0.02,
      ),
      child: Container(
        width: size.width,
        height: size.height * 0.515,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.only(
              topLeft: Radius.circular(20.0),
              bottomLeft: Radius.circular(20.0),
              bottomRight: Radius.circular(20.0),
              topRight: Radius.circular(20.0)),
          image: DecorationImage(
              image: AssetImage("assets/others/glass1.png"), fit: BoxFit.cover),
        ),
        child: Align(
          alignment: Alignment.center,
          child: Column(children: <Widget>[
            Padding(
              padding: EdgeInsets.only(
                top: size.width * 0.2,
              ),
            ),
            AnimatedPadding(
              duration: const Duration(milliseconds: 500),
              padding: EdgeInsets.only(
                  top: size.height * 0.02, bottom: size.height * 0.015),
              child: Container(
                height: size.height * 0.08,
                width: size.width * 0.52,
                decoration: BoxDecoration(
                    gradient: LinearGradient(
                      begin: Alignment.centerRight,
                      end: Alignment.centerLeft,
                      stops: [
                        0.01,
                        1.0,
                      ],
                      colors: [
                        Color.fromARGB(255, 19, 33, 55).withOpacity(.7),
                        Color.fromARGB(255, 41, 69, 114).withOpacity(.7),
                      ],
                    ),
                    borderRadius: BorderRadius.circular(20)),
                child: FlatButton(
                  onPressed: () {},
                  child: Text(
                    plan_name[i],
                    textAlign: TextAlign.center,
                    style: GoogleFonts.poppins(
                        color: Color.fromARGB(255, 238, 239, 241),
                        fontSize: size.width * 0.04,
                        fontWeight: FontWeight.w600),
                  ),
                ),
              ),
            ),
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                DecoratedBox(
                  decoration: BoxDecoration(
                      //  color: Color.fromARGB(255, 238, 239, 241),
                      ),
                  child: Text(
                    plan_desc[i],
                    textAlign: TextAlign.center,
                    style: GoogleFonts.poppins(
                      color: Color.fromARGB(255, 19, 33, 55),
                      fontSize: size.width * 0.032,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ),
                AnimatedPadding(
                  duration: const Duration(milliseconds: 500),
                  padding: EdgeInsets.only(top: size.height * 0.01),
                  child: Container(
                    height: size.height * 0.06,
                    width: size.width * 0.4,
                    decoration: BoxDecoration(
                        gradient: LinearGradient(
                          begin: Alignment.centerRight,
                          end: Alignment.centerLeft,
                          stops: [
                            0.01,
                            1.0,
                          ],
                          colors: [
                            Color.fromARGB(255, 248, 63, 87).withOpacity(.9),
                            Color.fromARGB(255, 251, 71, 95).withOpacity(.9),
                          ],
                        ),
                        borderRadius: BorderRadius.circular(20)),
                    child: FlatButton(
                      onPressed: () {
                        waterUserinfo(i);
                      },
                      child: Text(
                        'Browse plan',
                        style: GoogleFonts.poppins(
                            color: Color.fromARGB(255, 238, 239, 241),
                            fontSize: size.width * 0.035,
                            fontWeight: FontWeight.w600),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ]),
        ),
      ),
    );
  }
}
