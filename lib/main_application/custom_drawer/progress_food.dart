import 'package:syncfusion_flutter_charts/charts.dart';
import 'package:test1/app_theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:liquid_progress_indicator/liquid_progress_indicator.dart';
import 'package:charts_flutter/flutter.dart' as charts;
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class Progress_screen2 extends StatefulWidget {
  List firstlist;
  List<ChartData> chartData2;
  List<ChartData> chartData4;
  List<ChartData> chartData6;
  Progress_screen2({
    Key? key,
    required this.firstlist,
    required this.chartData2,
    required this.chartData4,
    required this.chartData6,
  }) : super(key: key);

  @override
  _Progress_screen2State createState() => _Progress_screen2State();
}

class _Progress_screen2State extends State<Progress_screen2> {
  String title1 = "Dates";

  final List<ChartData> chartData = [
    ChartData(dd1[0], 100),
    ChartData(dd2[0], 100),
    ChartData(dd3[0], 100),
    ChartData(dd4[0], 100),
    ChartData(dd5[0], 100),
    ChartData(dd6[0], 100),
    ChartData(dd7[0], 100),
  ];

  // final List<ChartData> chartData2 = [
  //   ChartData("2022-05-09", 110),
  //   ChartData("2022-05-10", 90),
  //   ChartData("2022-05-11", 100),
  //   ChartData("2022-05-12", 112),
  //   ChartData("2022-05-13", 110),
  //   ChartData("2022-05-14", 100),
  //   ChartData("2022-05-15", 95),
  // ];

  final List<ChartData> chartData3 = [
    ChartData(dd1[0], 200),
    ChartData(dd2[0], 200),
    ChartData(dd3[0], 200),
    ChartData(dd4[0], 200),
    ChartData(dd5[0], 200),
    ChartData(dd6[0], 200),
    ChartData(dd7[0], 200),
  ];
  // final List<ChartData> chartData4 = [
  //   ChartData("2022-05-09", 210),
  //   ChartData("2022-05-10", 190),
  //   ChartData("2022-05-11", 200),
  //   ChartData("2022-05-12", 170),
  //   ChartData("2022-05-13", 220),
  //   ChartData("2022-05-14", 140),
  //   ChartData("2022-05-15", 157),
  // ];
  final List<ChartData> chartData5 = [
    ChartData(dd1[0], 300),
    ChartData(dd2[0], 300),
    ChartData(dd3[0], 300),
    ChartData(dd4[0], 300),
    ChartData(dd5[0], 300),
    ChartData(dd6[0], 300),
    ChartData(dd7[0], 300),
  ];
  // final List<ChartData> chartData6 = [
  //   ChartData("2022-05-09", 210),
  //   ChartData("2022-05-10", 190),
  //   ChartData("2022-05-11", 270),
  //   ChartData("2022-05-12", 170),
  //   ChartData("2022-05-13", 290),
  //   ChartData("2022-05-14", 140),
  //   ChartData("2022-05-15", 157),
  // ];
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
                    "Weekly Food Recap",
                    textAlign: TextAlign.center,
                    style: TextStyle(
                        color: Color.fromARGB(255, 9, 78, 153),
                        fontSize: size.width * 0.045,
                        fontWeight: FontWeight.w600),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(
                      top: MediaQuery.of(context).size.width * 0.04),
                ),
                Center(
                    child: Container(
                        width: size.width * 0.99,
                        height: size.height * 0.53,
                        child: SfCartesianChart(
                            title: ChartTitle(
                                text: "Carbs",
                                textStyle: TextStyle(
                                    color: Color.fromARGB(255, 136, 60, 89),
                                    fontSize: size.width * 0.04,
                                    fontStyle: FontStyle.italic,
                                    fontWeight: FontWeight.w600)),
                            primaryXAxis: CategoryAxis(
                                title: AxisTitle(
                                    text: title1,
                                    textStyle: TextStyle(
                                        color: Color.fromARGB(255, 136, 60, 89),
                                        fontSize: size.width * 0.04,
                                        fontStyle: FontStyle.italic,
                                        fontWeight: FontWeight.w600)),
                                labelStyle: TextStyle(
                                    color: Color.fromARGB(255, 19, 33, 55),
                                    fontSize: size.width * 0.02,
                                    fontWeight: FontWeight.w800)),
                            primaryYAxis: NumericAxis(
                                labelPosition: ChartDataLabelPosition.inside,
                                title: AxisTitle(
                                    text: "Carbs in gm",
                                    textStyle: TextStyle(
                                        color: Color.fromARGB(255, 136, 60, 89),
                                        fontSize: size.width * 0.025,
                                        fontStyle: FontStyle.italic,
                                        fontWeight: FontWeight.w700)),
                                labelStyle: TextStyle(
                                    color: Color.fromARGB(255, 19, 33, 55),
                                    fontSize: size.width * 0.02,
                                    fontWeight: FontWeight.w800)),
                            legend: Legend(
                                position: LegendPosition.top,
                                isVisible: true,
                                borderColor: Color.fromARGB(255, 19, 33, 55),
                                borderWidth: 0),
                            backgroundColor: Color.fromARGB(255, 210, 232, 238),
                            borderColor: Color.fromARGB(255, 19, 33, 55),
                            borderWidth: 1.5,
                            series: <ChartSeries>[
                              LineSeries<ChartData, String>(
                                  name: 'Needed Carbs',
                                  dataSource: chartData3,
                                  xValueMapper: (ChartData data, _) => data.x,
                                  yValueMapper: (ChartData data, _) => data.y),
                              LineSeries<ChartData, String>(
                                  name: 'Consumed Carbs',
                                  dataSource: widget.chartData4,
                                  xValueMapper: (ChartData data, _) => data.x,
                                  yValueMapper: (ChartData data, _) => data.y)
                            ]))),
                Padding(
                  padding: EdgeInsets.only(
                      top: MediaQuery.of(context).size.width * 0.04),
                ),
                Center(
                    child: Container(
                        width: size.width * 0.99,
                        height: size.height * 0.53,
                        child: SfCartesianChart(
                            title: ChartTitle(
                                text: "Protein",
                                textStyle: TextStyle(
                                    color: Color.fromARGB(255, 136, 60, 89),
                                    fontSize: size.width * 0.04,
                                    fontStyle: FontStyle.italic,
                                    fontWeight: FontWeight.w600)),
                            primaryXAxis: CategoryAxis(
                                title: AxisTitle(
                                    text: title1,
                                    textStyle: TextStyle(
                                        color: Color.fromARGB(255, 136, 60, 89),
                                        fontSize: size.width * 0.04,
                                        fontStyle: FontStyle.italic,
                                        fontWeight: FontWeight.w600)),
                                labelStyle: TextStyle(
                                    color: Color.fromARGB(255, 19, 33, 55),
                                    fontSize: size.width * 0.02,
                                    fontWeight: FontWeight.w800)),
                            primaryYAxis: NumericAxis(
                                labelPosition: ChartDataLabelPosition.inside,
                                title: AxisTitle(
                                    text: "Protein in gm",
                                    textStyle: TextStyle(
                                        color: Color.fromARGB(255, 136, 60, 89),
                                        fontSize: size.width * 0.025,
                                        fontStyle: FontStyle.italic,
                                        fontWeight: FontWeight.w700)),
                                labelStyle: TextStyle(
                                    color: Color.fromARGB(255, 19, 33, 55),
                                    fontSize: size.width * 0.02,
                                    fontWeight: FontWeight.w800)),
                            legend: Legend(
                                position: LegendPosition.top,
                                isVisible: true,
                                borderColor: Color.fromARGB(255, 19, 33, 55),
                                borderWidth: 0),
                            backgroundColor: Color.fromARGB(255, 208, 192, 214),
                            borderColor: Color.fromARGB(255, 19, 33, 55),
                            borderWidth: 1.5,
                            series: <ChartSeries>[
                              LineSeries<ChartData, String>(
                                  name: 'Needed Protein',
                                  dataSource: chartData,
                                  xValueMapper: (ChartData data, _) => data.x,
                                  yValueMapper: (ChartData data, _) => data.y),
                              LineSeries<ChartData, String>(
                                  name: 'Consumed Protein',
                                  dataSource: widget.chartData2,
                                  xValueMapper: (ChartData data, _) => data.x,
                                  yValueMapper: (ChartData data, _) => data.y)
                            ]))),
                Padding(
                  padding: EdgeInsets.only(
                      top: MediaQuery.of(context).size.width * 0.04),
                ),
                Center(
                    child: Container(
                        width: size.width * 0.99,
                        height: size.height * 0.53,
                        child: SfCartesianChart(
                            title: ChartTitle(
                                text: "Cholesterol",
                                textStyle: TextStyle(
                                    color: Color.fromARGB(255, 136, 60, 89),
                                    fontSize: size.width * 0.04,
                                    fontStyle: FontStyle.italic,
                                    fontWeight: FontWeight.w600)),
                            primaryXAxis: CategoryAxis(
                                title: AxisTitle(
                                    text: title1,
                                    textStyle: TextStyle(
                                        color: Color.fromARGB(255, 136, 60, 89),
                                        fontSize: size.width * 0.04,
                                        fontStyle: FontStyle.italic,
                                        fontWeight: FontWeight.w600)),
                                labelStyle: TextStyle(
                                    color: Color.fromARGB(255, 19, 33, 55),
                                    fontSize: size.width * 0.02,
                                    fontWeight: FontWeight.w800)),
                            primaryYAxis: NumericAxis(
                                labelPosition: ChartDataLabelPosition.inside,
                                title: AxisTitle(
                                    text: "Cholesterol in milli gm",
                                    textStyle: TextStyle(
                                        color: Color.fromARGB(255, 136, 60, 89),
                                        fontSize: size.width * 0.025,
                                        fontStyle: FontStyle.italic,
                                        fontWeight: FontWeight.w700)),
                                labelStyle: TextStyle(
                                    color: Color.fromARGB(255, 19, 33, 55),
                                    fontSize: size.width * 0.02,
                                    fontWeight: FontWeight.w800)),
                            legend: Legend(
                                position: LegendPosition.top,
                                isVisible: true,
                                borderColor: Color.fromARGB(255, 19, 33, 55),
                                borderWidth: 0),
                            backgroundColor: Color.fromARGB(255, 207, 198, 185),
                            borderColor: Color.fromARGB(255, 19, 33, 55),
                            borderWidth: 1.5,
                            series: <ChartSeries>[
                              LineSeries<ChartData, String>(
                                  name: 'Needed Cholesterol',
                                  dataSource: chartData5,
                                  xValueMapper: (ChartData data, _) => data.x,
                                  yValueMapper: (ChartData data, _) => data.y),
                              LineSeries<ChartData, String>(
                                  name: 'Consumed Cholesterol',
                                  dataSource: widget.chartData6,
                                  xValueMapper: (ChartData data, _) => data.x,
                                  yValueMapper: (ChartData data, _) => data.y)
                            ])))
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class ChartData {
  ChartData(this.x, this.y);
  final String x;
  final double? y;
}

final DateTime ddate1 = DateTime.now().subtract(Duration(days: 1));
List<String> dd1 = ddate1.toString().split(" ");
final DateTime ddate2 = DateTime.now().subtract(Duration(days: 2));
List<String> dd2 = ddate2.toString().split(" ");
final DateTime ddate3 = DateTime.now().subtract(Duration(days: 3));
List<String> dd3 = ddate3.toString().split(" ");
final DateTime ddate4 = DateTime.now().subtract(Duration(days: 4));
List<String> dd4 = ddate4.toString().split(" ");
final DateTime ddate5 = DateTime.now().subtract(Duration(days: 5));
List<String> dd5 = ddate5.toString().split(" ");
final DateTime ddate6 = DateTime.now().subtract(Duration(days: 6));
List<String> dd6 = ddate6.toString().split(" ");
final DateTime ddate7 = DateTime.now().subtract(Duration(days: 7));
List<String> dd7 = ddate7.toString().split(" ");
