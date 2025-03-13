import 'dart:html';
import 'dart:ui';
import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:flutter/material.dart';
import 'package:ssr_project/component/style/size_colors.dart';
import 'package:ssr_project/component/widgets/widgets.dart';
import 'package:fl_chart/fl_chart.dart';

class reviews extends StatefulWidget {
  @override
  State<reviews> createState() => _reviewsState();
}

class _reviewsState extends State<reviews> {
  TextEditingController brunchNameControllerInReview = TextEditingController();

  @override
  Widget build(BuildContext context) {
    var _width = MediaQuery.of(context).size.width;
    var _hight = MediaQuery.of(context).size.height;
    return Padding(
      padding: const EdgeInsets.only(left: 40),
      child: Row(
        children: [
          Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  Container(
                    width: 130,
                    height: 50,
                    decoration: BoxDecoration(
                      color: Colors.blue.shade100,
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: TextButton(
                      onPressed: () {
                        showDialog(
                            context: context,
                            builder: (BuildContext context2) {
                              return Dialog(
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(20.0),
                                ),
                                child: Container(
                                  width: 900,
                                  height: 600,
                                  padding: EdgeInsets.all(20.0),
                                  child: SingleChildScrollView(
                                    child: Column(
                                      mainAxisSize: MainAxisSize.min,
                                      children: [
                                        SizedBox(height: 15.0),
                                        Padding(
                                          padding:
                                              const EdgeInsets.only(left: 40),
                                          child: Column(
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.start,
                                              children: [
                                                SizedBox(height: 15.0),
                                                Container(
                                                  width: 400,
                                                  child: TextField(
                                                    controller:
                                                        brunchNameControllerInReview,
                                                    decoration: InputDecoration(
                                                      hintText: "Brunch Name",
                                                      border:
                                                          OutlineInputBorder(
                                                        borderRadius:
                                                            BorderRadius
                                                                .circular(10),
                                                        borderSide: BorderSide(
                                                            color: Colors.grey),
                                                      ),
                                                      contentPadding:
                                                          EdgeInsets.symmetric(
                                                              horizontal: 12,
                                                              vertical: 15),
                                                    ),
                                                  ),
                                                ),
                                                SizedBox(height: 10.0),
                                                Container(
                                                  width: _width / 1,
                                                  height: _hight / 1.5,
                                                  decoration: BoxDecoration(
                                                      color: Colors.pink,
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              40)),
                                                )
                                              ]),
                                        ),
                                        SizedBox(height: 30.0),
                                        Center(
                                          child: Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.center,
                                            children: [
                                              Container(
                                                width: 90,
                                                height: 50,
                                                decoration: BoxDecoration(
                                                  color: Colors.red,
                                                  borderRadius:
                                                      BorderRadius.circular(10),
                                                ),
                                                child: TextButton(
                                                  child: Text(
                                                    'Cancel',
                                                    style: TextStyle(
                                                        fontSize: 15,
                                                        color: Colors.white),
                                                  ),
                                                  onPressed: () {
                                                    Navigator.of(context).pop();
                                                  },
                                                ),
                                              ),
                                              SizedBox(
                                                width: 30,
                                              ),
                                              Container(
                                                width: 90,
                                                height: 50,
                                                decoration: BoxDecoration(
                                                  color: Colors.blue.shade900,
                                                  borderRadius:
                                                      BorderRadius.circular(10),
                                                ),
                                                child: TextButton(
                                                    child: Text(
                                                      'Submit',
                                                      style: TextStyle(
                                                          fontSize: 15,
                                                          color: Colors.white),
                                                    ),
                                                    onPressed: () {
                                                      showDialog(
                                                          context: context,
                                                          builder: (BuildContext
                                                              context) {
                                                            return Dialog(
                                                              shape:
                                                                  RoundedRectangleBorder(
                                                                borderRadius:
                                                                    BorderRadius
                                                                        .circular(
                                                                            20.0),
                                                              ),
                                                              child: Container(
                                                                width: 900,
                                                                height: 500,
                                                                padding:
                                                                    EdgeInsets
                                                                        .all(
                                                                            20.0),
                                                                child:
                                                                    SingleChildScrollView(
                                                                  child: Column(
                                                                    mainAxisSize:
                                                                        MainAxisSize
                                                                            .min,
                                                                    children: [
                                                                      SizedBox(
                                                                          height:
                                                                              15.0),
                                                                      Padding(
                                                                        padding:
                                                                            const EdgeInsets.symmetric(horizontal: 40),
                                                                        child: Column(
                                                                            children: [
                                                                              Row(
                                                                                children: [
                                                                                  Container(
                                                                                    width: _width / 4,
                                                                                    height: _hight / 2,
                                                                                    decoration: BoxDecoration(
                                                                                      color: Colors.white,
                                                                                      borderRadius: BorderRadius.circular(40),
                                                                                      boxShadow: [
                                                                                        BoxShadow(
                                                                                          color: Colors.black.withOpacity(0.2),
                                                                                          blurRadius: 10,
                                                                                          offset: Offset(5, 5),
                                                                                        ),
                                                                                      ],
                                                                                    ),
                                                                                    child: Column(
                                                                                      children: [
                                                                                        Padding(
                                                                                          padding: const EdgeInsets.all(22.0),
                                                                                          child: Row(
                                                                                            children: [
                                                                                              Text(
                                                                                                'Delivery App Order Density',
                                                                                                style: bigBlueTextStyle,
                                                                                              ),
                                                                                            ],
                                                                                          ),
                                                                                        ),
                                                                                        Center(
                                                                                          child: SizedBox(
                                                                                            height: 200,
                                                                                            width: 200,
                                                                                            child: PieChart(
                                                                                              PieChartData(
                                                                                                sections: [
                                                                                                  PieChartSectionData(
                                                                                                    value: 55,
                                                                                                    color: Colors.indigo.shade900,
                                                                                                    radius: 40,
                                                                                                    title: '55%',
                                                                                                    titleStyle: TextStyle(
                                                                                                      fontSize: 16,
                                                                                                      fontWeight: FontWeight.bold,
                                                                                                      color: Colors.white,
                                                                                                    ),
                                                                                                  ),
                                                                                                  PieChartSectionData(
                                                                                                    value: 45,
                                                                                                    color: Colors.blueGrey.shade400,
                                                                                                    radius: 40,
                                                                                                    title: '45%',
                                                                                                    titleStyle: TextStyle(
                                                                                                      fontSize: 16,
                                                                                                      fontWeight: FontWeight.bold,
                                                                                                      color: Colors.white,
                                                                                                    ),
                                                                                                  ),
                                                                                                ],
                                                                                                sectionsSpace: 0,
                                                                                                centerSpaceRadius: 50,
                                                                                              ),
                                                                                            ),
                                                                                          ),
                                                                                        ),
                                                                                        const SizedBox(
                                                                                          height: 15,
                                                                                        ),
                                                                                        Name(),
                                                                                      ],
                                                                                    ),
                                                                                  ),
                                                                                  SizedBox(width: 15.0),
                                                                                  Container(
                                                                                    width: _width / 4,
                                                                                    height: _hight / 2,
                                                                                    decoration: BoxDecoration(
                                                                                      color: Colors.white,
                                                                                      borderRadius: BorderRadius.circular(40),
                                                                                      boxShadow: [
                                                                                        BoxShadow(
                                                                                          color: Colors.black.withOpacity(0.2),
                                                                                          blurRadius: 10,
                                                                                          offset: Offset(5, 5),
                                                                                        ),
                                                                                      ],
                                                                                    ),
                                                                                    child: Column(
                                                                                      children: [
                                                                                        Padding(
                                                                                          padding: const EdgeInsets.all(22.0),
                                                                                          child: Row(
                                                                                            children: [
                                                                                              Text(
                                                                                                'Number of visit ',
                                                                                                style: bigBlueTextStyle,
                                                                                              ),
                                                                                            ],
                                                                                          ),
                                                                                        ),
                                                                                        Container(
                                                                                          width: _width / 5,
                                                                                          height: _hight / 7.5,
                                                                                          decoration: BoxDecoration(
                                                                                            color: Colors.blue.shade100,
                                                                                            borderRadius: BorderRadius.circular(40),
                                                                                          ),
                                                                                          child: Row(
                                                                                            crossAxisAlignment: CrossAxisAlignment.center,
                                                                                            mainAxisAlignment: MainAxisAlignment.center,
                                                                                            children: [
                                                                                              Text(
                                                                                                '8000',
                                                                                                style: bigBlueTextStyle,
                                                                                              ),
                                                                                              SizedBox(
                                                                                                width: _width / 9,
                                                                                              ),
                                                                                              Icon(
                                                                                                Icons.people,
                                                                                                size: 40,
                                                                                              )
                                                                                            ],
                                                                                          ),
                                                                                        ),
                                                                                        const SizedBox(
                                                                                          height: 10,
                                                                                        ),
                                                                                        Container(
                                                                                          width: _width / 5,
                                                                                          height: _hight / 7.5,
                                                                                          decoration: BoxDecoration(
                                                                                            color: Colors.grey,
                                                                                            borderRadius: BorderRadius.circular(40),
                                                                                          ),
                                                                                          child: Row(
                                                                                            crossAxisAlignment: CrossAxisAlignment.center,
                                                                                            mainAxisAlignment: MainAxisAlignment.center,
                                                                                            children: [
                                                                                              Icon(
                                                                                                Icons.people,
                                                                                                size: 40,
                                                                                              ),
                                                                                              SizedBox(
                                                                                                width: _width / 9,
                                                                                              ),
                                                                                              Text(
                                                                                                '8000',
                                                                                                style: bigBlueTextStyle,
                                                                                              ),
                                                                                            ],
                                                                                          ),
                                                                                        ),
                                                                                        const SizedBox(
                                                                                          height: 15,
                                                                                        ),
                                                                                       Name()
                                                                                      ],
                                                                                    ),
                                                                                  ),
                                                                                ],
                                                                              ),
                                                                            ]),
                                                                      ),
                                                                      SizedBox(
                                                                          height:
                                                                              30.0),
                                                                      Center(
                                                                        child:
                                                                            Container(
                                                                          width:
                                                                              _width / 4,
                                                                          height:
                                                                              _hight / 2,
                                                                          decoration:
                                                                              BoxDecoration(
                                                                            color:
                                                                                Colors.white,
                                                                            borderRadius:
                                                                                BorderRadius.circular(40),
                                                                            boxShadow: [
                                                                              BoxShadow(
                                                                                color: Colors.black.withOpacity(0.2),
                                                                                blurRadius: 10,
                                                                                offset: Offset(5, 5),
                                                                              ),
                                                                            ],
                                                                          ),
                                                                          child:
                                                                              Column(
                                                                            children: [
                                                                              Padding(
                                                                                padding: const EdgeInsets.all(22.0),
                                                                                child: bidTitle('Review', bigBlueTextStyle),
                                                                              ),
                                                                              const SizedBox(
                                                                                height: 25,
                                                                              ),
                                                                              SizedBox(
                                                                                height: 200,
                                                                                width: 200,
                                                                                child: BarChart(
                                                                                  BarChartData(
                                                                                    //alignment: BarChartAlignment.spaceAround,
                                                                                    maxY: 400,
                                                                                    minY: 0,
                                                                                    barGroups: [
                                                                                      BarChartGroupData(
                                                                                        x: 1,
                                                                                        barRods: [
                                                                                          BarChartRodData(
                                                                                            toY: 18,
                                                                                            color: Colors.indigo.shade900,
                                                                                            width: 16,
                                                                                            borderRadius: BorderRadius.circular(8),
                                                                                          ),
                                                                                        ],
                                                                                      ),
                                                                                      BarChartGroupData(
                                                                                        x: 2,
                                                                                        barRods: [
                                                                                          BarChartRodData(
                                                                                            toY: 14,
                                                                                            color: Colors.blueGrey.shade400,
                                                                                            width: 16,
                                                                                            borderRadius: BorderRadius.circular(8),
                                                                                          ),
                                                                                        ],
                                                                                      ),
                                                                                    ],
                                                                                    titlesData: FlTitlesData(
                                                                                      leftTitles: AxisTitles(
                                                                                        sideTitles: SideTitles(
                                                                                          showTitles: true,
                                                                                          reservedSize: 40,
                                                                                          getTitlesWidget: (value, meta) {
                                                                                            return Text(
                                                                                              '\$${value.toInt()}',
                                                                                              style: TextStyle(color: Colors.black, fontSize: 12),
                                                                                            );
                                                                                          },
                                                                                        ),
                                                                                      ),
                                                                                      bottomTitles: AxisTitles(
                                                                                        sideTitles: SideTitles(showTitles: false),
                                                                                      ),
                                                                                      topTitles: AxisTitles(
                                                                                        sideTitles: SideTitles(showTitles: false),
                                                                                      ),
                                                                                      rightTitles: AxisTitles(
                                                                                        sideTitles: SideTitles(showTitles: false),
                                                                                      ),
                                                                                    ),
                                                                                    gridData: FlGridData(
                                                                                      show: true,
                                                                                      drawHorizontalLine: true,
                                                                                      checkToShowHorizontalLine: (value) => true,
                                                                                      getDrawingHorizontalLine: (value) => FlLine(
                                                                                        color: Colors.grey.shade300,
                                                                                        strokeWidth: 1,
                                                                                      ),
                                                                                    ),
                                                                                    barTouchData: BarTouchData(
                                                                                      enabled: true,
                                                                                      touchTooltipData: BarTouchTooltipData(
                                                                                        tooltipBgColor: Colors.white,
                                                                                        getTooltipItem: (group, groupIndex, rod, rodIndex) {
                                                                                          return BarTooltipItem(
                                                                                            '\$${rod.toY}',
                                                                                            TextStyle(fontWeight: FontWeight.bold, color: Colors.black),
                                                                                          );
                                                                                        },
                                                                                      ),
                                                                                    ),
                                                                                  ),
                                                                                ),
                                                                              ),
                                                                            ],
                                                                          ),
                                                                        ),
                                                                      ),
                                                                      SizedBox(
                                                                          height:
                                                                              30.0),
                                                                    ],
                                                                  ),
                                                                ),
                                                              ),
                                                            );
                                                          });
                                                    }),
                                              ),
                                            ],
                                          ),
                                        )
                                      ],
                                    ),
                                  ),
                                ),
                              );
                            });
                      },
                      child: Text(
                        'Compare with',
                        style: smallBlackTextStyle,
                      ),
                    ),
                  ),
                ],
              ),
              SizedBox(
                height: 30,
              ),
              Container(
                width: _width / 3,
                height: _hight / 6.5,
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(40),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black.withOpacity(0.2),
                      blurRadius: 10,
                      offset: Offset(5, 5),
                    ),
                  ],
                ),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      'Number of visitors',
                      style: bigBlueTextStyle,
                    ),
                    SizedBox(
                      width: _width / 9,
                    ),
                    Text(
                      '8000',
                      style: bigBlueTextStyle,
                    ),
                  ],
                ),
              ),
              const SizedBox(
                height: 30,
              ),
              Container(
                width: _width / 3,
                height: _hight / 3,
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(40),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black.withOpacity(0.2),
                      blurRadius: 10,
                      offset: Offset(5, 5),
                    ),
                  ],
                ),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      'Review Summary',
                      style: bigBlueTextStyle,
                    ),
                  ],
                ),
              ),
              const SizedBox(
                height: 30,
              ),
              Container(
                width: 90,
                height: 50,
                decoration: BoxDecoration(
                  color: Colors.blue.shade900,
                  borderRadius: BorderRadius.circular(10),
                ),
                child: TextButton(
                  child: Text(
                    'Delete',
                    style: TextStyle(fontSize: 15, color: Colors.white),
                  ),
                  onPressed: () {
                    AwesomeDialog(
                      width: 500,
                      context: context,
                      dialogType: DialogType.success,
                      animType: AnimType.rightSlide,
                      //title: '',
                      desc: 'The operation was successful',
                      btnCancelOnPress: () {},
                      btnOkOnPress: () {},
                    ).show();
                  },
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
