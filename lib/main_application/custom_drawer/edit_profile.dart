import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';
import 'package:test1/http.dart';

class edit_profile_page extends StatefulWidget {
  List firstlist;
  edit_profile_page({Key? key, required this.firstlist}) : super(key: key);

  @override
  _edit_profile_pageState createState() => _edit_profile_pageState();
}

List<String> myinfo = [];
String Firstname = '';
String Lastname = '';
String Email = '';
String date = '';

class _edit_profile_pageState extends State<edit_profile_page> {
  show_accountinfo() async {
    var result = await http_get("accountinfo", {
      "id": widget.firstlist[0],
    });

    myinfo = result.data.split("&");
    Firstname = myinfo[0];
    Lastname = myinfo[1];
    Email = myinfo[2];
    var d = myinfo[3].split('T');
    date = d[0];
    setState(() {});
  }

  edit() async {
    var result = await http_post("change-account", {
      "id": widget.firstlist[0],
      "firstname": Firstname,
      "lastname": Lastname,
      "email": Email,
      "date": date,
    });

    setState(() {});
  }

  final TextEditingController txt = TextEditingController();
  DateTime dateTime = DateTime.now();
  final _ageKey = GlobalKey<FormState>();

  @override
  void initState() {
    show_accountinfo();
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
          child: ListView(
            children: [
              Padding(
                padding: EdgeInsets.only(
                  top: MediaQuery.of(context).size.height * 0.047,
                ),
              ),
              Row(
                children: [
                  IconButton(
                    icon: Icon(
                      Icons.edit_outlined,
                      color: Color.fromARGB(255, 19, 33, 55),
                    ),
                    onPressed: () {},
                  ),
                  Text(
                    "Edit Your Profile",
                    style: TextStyle(
                      fontSize: MediaQuery.of(context).size.width * 0.064,
                      fontWeight: FontWeight.w600,
                      color: Color(0xff132137),
                    ),
                  ),
                ],
              ),
              SizedBox(
                height: MediaQuery.of(context).size.height * 0.037,
              ),
              buildTextField("First Name", Firstname),
              buildTextField("Last Name", Lastname),
              buildTextField("E-mail", Email),
              Text(
                "Date of Birth",
                style: TextStyle(
                    fontSize: MediaQuery.of(context).size.width * 0.037,
                    fontWeight: FontWeight.w600,
                    color: Color.fromARGB(255, 105, 104, 104)),
              ),
              Padding(
                  padding: EdgeInsets.only(
                      bottom: MediaQuery.of(context).size.height * 0.007)),
              buildDateField(
                date,
                false,
                size,
                (valuesurname) {
                  if (valuesurname.length <= 2) {
                    // buildSnackError(
                    //   'Tab the icon to choose your Date of Birth',
                    //   context,
                    //   size,
                    // );
                    return '';
                  }
                  return null;
                },
                _ageKey,
                1,
              ),
              AnimatedPadding(
                duration: const Duration(milliseconds: 500),
                padding: EdgeInsets.only(
                    top: size.height * 0.025,
                    left: size.height * 0.07,
                    right: size.height * 0.07),
                child: Container(
                  height: size.height * 0.07,
                  width: size.width * 0.09,
                  decoration: BoxDecoration(
                      color: Color.fromARGB(255, 181, 217, 240),
                      borderRadius: BorderRadius.circular(20)),
                  child: FlatButton(
                    onPressed: () {
                      if (fname != '') Firstname = fname;
                      if (lname != '') Lastname = lname;
                      if (email != '') Email = email;
                      if (Date != '') date = Date;
                      edit();
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
            ],
          ),
        ),
      ),
    );
  }

  String fname = '';
  String lname = '';
  String email = '';
  String Date = '';
  Widget buildTextField(String labelText, String placeholder) {
    return Padding(
      padding:
          EdgeInsets.only(bottom: MediaQuery.of(context).size.height * 0.04),
      child: TextField(
        onChanged: (text) {
          if (placeholder == Firstname) fname = text;
          if (placeholder == Lastname) lname = text;
          if (placeholder == Email) email = text;
          if (placeholder == date) Date = text;
        },
        decoration: InputDecoration(
            contentPadding: EdgeInsets.only(
                bottom: MediaQuery.of(context).size.width * 0.005),
            labelText: labelText,
            labelStyle: TextStyle(
              fontSize: MediaQuery.of(context).size.width * 0.05,
              fontWeight: FontWeight.w600,
            ),
            floatingLabelBehavior: FloatingLabelBehavior.always,
            hintText: placeholder,
            hintStyle: TextStyle(
              fontSize: MediaQuery.of(context).size.width * 0.05,
              fontWeight: FontWeight.w500,
              color: Color(0xff132137),
            )),
      ),
    );
  }

  bool pwVisible = false;

  Widget buildDateField(
    String hintText,
    bool password,
    size,
    FormFieldValidator validator,
    Key key,
    int stringToEdit,
  ) {
    return Padding(
      padding:
          EdgeInsets.only(bottom: MediaQuery.of(context).size.height * 0.04),
      child: Container(
        width: size.width * 0.9,
        height: size.height * 0.05,
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
            decoration: InputDecoration(
              errorStyle: const TextStyle(height: 0),
              contentPadding: EdgeInsets.only(
                top: size.height * 0.006,
              ),
              hintText: hintText,
              hintStyle: TextStyle(
                fontSize: MediaQuery.of(context).size.width * 0.05,
                fontWeight: FontWeight.w500,
                color: Color(0xff132137),
              ),
              prefixIcon: Padding(
                padding: EdgeInsets.only(),
                child: IconButton(
                  color: Color(0xff132137),
                  onPressed: () {
                    Utils.showSheet(
                      context,
                      child: buildDatePicker(),
                      onClicked: () {
                        final value = DateFormat('yyyy/MM/dd').format(dateTime);

                        txt.text = value;
                        date = value;
                        TextStyle(
                          fontSize: MediaQuery.of(context).size.width * 0.05,
                          fontWeight: FontWeight.w500,
                          color: Color(0xff132137),
                        );
                        Navigator.pop(context);
                      },
                    );
                  },
                  icon: Icon(Icons.date_range_rounded),
                ),
              ),
            ),
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
}
