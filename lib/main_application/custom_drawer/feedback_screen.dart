import 'package:google_fonts/google_fonts.dart';
import 'package:test1/app_theme.dart';
import 'package:flutter/material.dart';
import 'package:test1/http.dart';

class FeedbackScreen extends StatefulWidget {
  List firstlist;
  FeedbackScreen({Key? key, required this.firstlist}) : super(key: key);

  @override
  _FeedbackScreenState createState() => _FeedbackScreenState();
}

class _FeedbackScreenState extends State<FeedbackScreen> {
  addFeedback() async {
    print(widget.firstlist[0]);
    print(feedbackText);
    var result = await http_post("userfeedback", {
      "id": widget.firstlist[0],
      "feedback": feedbackText,
    });
    print(result);
    if (result.ok) {
      setState(() {
        var response = result.data['status'];
      });
    }
  }

  String feedbackText = "";
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
          body: SingleChildScrollView(
            child: SizedBox(
              height: MediaQuery.of(context).size.height,
              child: Column(
                children: <Widget>[
                  SizedBox(
                    height: MediaQuery.of(context).padding.top,
                  ),
                  Padding(
                    padding: EdgeInsets.only(
                      top: MediaQuery.of(context).size.height * 0.02,
                    ),
                  ),
                  Container(
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
                  Container(
                    padding: EdgeInsets.only(
                      top: MediaQuery.of(context).size.height * 0.05,
                    ),
                    child: Image.asset(
                      'assets/others/feedback.png',
                      width: MediaQuery.of(context).size.width,
                      height: MediaQuery.of(context).size.height * 0.4,
                    ),
                  ),
                  Container(
                    padding: EdgeInsets.only(top: size.height * 0.01),
                    child: Text(
                      'We would love to Hear your Opinion ',
                      textAlign: TextAlign.center,
                      style: GoogleFonts.poppins(
                          color: Color.fromARGB(255, 19, 33, 55),
                          fontSize: size.width * 0.05,
                          fontWeight: FontWeight.w600),
                    ),
                  ),
                  _buildComposer(),
                  AnimatedPadding(
                    duration: const Duration(milliseconds: 500),
                    padding: EdgeInsets.only(top: size.height * 0.025),
                    child: Container(
                      height: size.height * 0.057,
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
                              Color.fromARGB(255, 71, 104, 158),
                              Color.fromARGB(255, 19, 33, 55),
                            ],
                          ),
                          borderRadius: BorderRadius.circular(20)),
                      child: FlatButton(
                        onPressed: addFeedback,
                        child: Text(
                          'Send',
                          style: GoogleFonts.satisfy(
                              color: Colors.white,
                              fontSize: size.width * 0.07,
                              fontWeight: FontWeight.w500),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildComposer() {
    return Padding(
      padding: EdgeInsets.only(
          top: MediaQuery.of(context).size.height * 0.02,
          left: MediaQuery.of(context).size.width * 0.07,
          right: MediaQuery.of(context).size.width * 0.07),
      child: Container(
        alignment: Alignment.center,
        decoration: BoxDecoration(
          color: Color.fromARGB(255, 181, 217, 240).withOpacity(0.8),
          borderRadius: BorderRadius.circular(17),
          boxShadow: <BoxShadow>[
            BoxShadow(
                color: Color.fromARGB(255, 19, 33, 55).withOpacity(0.8),
                offset: const Offset(4, 4),
                blurRadius: 8),
          ],
        ),
        child: ClipRRect(
          borderRadius: BorderRadius.circular(25),
          child: Container(
            padding: EdgeInsets.all(MediaQuery.of(context).size.height * 0.009),
            constraints: BoxConstraints(
                minHeight: MediaQuery.of(context).size.height * 0.13,
                maxHeight: MediaQuery.of(context).size.height * 0.23),
            color: Color.fromARGB(255, 181, 217, 240).withOpacity(0.8),
            child: SingleChildScrollView(
              child: TextField(
                maxLines: null,
                onChanged: (String txt) {
                  feedbackText = txt;
                },
                style: TextStyle(
                  fontFamily: AppTheme.fontName,
                  fontSize: 16,
                  color: AppTheme.dark_grey,
                ),
                cursorColor: Color.fromARGB(255, 19, 33, 55),
                decoration: InputDecoration(
                    border: InputBorder.none,
                    hintText: 'Enter your feedback...'),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
