import 'package:google_fonts/google_fonts.dart';
import 'package:test1/app_theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:liquid_progress_indicator/liquid_progress_indicator.dart';

class Progress_screen1 extends StatefulWidget {
  List firstlist;
  List drink_days;
  List dates;

  Progress_screen1({
    Key? key,
    required this.firstlist,
    required this.drink_days,
    required this.dates,
  }) : super(key: key);

  @override
  _Progress_screen1State createState() => _Progress_screen1State();
}

class _Progress_screen1State extends State<Progress_screen1> {
  List<int> ind = [
    1,
  ];
  var days = ["Sat", "Sun", "Mon", "Tues", "Wed", "Thur", "Fri"];
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Container(
      color: Color.fromARGB(245, 245, 245, 245),
      child: SafeArea(
        top: false,
        child: Scaffold(
          backgroundColor: Color.fromARGB(245, 245, 245, 245),
          appBar: AppBar(
            backgroundColor: Color.fromARGB(255, 181, 217, 240),
            toolbarHeight: MediaQuery.of(context).size.height * 0.11,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.vertical(
                bottom: Radius.circular(30),
              ),
            ),
            leading: IconButton(
              icon: Icon(
                Icons.arrow_back,
                color: Color.fromARGB(255, 19, 33, 55),
              ),
              onPressed: () {
                Navigator.pop(context);
              },
            ),
            title: SizedBox(
              width: MediaQuery.of(context).size.width * 0.4,
              height: MediaQuery.of(context).size.height * 0.07,
              child: Image.asset(
                'assets/others/logoNavy.png',
                fit: BoxFit.cover,
              ),

              //
            ),
          ),
          body: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Padding(
                  padding: EdgeInsets.only(
                      top: MediaQuery.of(context).size.width * 0.1),
                  child: Text(
                    "Weekly water Recap",
                    textAlign: TextAlign.center,
                    style: TextStyle(
                        color: Color.fromARGB(255, 9, 78, 153),
                        fontSize: size.width * 0.045,
                        fontWeight: FontWeight.w600),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(
                      top: MediaQuery.of(context).size.width * 0.02),
                ),
                Row(mainAxisAlignment: MainAxisAlignment.center, children: [
                  Container(
                      padding: EdgeInsets.all(
                          MediaQuery.of(context).size.width * 0.04),
                      height: MediaQuery.of(context).size.width * 0.6,
                      child: SizedBox(
                          height: MediaQuery.of(context).size.width * 0.5,
                          width: MediaQuery.of(context).size.width * 0.5,
                          child: LiquidCircularProgressIndicator(
                              value: 0.5,
                              valueColor: AlwaysStoppedAnimation(Color.fromARGB(
                                  255,
                                  155,
                                  214,
                                  241)), // Defaults to the current Theme's accentColor.
                              backgroundColor:
                                  Color.fromARGB(245, 245, 245, 245),
                              // Defaults to the current Theme's backgroundColor.
                              borderColor: Color.fromARGB(255, 19, 33, 55),
                              borderWidth: 2.0,
                              direction: Axis.vertical,
                              // The direction the liquid moves (Axis.vertical = bottom to top, Axis.horizontal = left to right). Defaults to Axis.vertical.
                              center: Column(
                                children: [
                                  Padding(
                                    padding: EdgeInsets.only(
                                        top: MediaQuery.of(context).size.width *
                                            0.15),
                                  ),
                                  Text(
                                    "Yesterday",
                                    textAlign: TextAlign.center,
                                    style: TextStyle(
                                        color: Color.fromARGB(255, 19, 33, 55),
                                        fontSize: size.width * 0.05,
                                        fontWeight: FontWeight.w700),
                                  ),
                                  Text(
                                    widget.drink_days[1] +
                                        "\nOut of\n" +
                                        widget.firstlist[1] +
                                        "\n",
                                    textAlign: TextAlign.center,
                                    style: TextStyle(
                                        color: Color.fromARGB(255, 19, 33, 55),
                                        fontSize: size.width * 0.045,
                                        fontWeight: FontWeight.w600),
                                  ),
                                ],
                              )))),
                ]),
                Padding(
                  padding: EdgeInsets.only(
                      top: MediaQuery.of(context).size.width * 0.25),
                ),
                SingleChildScrollView(
                  scrollDirection: Axis.horizontal,
                  child: Row(
                    children: <Widget>[
                      for (int ii = 0; ii < 6; ii++)
                        for (int i in ind) test(context, size, ii),
                      Padding(
                          padding: EdgeInsets.all(
                              MediaQuery.of(context).size.width * 0.01))
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

  Widget test(BuildContext context, Size size, int i) {
    return InkWell(
        onTap: () {
          showAlertDialog(context,
              widget.drink_days[i + 2] + "\nOut of\n" + widget.firstlist[1]);
        },
        child: Container(
          child: Row(mainAxisAlignment: MainAxisAlignment.center, children: [
            Padding(
              padding: EdgeInsets.only(
                right: size.width * 0.03,
                top: MediaQuery.of(context).size.height * 0.03,
                bottom: MediaQuery.of(context).size.height * 0.03,
              ),
            ),
            Container(
              width: size.width * 0.23,
              height: size.height * 0.19,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(10.0),
                    bottomLeft: Radius.circular(10.0),
                    bottomRight: Radius.circular(10.0),
                    topRight: Radius.circular(10.0)),
                image: DecorationImage(
                    image: AssetImage("assets/others/glasscon.png"),
                    fit: BoxFit.cover),
              ),
              child: Padding(
                padding: EdgeInsets.only(
                  top: MediaQuery.of(context).size.height * 0.1,
                  left: MediaQuery.of(context).size.height * 0.01,
                ),
                child: DecoratedBox(
                  decoration: BoxDecoration(),
                  child: Text(
                    widget.dates[i + 2],
                    textAlign: TextAlign.center,
                    style: GoogleFonts.poppins(
                        backgroundColor: Color.fromARGB(255, 19, 33, 55),
                        color: Colors.white,
                        fontSize: size.width * 0.025,
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
          ]),
        ));
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
                      'You Water Drinking \nFor that day',
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
}
