import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';
import 'package:test1/main_application/custom_drawer/privacy.dart';

import '../../../http.dart';
import '../../navigation_home_screen.dart';

String id = "";
String weight = "";
List<int> ind = [
  1,
];
String activity_level_s = "";
int activity_level = 0;
var water_amount = 0;
var suggested_plan = 0;
var timer_space = 0;
//var drink_amount = 0;

class water_plan_3 extends StatefulWidget {
  List firstlist;
  water_plan_3({Key? key, this.animationController, required this.firstlist})
      : super(key: key);

  final AnimationController? animationController;
  @override
  _water_plan_3State createState() => _water_plan_3State();
}

class _water_plan_3State extends State<water_plan_3> {
  List checked_drink = [
    false,
    false,
    false,
    false,
    false,
    false,
    false,
    false,
    false,
    false,
    false,
    false,
    false,
    false,
    false,
    false,
    false,
    false,
    false,
  ];
  List drink_time = [
    "00:00",
    "00:00",
    "00:00",
    "00:00",
    "00:00",
    "00:00",
    "00:00",
    "00:00",
    "00:00",
    "00:00",
    "00:00",
    "00:00",
    "00:00",
    "00:00",
  ];

  bool showWidget = false;
  bool showWidget2 = false;
  int lowerLimit = 5;
  int upperLimit = 14;
  int stepValue = 1;
  int count = 0;
  List l = [];
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
  List checked_meal = [false, false, false, false, false];
  List meal_name = ["Meal 1", "Meal 2", "Meal 3", "Meal 4", "Meal 5"];
  List meal_time = ["00:00", "00:00", "00:00", "00:00", "00:00"];
  int glasses_value = 5;
  TimeOfDay selectedTime = TimeOfDay.now();
  final ScrollController scrollController = ScrollController();
  double topBarOpacity = 0.0;

  List checked_plan = [false, false, false];
  List plan_name = [
    "Normal intake \nPlan",
    "Extra intake \nPlan",
    "Workout Hydration plan"
  ];
  var drink_amount = water_amount ~/ 5;
  List size_glasses = [200, 250, 500];
  List plan_glasses = ["00:00", "00:00", "00:00"];

  Duration initialtimer = new Duration();
  addmeal() async {
    var result2 = await http_get("usermeals", {
      "id": id,
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
      "id": id,
    });

    var arr = result3.data.split(' ');
    String weight = arr[0];
    String height = arr[1];
    String gender = arr[2];
    String name = arr[3];
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
    setState(() {
      Navigator.push(
          context,
          MaterialPageRoute(
              builder: (_) => NavigationHomeScreen(
                    firstlist: [id, weight, height, gender, name],
                    Meals: Meals,
                    meal_amount: meal_amount,
                    images: images,
                  )));
    });
  }

  String time = "";
  setwatertimer() async {
    var result = await http_post("set_water_timer", {
      "id": widget.firstlist[0],
      "plan": 3,
      "glass_size": drink_amount,
      "goal": water_amount,
      "glass1": checked_drink[0],
      "timer1": drink_time[0],
      "glass2": checked_drink[1],
      "timer2": drink_time[1],
      "glass3": checked_drink[2],
      "timer3": drink_time[2],
      "glass4": checked_drink[3],
      "timer4": drink_time[3],
      "glass5": checked_drink[4],
      "timer5": drink_time[4],
      "glass6": checked_drink[5],
      "timer6": drink_time[5],
      "glass7": checked_drink[6],
      "timer7": drink_time[6],
      "glass8": checked_drink[7],
      "timer8": drink_time[7],
      "glass9": checked_drink[8],
      "timer9": drink_time[8],
      "glass10": checked_drink[9],
      "timer10": drink_time[9],
      "glass11": checked_drink[10],
      "timer11": drink_time[10],
      "glass12": checked_drink[11],
      "timer12": drink_time[11],
      "glass13": checked_drink[12],
      "timer13": drink_time[12],
      "glass14": checked_drink[13],
      "timer14": drink_time[13],
    });
    print(result);
  }

  @override
  void initState() {
    drink_amount = widget.firstlist[3];

    super.initState();
  }

  Widget build(BuildContext context) {
    id = widget.firstlist[0];
    weight = widget.firstlist[1];
    activity_level_s = widget.firstlist[2];
    if (activity_level_s == "1") activity_level = 0;
    if (activity_level_s == "26") activity_level = 1;
    if (activity_level_s == "51") activity_level = 2;
    if (activity_level_s == "75") activity_level = 3;
    if (activity_level_s == "100") activity_level = 4;
    num ww = double.parse(weight) * 1000;
    double div = 30.0;
    water_amount = ww ~/ div;
    print(activity_level);
    for (int i = 0; i <= activity_level; i++) water_amount += 350;

    suggested_plan = water_amount ~/ 200;
    suggested_plan += 1;
    if (suggested_plan > 14) suggested_plan = 14;
    print("water_amount");
    print(water_amount);
    Size size = MediaQuery.of(context).size;
    double iconSize = size.width * 0.08;
    return Scaffold(
      backgroundColor: Color.fromARGB(245, 245, 245, 245),
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        backgroundColor: Color.fromARGB(245, 245, 245, 245),
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
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SizedBox(
              height: size.height * 0.02,
            ),
            SizedBox(
              height: size.height * 0.02,
            ),
            Padding(
              padding: EdgeInsets.only(
                left: size.height * 0.0,
              ),
              child: Text(
                "Workout Water Hydration plan",
                textAlign: TextAlign.center,
                style: GoogleFonts.poppins(
                    color: Color.fromARGB(255, 19, 33, 55),
                    fontSize: size.width * 0.055,
                    fontWeight: FontWeight.w600),
              ),
            ),
            summary(context, size),
            Row(children: [
              Expanded(
                child: Padding(
                  padding: EdgeInsets.only(
                    left: size.height * 0.0,
                  ),
                  child: Text(
                    "Choose the number of times \nor glasses you want your water\n intake to be divided into  ",
                    textAlign: TextAlign.center,
                    style: GoogleFonts.poppins(
                        color: Color.fromARGB(255, 9, 78, 153),
                        fontSize: size.width * 0.04,
                        fontWeight: FontWeight.w600),
                  ),
                ),
              ),
            ]),
            SizedBox(
              height: size.height * 0.02,
            ),
            Row(mainAxisAlignment: MainAxisAlignment.center, children: [
              Icon(
                Icons.water_drop_rounded,
                size: size.width * 0.1,
                color: Color.fromARGB(255, 41, 122, 207).withOpacity(0.7),
              ),
              Padding(
                padding: EdgeInsets.only(
                  right: size.width * 0.01,
                ),
              ),
              RawMaterialButton(
                constraints:
                    BoxConstraints.tightFor(width: iconSize, height: iconSize),
                elevation: 6.0,
                onPressed: () {
                  setState(() {
                    glasses_value = glasses_value == lowerLimit
                        ? lowerLimit
                        : glasses_value -= stepValue;
                    drink_amount = water_amount ~/ glasses_value;
                    showWidget = false;

                    showWidget2 = false;
                    drink_time = [
                      "00:00",
                      "00:00",
                      "00:00",
                      "00:00",
                      "00:00",
                      "00:00",
                      "00:00",
                      "00:00",
                      "00:00",
                      "00:00",
                      "00:00",
                      "00:00",
                      "00:00",
                      "00:00",
                    ];
                  });
                },
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(iconSize * 0.3)),
                fillColor: Color.fromARGB(255, 19, 33, 55).withOpacity(0.9),
                child: Icon(
                  Icons.remove,
                  color: Colors.white,
                  size: iconSize * 0.9,
                ),
              ),
              Padding(
                padding: EdgeInsets.only(
                  right: size.width * 0.03,
                ),
              ),
              Container(
                child: Text(
                  '$glasses_value',
                  style: GoogleFonts.poppins(
                      color: Color.fromARGB(255, 19, 33, 55),
                      fontSize: size.width * 0.07,
                      fontWeight: FontWeight.w600),
                  textAlign: TextAlign.center,
                ),
              ),
              Padding(
                padding: EdgeInsets.only(
                  right: size.width * 0.03,
                ),
              ),
              RawMaterialButton(
                constraints:
                    BoxConstraints.tightFor(width: iconSize, height: iconSize),
                elevation: 6.0,
                onPressed: () {
                  setState(() {
                    glasses_value = glasses_value == upperLimit
                        ? upperLimit
                        : glasses_value += stepValue;
                    showWidget = false;
                    drink_amount = water_amount ~/ glasses_value;

                    showWidget2 = false;
                    drink_time = [
                      "00:00",
                      "00:00",
                      "00:00",
                      "00:00",
                      "00:00",
                      "00:00",
                      "00:00",
                      "00:00",
                      "00:00",
                      "00:00",
                      "00:00",
                      "00:00",
                      "00:00",
                      "00:00",
                    ];
                  });
                },
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(iconSize * 0.2)),
                fillColor: Color.fromARGB(255, 19, 33, 55).withOpacity(0.9),
                child: Icon(
                  Icons.add,
                  color: Colors.white,
                  size: iconSize * 0.8,
                ),
              ),
              Padding(
                padding: EdgeInsets.only(
                  right: size.width * 0.01,
                ),
              ),
              Icon(
                Icons.water_drop_rounded,
                size: size.width * 0.1,
                color: Color.fromARGB(255, 41, 122, 207).withOpacity(0.7),
              ),
            ]),
            Padding(
              padding: EdgeInsets.only(
                top: size.width * 0.01,
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Padding(
                  padding: EdgeInsets.only(
                      top: size.height * 0.01,
                      right: size.width * 0.02,
                      left: size.width * 0.02),
                  child: Text('Each needs to be',
                      textAlign: TextAlign.center,
                      style: GoogleFonts.poppins(
                        fontWeight: FontWeight.w600,
                        fontSize: size.width * 0.05,
                        color: Color.fromARGB(255, 19, 33, 55),
                      )),
                ),
                Padding(
                  padding: EdgeInsets.only(
                    top: size.height * 0.01,
                    right: size.width * 0.01,
                  ),
                  child: Text('$drink_amount ml',
                      textAlign: TextAlign.center,
                      style: GoogleFonts.poppins(
                        fontWeight: FontWeight.w600,
                        fontSize: size.width * 0.05,
                        color: Color.fromARGB(255, 19, 33, 55),
                      )),
                ),
              ],
            ),
            AnimatedPadding(
              duration: const Duration(milliseconds: 500),
              padding: EdgeInsets.only(top: size.height * 0.01),
              child: Container(
                height: size.height * 0.06,
                width: size.width * 0.5,
                decoration: BoxDecoration(
                    gradient: LinearGradient(
                      begin: Alignment.centerRight,
                      end: Alignment.centerLeft,
                      stops: [
                        0.01,
                        1.0,
                      ],
                      colors: [
                        Color.fromARGB(255, 248, 63, 87).withOpacity(.8),
                        Color.fromARGB(255, 251, 71, 95).withOpacity(.8),
                      ],
                    ),
                    borderRadius: BorderRadius.circular(20)),
                child: FlatButton(
                  onPressed: () {
                    var t = 14.0 / glasses_value as double;
                    if (glasses_value >= 10 && glasses_value <= 13)
                      timer_space = (t).floor();
                    else
                      timer_space = (t).ceil();
                    print(timer_space);
                    num first = 8;
                    drink_time = [
                      "08:00",
                      if (timer_space > 1)
                        (8 + timer_space).toString() + ":00"
                      else
                        "0" + (8 + timer_space).toString() + ":00",
                      (8 + timer_space * 2).toString() + ":00",
                      (8 + timer_space * 3).toString() + ":00",
                      (8 + timer_space * 4).toString() + ":00",
                      (8 + timer_space * 5).toString() + ":00",
                      (8 + timer_space * 6).toString() + ":00",
                      (8 + timer_space * 7).toString() + ":00",
                      (8 + timer_space * 8).toString() + ":00",
                      (8 + timer_space * 9).toString() + ":00",
                      (8 + timer_space * 10).toString() + ":00",
                      (8 + timer_space * 11).toString() + ":00",
                      (8 + timer_space * 12).toString() + ":00",
                      (8 + timer_space * 13).toString() + ":00",
                    ];
                    setState(() {
                      showWidget2 = !showWidget2;
                    });
                  },
                  child: Text(
                    'View Timers',
                    style: GoogleFonts.poppins(
                        color: Color.fromARGB(255, 19, 33, 55),
                        fontSize: size.width * 0.04,
                        fontWeight: FontWeight.w600),
                  ),
                ),
              ),
            ),
            showWidget
                ? Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      Padding(
                        padding: EdgeInsets.only(
                            top: size.height * 0.01,
                            right: size.width * 0.02,
                            left: size.width * 0.02),
                        child: Text('Set timers to your preferance',
                            textAlign: TextAlign.center,
                            style: GoogleFonts.poppins(
                              fontWeight: FontWeight.w600,
                              fontSize: size.width * 0.055,
                              color: Color.fromARGB(255, 19, 33, 55),
                            )),
                      ),
                      for (int ii = 0; ii < glasses_value; ii++)
                        for (int i in ind) test(context, size, ii),
                      AnimatedPadding(
                        duration: const Duration(milliseconds: 500),
                        padding: EdgeInsets.only(top: size.height * 0.01),
                        child: Container(
                          height: size.height * 0.06,
                          width: size.width * 0.5,
                          decoration: BoxDecoration(
                              gradient: LinearGradient(
                                begin: Alignment.centerRight,
                                end: Alignment.centerLeft,
                                stops: [
                                  0.01,
                                  1.0,
                                ],
                                colors: [
                                  Color.fromARGB(255, 248, 63, 87)
                                      .withOpacity(.8),
                                  Color.fromARGB(255, 251, 71, 95)
                                      .withOpacity(.8),
                                ],
                              ),
                              borderRadius: BorderRadius.circular(20)),
                          child: FlatButton(
                            onPressed: () {
                              checked_drink[0] = true;
                              checked_drink[1] = true;
                              checked_drink[2] = true;
                              checked_drink[3] = true;
                              checked_drink[4] = true;
                              for (int i = 5; i < glasses_value; i++) {
                                checked_drink[i] = true;
                              }
                              print(checked_drink);
                              print(drink_time);

                              setwatertimer();
                              addmeal();
                            },
                            child: Text(
                              'Save',
                              style: GoogleFonts.poppins(
                                  color: Color.fromARGB(255, 19, 33, 55),
                                  fontSize: size.width * 0.055,
                                  fontWeight: FontWeight.w600),
                            ),
                          ),
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.only(
                          top: size.width * 0.03,
                        ),
                      ),
                    ],
                  )
                : Container(),
            showWidget2
                ? Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      Padding(
                        padding: EdgeInsets.only(
                            top: size.height * 0.01,
                            right: size.width * 0.02,
                            left: size.width * 0.02),
                        child: Text(
                            'Make sure to check the Timers you want to be notified at',
                            textAlign: TextAlign.center,
                            style: GoogleFonts.poppins(
                              fontWeight: FontWeight.w600,
                              fontSize: size.width * 0.055,
                              color: Color.fromARGB(255, 19, 33, 55),
                            )),
                      ),
                      for (int ii = 0; ii < glasses_value; ii++)
                        for (int i in ind) test(context, size, ii),
                      AnimatedPadding(
                        duration: const Duration(milliseconds: 500),
                        padding: EdgeInsets.only(top: size.height * 0.01),
                        child: Container(
                          height: size.height * 0.06,
                          width: size.width * 0.5,
                          decoration: BoxDecoration(
                              gradient: LinearGradient(
                                begin: Alignment.centerRight,
                                end: Alignment.centerLeft,
                                stops: [
                                  0.01,
                                  1.0,
                                ],
                                colors: [
                                  Color.fromARGB(255, 248, 63, 87)
                                      .withOpacity(.8),
                                  Color.fromARGB(255, 251, 71, 95)
                                      .withOpacity(.8),
                                ],
                              ),
                              borderRadius: BorderRadius.circular(20)),
                          child: FlatButton(
                            onPressed: () {
                              checked_drink[0] = true;
                              checked_drink[1] = true;
                              checked_drink[2] = true;
                              checked_drink[3] = true;
                              checked_drink[4] = true;
                              for (int i = 5; i < glasses_value; i++) {
                                checked_drink[i] = true;
                              }
                              print(checked_drink);
                              print(drink_time);

                              setwatertimer();
                              addmeal();

                              print(checked_drink);
                              print(drink_time);
                              setwatertimer();
                              addmeal();
                            },
                            child: Text(
                              'Save',
                              style: GoogleFonts.poppins(
                                  color: Color.fromARGB(255, 19, 33, 55),
                                  fontSize: size.width * 0.05,
                                  fontWeight: FontWeight.w600),
                            ),
                          ),
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.only(
                          top: size.width * 0.03,
                        ),
                      ),
                    ],
                  )
                : Container(),
          ],
        ),
      ),
    );
  }

  Widget timePicker(int i) {
    return CupertinoTimerPicker(
      mode: CupertinoTimerPickerMode.hm,
      minuteInterval: 1,
      initialTimerDuration: initialtimer,
      onTimerDurationChanged: (Duration changedtimer) {
        String h = "";
        String m = "";
        setState(() {
          print(changedtimer.inHours);
          print(changedtimer.inMinutes % 60);
          if (changedtimer.inHours < 10) {
            h = '0' + changedtimer.inHours.toString();
          }
          if (changedtimer.inMinutes % 60 < 10) {
            m = '0' + (changedtimer.inMinutes % 60).toString();
          }
          if (changedtimer.inHours >= 10) {
            h = changedtimer.inHours.toString();
          }
          if (changedtimer.inMinutes % 60 >= 10) {
            m = (changedtimer.inMinutes % 60).toString();
          }

          initialtimer = changedtimer;

          drink_time[i] = h + ':' + m;
        });
      },
    );
  }

  Future<void> bottomSheet(BuildContext context, Widget child,
      {required double height}) {
    return showModalBottomSheet(
        isScrollControlled: false,
        shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.only(
                topLeft: Radius.circular(13), topRight: Radius.circular(13))),
        backgroundColor: Color.fromARGB(245, 245, 245, 245),
        context: context,
        builder: (context) => Container(height: height, child: child));
  }

  Widget test(BuildContext context, Size size, int i) {
    return Container(
        child: Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Padding(
          padding: EdgeInsets.only(
            right: size.width * 0.03,
            top: MediaQuery.of(context).size.height * 0.03,
            bottom: MediaQuery.of(context).size.height * 0.03,
          ),
        ),
        Container(
          width: size.width * 0.25,
          height: size.height * 0.14,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.only(
                topLeft: Radius.circular(10.0),
                bottomLeft: Radius.circular(10.0),
                bottomRight: Radius.circular(10.0),
                topRight: Radius.circular(10.0)),
            boxShadow: <BoxShadow>[
              BoxShadow(
                  color: Color.fromARGB(255, 0, 0, 0).withOpacity(0.2),
                  offset: Offset(1.1, 1.1),
                  blurRadius: 20.0),
            ],
            image: DecorationImage(
                image: AssetImage("assets/others/glass1.png"),
                fit: BoxFit.cover),
          ),
          child: Padding(
            padding: EdgeInsets.only(
              top: MediaQuery.of(context).size.height * 0.04,
            ),
            child: DecoratedBox(
              decoration: BoxDecoration(),
              child: Text(
                drink_time[i],
                textAlign: TextAlign.center,
                style: GoogleFonts.poppins(
                    color: Color.fromARGB(255, 19, 33, 55),
                    fontSize: size.width * 0.06,
                    fontWeight: FontWeight.w500),
              ),
            ),
          ),
        ),
        Padding(
          padding: EdgeInsets.only(
            right: MediaQuery.of(context).size.height * 0.04,
          ),
        ),
        AnimatedPadding(
          duration: const Duration(milliseconds: 500),
          padding: EdgeInsets.only(
              top: size.height * 0.04, bottom: size.height * 0.05),
          child: Container(
            height: size.height * 0.055,
            width: size.width * 0.3,
            decoration: BoxDecoration(
                gradient: LinearGradient(
                  begin: Alignment.centerRight,
                  end: Alignment.centerLeft,
                  stops: [
                    0.01,
                    1.0,
                  ],
                  colors: [
                    Color.fromARGB(255, 19, 33, 55).withOpacity(.8),
                    Color.fromARGB(255, 19, 33, 55).withOpacity(.8),
                  ],
                ),
                borderRadius: BorderRadius.circular(20)),
            child: FlatButton(
              onPressed: () {
                print(i);
                bottomSheet(context, timePicker(i), height: size.height);
              },
              child: Text(
                'Set Timer',
                style: GoogleFonts.poppins(
                    color: Color.fromARGB(255, 238, 239, 241),
                    fontSize: size.width * 0.03,
                    fontWeight: FontWeight.w600),
              ),
            ),
          ),
        ),
      ],
    ));
  }

  Widget summary(BuildContext context, Size size) {
    return Padding(
      padding: EdgeInsets.only(
          left: size.width * 0.01,
          right: size.width * 0.01,
          top: size.width * 0.01,
          bottom: size.width * 0.01),
      child: Container(
        decoration: BoxDecoration(
          color: Color.fromARGB(255, 89, 155, 226).withOpacity(0.5),
          borderRadius: BorderRadius.only(
              topLeft: Radius.circular(8.0),
              bottomLeft: Radius.circular(8.0),
              bottomRight: Radius.circular(8.0),
              topRight: Radius.circular(8.0)),
          boxShadow: <BoxShadow>[
            BoxShadow(
                color: Colors.grey.withOpacity(0.2),
                offset: Offset(1.1, 1.1),
                blurRadius: 10.0),
          ],
        ),
        child: Column(
          children: <Widget>[
            Padding(
              padding: EdgeInsets.only(
                  top: size.height * 0.015,
                  left: size.width * 0.05,
                  right: size.width * 0.05),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: <Widget>[
                  Text(
                    'This is your Summary',
                    textAlign: TextAlign.center,
                    style: GoogleFonts.poppins(
                        color: Color.fromARGB(255, 19, 33, 55),
                        fontSize: size.width * 0.045,
                        fontWeight: FontWeight.w600),
                  ),
                  Row(
                    children: [
                      Padding(
                        padding: EdgeInsets.only(
                            top: size.height * 0.015,
                            left: size.width * 0.01,
                            right: size.width * 0.01),
                        child: Text(
                          'Weight',
                          textAlign: TextAlign.center,
                          style: GoogleFonts.poppins(
                            fontWeight: FontWeight.w600,
                            color: Color.fromARGB(255, 19, 33, 55),
                            fontSize: size.width * 0.04,
                            letterSpacing: -0.1,
                          ),
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.only(left: size.width * 0.25),
                      ),
                      Padding(
                        padding: EdgeInsets.only(
                          top: size.height * 0.015,
                        ),
                        child: Text(
                          'Needed Water',
                          textAlign: TextAlign.center,
                          style: GoogleFonts.poppins(
                            fontWeight: FontWeight.w600,
                            color: Color.fromARGB(255, 19, 33, 55),
                            fontSize: size.width * 0.04,
                            letterSpacing: -0.1,
                          ),
                        ),
                      ),
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: <Widget>[
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.end,
                        children: <Widget>[
                          Padding(
                            padding: EdgeInsets.only(),
                            child: Text(weight,
                                textAlign: TextAlign.center,
                                style: GoogleFonts.poppins(
                                  fontWeight: FontWeight.w600,
                                  fontSize: size.width * 0.08,
                                  color: Color.fromARGB(255, 19, 33, 55),
                                )),
                          ),
                          Padding(
                            padding: EdgeInsets.only(
                              bottom: size.height * 0.01,
                              left: size.width * 0.01,
                            ),
                            child: Text(
                              'Kg',
                              textAlign: TextAlign.center,
                              style: GoogleFonts.poppins(
                                fontWeight: FontWeight.w600,
                                fontSize: size.width * 0.04,
                                letterSpacing: -0.2,
                                color: Color.fromARGB(255, 19, 33, 55),
                              ),
                            ),
                          ),
                          Padding(
                            padding: EdgeInsets.only(left: size.width * 0.3),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(),
                            child: Text('$water_amount',
                                textAlign: TextAlign.center,
                                style: GoogleFonts.poppins(
                                  fontWeight: FontWeight.w600,
                                  fontSize: size.width * 0.08,
                                  color: Color.fromARGB(255, 19, 33, 55),
                                )),
                          ),
                          Padding(
                            padding: EdgeInsets.only(
                              bottom: size.height * 0.01,
                              left: size.width * 0.01,
                            ),
                            child: Text(
                              'ml',
                              textAlign: TextAlign.center,
                              style: GoogleFonts.poppins(
                                fontWeight: FontWeight.w600,
                                fontSize: size.width * 0.04,
                                letterSpacing: -0.2,
                                color: Color.fromARGB(255, 19, 33, 55),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ],
                  )
                ],
              ),
            ),
            Padding(
              padding: EdgeInsets.only(
                top: size.height * 0.01,
                bottom: size.height * 0.01,
                left: size.width * 0.05,
                right: size.width * 0.05,
              ),
              child: Container(
                height: 2,
                decoration: BoxDecoration(
                  color: Color.fromARGB(255, 245, 245, 245).withOpacity(0.5),
                  borderRadius: BorderRadius.all(Radius.circular(4.0)),
                ),
              ),
            ),
            Padding(
              padding: EdgeInsets.only(
                top: size.height * 0.01,
                bottom: size.height * 0.01,
                left: size.width * 0.05,
                right: size.width * 0.05,
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Padding(
                        padding: EdgeInsets.only(bottom: size.height * 0.01),
                        child: Text(
                          'Suggested plan is:',
                          textAlign: TextAlign.center,
                          style: GoogleFonts.poppins(
                            fontWeight: FontWeight.w500,
                            fontSize: size.width * 0.045,
                            color: Color.fromARGB(255, 19, 33, 55),
                            letterSpacing: -0.2,
                          ),
                        ),
                      ),
                    ],
                  ),
                  Padding(
                    padding: EdgeInsets.only(left: size.width * 0.03),
                  ),
                  Column(children: [
                    Padding(
                      padding: EdgeInsets.only(bottom: size.height * 0.01),
                      child: Text(
                        '$suggested_plan',
                        textAlign: TextAlign.center,
                        style: GoogleFonts.poppins(
                          fontWeight: FontWeight.w600,
                          fontSize: size.width * 0.05,
                          letterSpacing: -0.2,
                          color: Color.fromARGB(255, 248, 63, 87),
                        ),
                      ),
                    ),
                  ]),
                  Padding(
                    padding: EdgeInsets.only(
                      bottom: size.height * 0.01,
                      left: size.width * 0.01,
                    ),
                    child: Text(
                      'glasses',
                      textAlign: TextAlign.center,
                      style: GoogleFonts.poppins(
                        fontWeight: FontWeight.w600,
                        fontSize: size.width * 0.04,
                        letterSpacing: -0.2,
                        color: Color.fromARGB(255, 19, 33, 55),
                      ),
                    ),
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }

  newMethod(BuildContext context, Size size, int i) {
    return Padding(
        padding: EdgeInsets.only(
          left: 0,
        ),
        child: Transform.scale(
          scale: 1.4,
          child: Checkbox(
            shape: CircleBorder(),
            side: const BorderSide(
              // set border color here
              color: Color(0xff132137),
            ),
            activeColor: Color.fromARGB(255, 248, 63, 87).withOpacity(0.8),
            checkColor: Color.fromARGB(255, 238, 239, 241),
            //fillColor: Color.fromARGB(255, 19, 33, 55),
            value: checked_drink[i],
            onChanged: (bool? value) {
              setState(() {
                checked_drink[i] = value!;
              });
              print(checked_drink[i]);
            },
          ),
        ));
  }
}
