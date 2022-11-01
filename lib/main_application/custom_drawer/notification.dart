import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:test1/http.dart';

class notification_page extends StatefulWidget {
  List firstlist;
  notification_page({Key? key, required this.firstlist}) : super(key: key);
  @override
  _notification_pageState createState() => _notification_pageState();
}

class _notification_pageState extends State<notification_page> {
  @override
  bool pause_all = false;
  bool meal = true;
  bool get_ready = false;
  bool water = true;
  set_notific() async {
    var result = await http_post("set_notif", {
      "id": widget.firstlist[0],
      "pause": pause_all,
      "meal": meal,
      "water": water,
    });
    print(result);
  }

  get_notific() async {
    var res = await http_get("get_notif", {
      "id": widget.firstlist[0],
    });
    List l = res.data.toString().split(" ");
    setState(() {
      if (l[0] == "1")
        pause_all = true;
      else
        pause_all = false;
      if (l[1] == "1")
        meal = true;
      else
        meal = false;
      if (l[2] == "1")
        water = true;
      else
        water = false;
    });
  }

  update_notif() async {
    var result = await http_post("change-notif", {
      "id": widget.firstlist[0],
      "pause": pause_all,
      "meal": meal,
      "water": water,
    });
    print(result);
  }

  initState() {
    set_notific();
    get_notific();
    super.initState();
  }

  String value = '';
  String value2 = '';
  List st = [
    'Meal reminders give you a visual reminder at exactly the right time when you should eat.',
    'Get ready reminders appear minutes before the exact time to prepare your meal.',
    'Water reminder give you a visual reminder to drink water to fulfill your goal'
  ];
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
        title: Text(
          "Notifications",
          style: TextStyle(
              color: Color.fromARGB(255, 19, 33, 55),
              fontSize: size.width * 0.067,
              fontWeight: FontWeight.w600),
        ),
      ),
      body: Column(
        children: [
          Padding(
            padding: EdgeInsets.only(top: size.height * 0.037),
            child: Text(
              "Manage Your Notifications",
              textAlign: TextAlign.center,
              style: GoogleFonts.poppins(
                color: Color.fromARGB(255, 71, 104, 158),
                fontSize: size.height * 0.025,
                fontWeight: FontWeight.w600,
              ),
            ),
          ),
          SizedBox(
            height: size.height * 0.037,
          ),
          Padding(
            padding: EdgeInsets.symmetric(
                horizontal: size.height * 0.015, vertical: size.height * 0.015),
            child: Container(
                padding: EdgeInsets.only(
                    left: size.height * 0.03,
                    right: size.height * 0.025,
                    top: size.height * 0.009,
                    bottom: size.height * 0.01),
                decoration: BoxDecoration(
                    color: Color.fromARGB(255, 216, 236, 248).withOpacity(0.5),
                    border: Border.all(
                      color:
                          Color.fromARGB(255, 216, 236, 248).withOpacity(0.5),
                    ),
                    borderRadius: BorderRadius.all(Radius.circular(30))),
                child: Row(
                  children: [
                    IconButton(
                      icon: Icon(
                        Icons.notifications_off_outlined,
                        color: Color.fromARGB(255, 19, 33, 55),
                        size: MediaQuery.of(context).size.height * 0.05,
                      ),
                      onPressed: () {},
                    ),
                    SizedBox(
                      width: MediaQuery.of(context).size.height * 0.02,
                    ),
                    Expanded(
                      child: Padding(
                        padding: EdgeInsets.only(top: size.height * 0.009),
                        child: Text(
                          'Pause All',
                          style: GoogleFonts.poppins(
                            //   color: Color.fromARGB(255, 71, 104, 158),
                            fontSize: size.height * 0.031,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                      ),
                    ),
                    Transform.scale(
                      scale: 1,
                      child: CupertinoSwitch(
                        value: pause_all,
                        activeColor: Color.fromARGB(255, 24, 104, 141),
                        onChanged: (value) {
                          pause_all = value;
                          setState(() {});
                          if (pause_all) {
                            meal = false;
                            water = false;
                          }
                          update_notif();
                        },
                      ),
                    ),
                  ],
                )),
          ),
          SizedBox(
            height: size.height * 0.017,
          ),
          Padding(
            padding: EdgeInsets.symmetric(
                horizontal: size.height * 0.015, vertical: size.height * 0.015),
            child: Container(
              padding: EdgeInsets.only(
                  left: size.height * 0.03,
                  right: size.height * 0.025,
                  top: size.height * 0.009,
                  bottom: size.height * 0.01),
              decoration: BoxDecoration(
                  color: Color.fromARGB(255, 216, 236, 248).withOpacity(0.5),
                  border: Border.all(
                    color: Color.fromARGB(255, 216, 236, 248).withOpacity(0.5),
                  ),
                  borderRadius: BorderRadius.all(Radius.circular(30))),
              child: Column(
                children: [
                  Row(
                    children: [
                      IconButton(
                          icon: Icon(
                            Icons.info,
                            color: Color.fromARGB(255, 19, 33, 55),
                            size: MediaQuery.of(context).size.height * 0.05,
                          ),
                          onPressed: () {
                            showAlertDialog(context, st[0]);
                          }),
                      SizedBox(
                        width: MediaQuery.of(context).size.height * 0.02,
                      ),
                      Expanded(
                        child: Padding(
                          padding: EdgeInsets.only(top: size.height * 0.009),
                          child: Text(
                            'Meals Reminder',
                            style: GoogleFonts.poppins(
                              //   color: Color.fromARGB(255, 71, 104, 158),
                              fontSize: size.height * 0.028,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                        ),
                      ),
                      Transform.scale(
                        scale: 1,
                        child: CupertinoSwitch(
                          value: meal,
                          activeColor: Color.fromARGB(255, 24, 104, 141),
                          onChanged: (value) {
                            meal = value;
                            setState(() {
                              update_notif();
                            });
                          },
                        ),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: size.height * 0.037,
                  ),
                  Row(
                    children: [
                      IconButton(
                        icon: Icon(
                          Icons.info,
                          color: Color.fromARGB(255, 19, 33, 55),
                          size: MediaQuery.of(context).size.height * 0.05,
                        ),
                        onPressed: () {
                          showAlertDialog(context, st[2]);
                        },
                      ),
                      SizedBox(
                        width: MediaQuery.of(context).size.height * 0.02,
                      ),
                      Expanded(
                        child: Padding(
                          padding: EdgeInsets.only(top: size.height * 0.009),
                          child: Text(
                            'Water Reminder',
                            style: GoogleFonts.poppins(
                              //   color: Color.fromARGB(255, 71, 104, 158),
                              fontSize: size.height * 0.028,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                        ),
                      ),
                      Transform.scale(
                        scale: 1,
                        child: CupertinoSwitch(
                          value: water,
                          activeColor: Color.fromARGB(255, 24, 104, 141),
                          onChanged: (value) {
                            water = value;
                            setState(() {
                              update_notif();
                            });
                          },
                        ),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: size.height * 0.037,
                  ),
                ],
              ),
            ),
          )
        ],
      ),
    );
  }

  showAlertDialog(BuildContext context, String txt) {
    showDialog(
        context: context,
        builder: (BuildContext context) {
          return Dialog(
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(30.0)), //this right here
            child: Container(
              height: MediaQuery.of(context).size.height * 0.45,
              child: Padding(
                padding:
                    EdgeInsets.all(MediaQuery.of(context).size.height * 0.01),
                child: Column(
                  // mainAxisAlignment: MainAxisAlignment.center,
                  // crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(height: MediaQuery.of(context).size.height * 0.02),
                    Text(
                      'Notifiction information',
                      textAlign: TextAlign.center,
                      style: GoogleFonts.poppins(
                        color: Color(0xff132137),
                        fontSize: MediaQuery.of(context).size.height * 0.024,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                    SizedBox(height: MediaQuery.of(context).size.height * 0.04),
                    Text(
                      txt,
                      textAlign: TextAlign.center,
                      style: GoogleFonts.poppins(
                        color: Color.fromARGB(255, 34, 99, 204),
                        fontSize: MediaQuery.of(context).size.height * 0.023,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                    SizedBox(height: MediaQuery.of(context).size.height * 0.03),
                    CircleAvatar(
                      backgroundColor: Color.fromARGB(255, 33, 53, 85),
                      radius: 30,
                      child: IconButton(
                        icon: Icon(
                          Icons.close,
                          color: Color.fromARGB(255, 255, 255, 255),
                        ),
                        onPressed: () {
                          Navigator.pop(context);
                        },
                      ),
                    ),
                  ],
                ),
              ),
            ),
          );
        });
  }

  Widget buildactionsheet(BuildContext context) => CupertinoActionSheet(
        actions: [
          CupertinoActionSheetAction(
              child: Text('For 30 Minutes'),
              onPressed: () {
                value = '30 Minutes';
                Navigator.pop(context);
              }),
          CupertinoActionSheetAction(
              child: Text('For 1 Hour'),
              onPressed: () {
                value = '1 Hour';
                Navigator.pop(context);
              }),
          CupertinoActionSheetAction(
              child: Text('For 8 Hour'),
              onPressed: () {
                value = '8 Hour';
                Navigator.pop(context);
              }),
          CupertinoActionSheetAction(
              child: Text('For 24 Hour'),
              onPressed: () {
                value = '24 Hour';
                Navigator.pop(context);
              }),
        ],
        cancelButton: CupertinoActionSheetAction(
            child: Text('Cancel'),
            onPressed: () {
              value = '';
              pause_all = false;
              Navigator.pop(context);
              setState(() {
                build(context);
              });
            }),
      );

  Widget buildactionsheet2(BuildContext context) => CupertinoActionSheet(
        actions: [
          CupertinoActionSheetAction(
              child: Text('5 minutes'),
              onPressed: () {
                value2 = '5 minutes';
                Navigator.pop(context);
              }),
          CupertinoActionSheetAction(
              child: Text('10 minutes'),
              onPressed: () {
                value2 = '10 minutes';
                Navigator.pop(context);
              }),
          CupertinoActionSheetAction(
              child: Text('30 minutes'),
              onPressed: () {
                value2 = '30 minutes';
                Navigator.pop(context);
              }),
          CupertinoActionSheetAction(
              child: Text('1 Hour'),
              onPressed: () {
                value2 = '1 hour';
                Navigator.pop(context);
              }),
        ],
        cancelButton: CupertinoActionSheetAction(
            child: Text('Cancel'),
            onPressed: () {
              value2 = '';
              get_ready = false;
              Navigator.pop(context);
              setState(() {
                build(context);
              });
            }),
      );
}
