import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';

import '../../../http.dart';
import '../../navigation_home_screen.dart';

String id = "";

class food_timers extends StatefulWidget {
  List firstlist;
  food_timers({Key? key, this.animationController, required this.firstlist})
      : super(key: key);

  final AnimationController? animationController;
  @override
  _food_timersState createState() => _food_timersState();
}

class _food_timersState extends State<food_timers> {
  TimeOfDay selectedTime = TimeOfDay.now();
  final ScrollController scrollController = ScrollController();
  double topBarOpacity = 0.0;

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

  Duration initialtimer = new Duration();
  settimer() async {
    var result = await http_post("timers_meals", {
      "id": widget.firstlist[0],
      "meal1": checked_meal[0],
      "timer1": meal_time[0],
      "meal2": checked_meal[1],
      "timer2": meal_time[1],
      "meal3": checked_meal[2],
      "timer3": meal_time[2],
      "meal4": checked_meal[3],
      "timer4": meal_time[3],
      "meal5": checked_meal[4],
      "timer5": meal_time[4],
    });
    print(result);
  }

  get_timers() async {
    var result = await http_get("get_timers_meals", {
      "id": widget.firstlist[0],
    });

    setState(() {
      List myinfo = result.data.split("^");
      if (myinfo[0] == "1")
        checked_meal[0] = true;
      else
        checked_meal[0] = false;
      meal_time[0] = myinfo[1];

      if (myinfo[2] == "1")
        checked_meal[1] = true;
      else
        checked_meal[1] = false;

      meal_time[1] = myinfo[3];
      if (myinfo[4] == "1")
        checked_meal[2] = true;
      else
        checked_meal[2] = false;

      meal_time[2] = myinfo[5];
      if (myinfo[6] == "1")
        checked_meal[3] = true;
      else
        checked_meal[3] = false;
      meal_time[3] = myinfo[7];

      if (myinfo[8] == "1")
        checked_meal[4] = true;
      else
        checked_meal[4] = false;
      meal_time[4] = myinfo[9];
    });
  }

  String time = "";
  @override
  void initState() {
    get_timers();
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
            Row(children: [
              Expanded(
                child: Padding(
                  padding: EdgeInsets.only(),
                  child: Text(
                    "Make sure you check all the Meals you want to set the timer for \nYou have up to 5 Meals",
                    textAlign: TextAlign.center,
                    style: GoogleFonts.poppins(
                        color: Color.fromARGB(255, 9, 78, 153),
                        fontSize: size.width * 0.04,
                        fontWeight: FontWeight.w600),
                  ),
                ),
              ),
            ]),
            meal(
              context,
              size,
              0,
              Color.fromARGB(255, 216, 115, 145),
              Color.fromARGB(255, 216, 115, 145),
            ),
            meal(
              context,
              size,
              1,
              Color.fromARGB(255, 70, 163, 170),
              Color.fromARGB(255, 70, 163, 170),
            ),
            meal(
              context,
              size,
              2,
              Color.fromARGB(255, 206, 148, 94),
              Color.fromARGB(255, 206, 148, 94),
            ),
            meal(
              context,
              size,
              3,
              Color.fromARGB(255, 52, 204, 153),
              Color.fromARGB(255, 52, 204, 153),
            ),
            meal(
              context,
              size,
              4,
              Color.fromARGB(255, 204, 108, 108),
              Color.fromARGB(255, 204, 108, 108),
            ),
            AnimatedPadding(
              duration: const Duration(milliseconds: 500),
              padding: EdgeInsets.only(
                  top: size.height * 0.005, bottom: size.height * 0.01),
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
                        Color.fromARGB(255, 152, 153, 153),
                        Color.fromARGB(255, 129, 129, 129),
                      ],
                    ),
                    borderRadius: BorderRadius.circular(20)),
                child: FlatButton(
                  onPressed: () {
                    settimer();
                    addmeal();
                  },
                  child: Text(
                    "Save Timers",
                    textAlign: TextAlign.center,
                    style: GoogleFonts.poppins(
                        color: Color.fromARGB(255, 238, 239, 241),
                        fontSize: size.width * 0.06,
                        fontWeight: FontWeight.w600),
                  ),
                ),
              ),
            ),
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
          meal_time[i] = h + ':' + m;
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
        backgroundColor: Colors.white,
        context: context,
        builder: (context) => Container(height: height, child: child));
  }

  meal(BuildContext context, Size size, int i, Color a, Color b) {
    return Padding(
      padding: EdgeInsets.only(
        left: MediaQuery.of(context).size.height * 0.02,
        right: MediaQuery.of(context).size.height * 0.02,
        top: MediaQuery.of(context).size.height * 0.02,
        bottom: MediaQuery.of(context).size.height * 0.02,
      ),
      child: Container(
        height: size.height * 0.29,
        decoration: BoxDecoration(
          gradient: LinearGradient(
              colors: [a, b],
              begin: Alignment.topLeft,
              end: Alignment.bottomRight),
          borderRadius: BorderRadius.only(
              topLeft: Radius.circular(20.0),
              bottomLeft: Radius.circular(20.0),
              bottomRight: Radius.circular(20.0),
              topRight: Radius.circular(20.0)),
          boxShadow: <BoxShadow>[
            BoxShadow(
                color: Color.fromARGB(255, 0, 0, 0).withOpacity(0.8),
                offset: Offset(1.1, 1.1),
                blurRadius: 20.0),
          ],
          image: DecorationImage(
              image: AssetImage("assets/others/test9.png"), fit: BoxFit.cover),
        ),
        child: Align(
          alignment: Alignment.center,
          child: Column(children: <Widget>[
            Padding(
              padding: EdgeInsets.only(
                top: size.width * 0.01,
              ),
            ),
            newMethod(context, size, i),
            AnimatedPadding(
              duration: const Duration(milliseconds: 500),
              padding: EdgeInsets.only(
                  top: size.height * 0.005, bottom: size.height * 0.01),
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
                        Color.fromARGB(255, 152, 153, 153).withOpacity(.9),
                        Color.fromARGB(255, 129, 129, 129).withOpacity(.9),
                      ],
                    ),
                    borderRadius: BorderRadius.circular(20)),
                child: FlatButton(
                  onPressed: () {},
                  child: Text(
                    meal_name[i],
                    textAlign: TextAlign.center,
                    style: GoogleFonts.poppins(
                        color: Color.fromARGB(255, 238, 239, 241),
                        fontSize: size.width * 0.045,
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
                    color: Color.fromARGB(255, 238, 239, 241),
                  ),
                  child: Text(
                    meal_time[i],
                    style: GoogleFonts.poppins(
                        color: Color.fromARGB(255, 19, 33, 55),
                        fontSize: size.width * 0.06,
                        fontWeight: FontWeight.w500),
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
                            Color.fromARGB(255, 152, 153, 153).withOpacity(.8),
                            Color.fromARGB(255, 129, 129, 129).withOpacity(.8),
                          ],
                        ),
                        borderRadius: BorderRadius.circular(20)),
                    child: FlatButton(
                      onPressed: () {
                        bottomSheet(context, timePicker(i),
                            height: size.height);
                      },
                      child: Text(
                        'Set Timer',
                        style: GoogleFonts.poppins(
                            color: Color.fromARGB(255, 238, 239, 241),
                            fontSize: size.width * 0.045,
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
              color: Color.fromARGB(255, 238, 239, 241),
            ),
            activeColor: Color.fromARGB(255, 238, 239, 241),
            checkColor: Color(0xff132137),
            //fillColor: Color.fromARGB(255, 19, 33, 55),
            value: checked_meal[i],
            onChanged: (bool? value) {
              setState(() {
                checked_meal[i] = value!;
              });
              print(checked_meal[i]);
            },
          ),
        ));
  }

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
}
