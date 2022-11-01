import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:test1/http.dart';

class info_page extends StatefulWidget {
  List firstlist;
  info_page({Key? key, required this.firstlist}) : super(key: key);
  @override
  _info_pageState createState() => _info_pageState();
}

int weight = 50;
double Height = 50;
bool checkedValueMale = false;
bool checkedValueFemale = false;
double activity = 100;

List checked = [
  true,
  false,
  false,
  false,
  false,
  false,
  false,
  false,
  false,
  false
];
List Diseases = [
  "Heart Diseases",
  "Gastrointestinal Diseases",
  "Anemia",
  "Kidney and urinary tract Diseases",
  "Diabetes",
  "Low or high blood pressure",
  "Eyes illnesses",
  "Goitre",
  "Cancerous Diseases",
  "Dermal Diseases"
];
List<String> myinfo = [];
List<String> myinfo2 = [];

int value = 0;

class _info_pageState extends State<info_page> {
  set_info() async {
    var result = await http_get("info", {
      "id": widget.firstlist[0],
    });
    var result2 = await http_get("disease", {
      "id": widget.firstlist[0],
    });
    myinfo = result.data.split("&");
    myinfo2 = result2.data.split("&");
    setState(() {
      value = Val();
      activity = double.parse(myinfo[3]);
      Height = double.parse(myinfo[1]);
      weight = int.parse(myinfo[2]);
      for (int i = 0; i < 10; i++)
        if (myinfo2[i] == '0')
          checked[i] = false;
        else
          checked[i] = true;
    });
  }

  editinfo() async {
    var Gender;
    if (checkedValueFemale == false)
      Gender = 0;
    else
      Gender = 1;
    var result = await http_post("change-info", {
      "id": widget.firstlist[0],
      "gender": Gender,
      "height": Height,
      "weight": weight,
      "activity": activity,
    });

    var result2 = await http_post("change-disease", {
      "id": widget.firstlist[0],
      "dis1": checked[0],
      "dis2": checked[1],
      "dis3": checked[2],
      "dis4": checked[3],
      "dis5": checked[4],
      "dis6": checked[5],
      "dis7": checked[6],
      "dis8": checked[7],
      "dis9": checked[8],
      "dis10": checked[9],
    });
    setState(() {});
  }

  @override
  void initState() {
    set_info();

    super.initState();
  }

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
                top: MediaQuery.of(context).size.height * 0.047,
              ),
            ),
            Padding(
              padding: EdgeInsets.only(
                  top: size.height * 0.01, left: size.height * 0.065),
              child: MyStatefulWidget(),
            ),
            SizedBox(
              height: MediaQuery.of(context).size.height * 0.037,
            ),
            Container(
              padding: EdgeInsets.only(
                top: size.height * 0.02,
              ),
              decoration: BoxDecoration(
                  color: Color.fromARGB(255, 216, 236, 248).withOpacity(0.7),
                  border: Border.all(
                    color: Color.fromARGB(255, 216, 236, 248).withOpacity(0.7),
                  ),
                  borderRadius: BorderRadius.all(Radius.circular(30))),
              child: Column(
                children: [
                  Text(
                    'HEIGHT',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontSize: MediaQuery.of(context).size.height * 0.03,
                      color: Color.fromARGB(255, 71, 104, 158),
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  SizedBox(
                    height: MediaQuery.of(context).size.height * 0.012,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.baseline,
                    textBaseline: TextBaseline.alphabetic,
                    children: <Widget>[
                      Padding(
                          padding: EdgeInsets.only(
                        left: size.height * 0.02,
                      )),
                      Text(
                        Height.toString(),
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          fontSize: size.height * 0.045,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                      Text(
                        'cm',
                        style: TextStyle(
                          fontSize: size.height * 0.03,
                          color: Color(0xFF8D8E98),
                          fontWeight: FontWeight.w600,
                        ),
                      )
                    ],
                  ),
                  SizedBox(
                    height: size.height * 0.07,
                    child: SliderTheme(
                      data: SliderTheme.of(context).copyWith(
                        inactiveTrackColor: Color(0xFF8D8E98),
                        activeTrackColor: Color(0xff132137),
                        thumbColor: Color.fromARGB(255, 181, 217, 240),
                        overlayColor: Color(0x29EB1555),
                        thumbShape:
                            RoundSliderThumbShape(enabledThumbRadius: 12.0),
                        overlayShape:
                            RoundSliderOverlayShape(overlayRadius: 10.0),
                      ),
                      child: Slider(
                        value: Height,
                        min: 50.0,
                        max: 250.0,
                        onChanged: (double newValue) {
                          setState(() {
                            Height = newValue.roundToDouble();
                          });
                        },
                      ),
                    ),
                  ),
                  SizedBox(
                    height: size.height * 0.007,
                  ),
                ],
              ),
            ),
            SizedBox(
              height: MediaQuery.of(context).size.height * 0.037,
            ),
            Container(
              padding: EdgeInsets.only(
                top: size.height * 0.02,
              ),
              decoration: BoxDecoration(
                  color: Color.fromARGB(255, 216, 236, 248).withOpacity(0.7),
                  border: Border.all(
                    color: Color.fromARGB(255, 216, 236, 248).withOpacity(0.7),
                  ),
                  borderRadius: BorderRadius.all(Radius.circular(30))),
              child: Column(
                children: [
                  Text(
                    'WEIGHT',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontSize: size.height * 0.03,
                      color: Color.fromARGB(255, 71, 104, 158),
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  SizedBox(
                    height: MediaQuery.of(context).size.height * 0.012,
                  ),
                  Row(
                    children: <Widget>[
                      Padding(
                          padding: EdgeInsets.only(
                        left: size.height * 0.09,
                      )),
                      CircleAvatar(
                        backgroundColor: Color.fromARGB(255, 71, 104, 158),
                        radius: 20,
                        child: IconButton(
                          icon: Icon(
                            Icons.add,
                            color: Color.fromARGB(255, 255, 255, 255),
                          ),
                          onPressed: () {
                            setState(() {
                              weight++;
                            });
                          },
                        ),
                      ),
                      Padding(
                          padding: EdgeInsets.only(
                        left: size.height * 0.04,
                      )),
                      Text(
                        weight.toString(),
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          fontSize: size.height * 0.045,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                      Text(
                        'Kg',
                        style: TextStyle(
                          fontSize: size.height * 0.03,
                          color: Color(0xFF8D8E98),
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                      Padding(
                          padding: EdgeInsets.only(
                        left: size.height * 0.04,
                      )),
                      CircleAvatar(
                        backgroundColor: Color.fromARGB(255, 71, 104, 158),
                        radius: 20,
                        child: IconButton(
                          icon: Icon(
                            Icons.remove,
                            color: Color.fromARGB(255, 255, 255, 255),
                          ),
                          onPressed: () {
                            setState(() {
                              weight--;
                            });
                          },
                        ),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: size.height * 0.02,
                  ),
                ],
              ),
            ),
            SizedBox(
              height: MediaQuery.of(context).size.height * 0.037,
            ),
            Container(
              padding: EdgeInsets.only(
                top: size.height * 0.02,
              ),
              decoration: BoxDecoration(
                  color: Color.fromARGB(255, 216, 236, 248).withOpacity(0.7),
                  border: Border.all(
                    color: Color.fromARGB(255, 216, 236, 248).withOpacity(0.7),
                  ),
                  borderRadius: BorderRadius.all(Radius.circular(30))),
              child: Column(
                children: [
                  Text(
                    'Physical Activity',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontSize: MediaQuery.of(context).size.height * 0.03,
                      color: Color.fromARGB(255, 71, 104, 158),
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  SizedBox(
                    height: MediaQuery.of(context).size.height * 0.01,
                  ),
                  Row(
                    children: <Widget>[
                      Padding(
                          padding: EdgeInsets.only(
                        left: size.height * 0.1,
                      )),
                    ],
                  ),
                  SizedBox(
                    height: size.height * 0.12,
                    child: SliderScreen(),
                  ),
                  SizedBox(
                    height: size.height * 0.03,
                  ),
                ],
              ),
            ),
            SizedBox(
              height: size.height * 0.037,
            ),
            Column(
              children: [
                Padding(
                  padding: EdgeInsets.symmetric(
                      // horizontal: size.height * 0.01,
                      // vertical: size.height * 0.01
                      ),
                  child: Container(
                      padding: EdgeInsets.only(
                          left: size.height * 0.01,
                          right: size.height * 0.01,
                          top: size.height * 0.009,
                          bottom: size.height * 0.01),
                      decoration: BoxDecoration(
                          color: Color.fromARGB(255, 216, 236, 248)
                              .withOpacity(0.7),
                          border: Border.all(
                            color: Color.fromARGB(255, 216, 236, 248)
                                .withOpacity(0.7),
                          ),
                          borderRadius: BorderRadius.all(Radius.circular(30))),
                      child: Column(
                        children: [
                          Text(
                            'Your Diseases',
                            textAlign: TextAlign.center,
                            style: TextStyle(
                              fontSize: 22.0,
                              color: Color.fromARGB(255, 71, 104, 158),
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                          SizedBox(
                            height: MediaQuery.of(context).size.height * 0.012,
                          ),
                          newMethod(context, size, 0),
                          newMethod(context, size, 1),
                          newMethod(context, size, 2),
                          newMethod(context, size, 3),
                          newMethod(context, size, 4),
                          newMethod(context, size, 5),
                          newMethod(context, size, 6),
                          newMethod(context, size, 7),
                          newMethod(context, size, 8),
                          newMethod(context, size, 9),
                        ],
                      )),
                ),
                SizedBox(
                  height: MediaQuery.of(context).size.height * 0.01,
                ),
                AnimatedPadding(
                  duration: const Duration(milliseconds: 500),
                  padding: EdgeInsets.only(
                      top: size.height * 0.025,
                      left: size.height * 0.07,
                      right: size.height * 0.07),
                  child: Container(
                    height: size.height * 0.07,
                    width: size.width,
                    decoration: BoxDecoration(
                        color: Color.fromARGB(255, 181, 217, 240),
                        borderRadius: BorderRadius.circular(20)),
                    child: FlatButton(
                      onPressed: () {
                        editinfo();
                      },
                      child: Text(
                        'Save',
                        style: GoogleFonts.satisfy(
                            color: Color(0xff132137),
                            fontSize: size.width * 0.09,
                            fontWeight: FontWeight.w500),
                      ),
                    ),
                  ),
                ),
                SizedBox(
                  height: MediaQuery.of(context).size.height * 0.02,
                ),
              ],
            ),
          ]),
        ),
      ),
    );
  }

  Row newMethod(BuildContext context, Size size, int i) {
    return Row(
      children: [
        SizedBox(
          width: MediaQuery.of(context).size.height * 0.02,
        ),
        Expanded(
          child: Padding(
            padding: EdgeInsets.only(top: size.height * 0.009),
            child: Text(
              Diseases[i],
              style: GoogleFonts.poppins(
                //   color: Color.fromARGB(255, 71, 104, 158),
                fontSize: size.height * 0.028,
                fontWeight: FontWeight.w500,
              ),
            ),
          ),
        ),
        Checkbox(
          checkColor: Color(0xff132137),
          //    fillColor: Color(0xff132137),
          value: checked[i],
          onChanged: (bool? value) {
            setState(() {
              checked[i] = value!;
            });
            print(checked[i]);
          },
        )
      ],
    );
  }
}

class MyStatefulWidget extends StatefulWidget {
  const MyStatefulWidget() : super();
  @override
  State<MyStatefulWidget> createState() => _MyStatefulWidgetState();
}

/// This is the private State class that goes with MyStatefulWidget.
class _MyStatefulWidgetState extends State<MyStatefulWidget> {
  Widget CustomRadioButton(String st, IconData next, int index) {
    return Container(
      width: 100.0,
      height: 40.0,
      child: OutlineButton(
        onPressed: () {
          setState(() {
            if (index == 1) {
              checkedValueFemale = true;
              checkedValueMale = false;
              value = index;
            } else if (index == 2) {
              checkedValueMale = true;
              checkedValueFemale = false;
              value = index;
            }
            print(value);
          });
        },
        child: Padding(
          padding:
              EdgeInsets.only(top: MediaQuery.of(context).size.height * 0.009),
          child: Text(
            st,
            style: TextStyle(
                // color: Color(0xff132137),
                color: (value == index)
                    ? Color.fromARGB(255, 71, 104, 158)
                    : Color(0xff132137),
                fontSize: MediaQuery.of(context).size.width * 0.04,
                fontWeight: FontWeight.w500),
          ),
        ),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
        borderSide: BorderSide(
          width: MediaQuery.of(context).size.width * 0.008,
          color: (value == index)
              ? Color.fromARGB(255, 71, 104, 158)
              : Color(0xff132137),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Padding(
          padding: EdgeInsets.only(
              right: MediaQuery.of(context).size.height * 0.007,
              left: MediaQuery.of(context).size.height * 0.01),
        ),
        CustomRadioButton('Female', Icons.female_outlined, 1),
        Padding(
          padding:
              EdgeInsets.only(right: MediaQuery.of(context).size.height * 0.02),
        ),
        CustomRadioButton('Male', Icons.male_outlined, 2),
      ],
    );
  }
}

int Val() {
  if (myinfo[0] == '1') {
    checkedValueFemale = true;
    checkedValueMale = false;
  }
  if (myinfo[0] == '0') {
    checkedValueMale = true;
    checkedValueFemale = false;
  }
  if (checkedValueMale)
    value = 2;
  else if (checkedValueFemale) value = 1;

  return value;
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
                    trackHeight: MediaQuery.of(context).size.height * 0.01,
                  ),
                  child: RangeSlider(
                    divisions: divisions,
                    activeColor: Color(0xff132137),
                    inactiveColor: Color.fromARGB(255, 71, 104, 158),
                    min: 1,
                    max: 100,
                    values: RangeValues(1, activity),
                    labels: labels,
                    onChanged: (value) {
                      print(" ${value.end}");

                      setState(() {
                        values = value;
                        activity = value.end;
                        labels = RangeLabels(
                            "No physical Activity", "Your physical Activity");
                      });
                    },
                  ),
                ),
                Padding(
                  padding: EdgeInsets.symmetric(
                      horizontal: MediaQuery.of(context).size.width * .02),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: strLabels.map((i) {
                      return Text(
                        '$i',
                        style: TextStyle(
                            color: Color.fromARGB(255, 71, 104, 158),
                            fontSize:
                                MediaQuery.of(context).size.height * 0.022,
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
