import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:ssr_project/component/style/size_colors.dart';

import '../../component/widgets/widgets.dart';


class compareHeatMap extends StatefulWidget {
  const compareHeatMap({Key? key}) : super(key: key);


  @override
  State<compareHeatMap> createState() => _compareHeatMapState();
}

class _compareHeatMapState extends State<compareHeatMap> {


 String selectedButton = 'Recommendation';

  List<BarChartGroupData> _getBarGroups() {
    List<List<double>> values = [
      [2, 1], // Hospitals
      [0.2, 1], // Metro Station
      [4, 2], // Hotels
      [0.3, 1], // Universities
      [1, 2], // Schools
      [3, 4], // Mega projects
      [4, 2], // Airports
    ];

    return List.generate(values.length, (index) {
      return BarChartGroupData(
        x: index,
        barRods: [
          BarChartRodData(toY: values[index][0], color:  Colors.indigo.shade900, width: 12),
          BarChartRodData(toY: values[index][1], color: Colors.blueGrey.shade400, width: 12),
        ],
      );
    });
  }

  FlTitlesData _getTitles() {
    return FlTitlesData(
      leftTitles: const AxisTitles(
        sideTitles: SideTitles(showTitles: true, reservedSize: 40),
      ),
      bottomTitles: AxisTitles(
        sideTitles: SideTitles(
          showTitles: true,
          getTitlesWidget: (value, meta) {
            List<String> labels = [
              "Hospitals",
              "Metro Station",
              "Hotels",
              "Universities",
              "Schools",
              "Mega projects",
              "Airports"
            ];
            return SideTitleWidget(
              //axisSide: meta.axisSide,
              meta: meta,
              child: Text(labels[value.toInt()], style: smallBlackTextStyle),
            );
          },
        ),
      ),
    );
  }



  @override
  Widget build(BuildContext context) {
    var _width = MediaQuery.of(context).size.width;
    var _hight = MediaQuery.of(context).size.height;

    return Scaffold(
      body: Row(
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              CircleAvatar(
                backgroundColor: Colors.black,
                radius: 21,
                child: CircleAvatar(
                  backgroundColor: Colors.grey.shade300,
                  child: IconButton(
                      onPressed: (){
                        setState(() {
                        });
                      }, icon: const Icon(Icons.place_outlined , color: Colors.black,)),
                ),
              ) ,
              const SizedBox(
                height: 20,
              ),
              CircleAvatar(
                backgroundColor: Colors.black,
                radius: 21,
                child: CircleAvatar(
                  backgroundColor: Colors.grey.shade300,
                  child: IconButton(
                      onPressed: () {
                      },
                      icon: const Icon(Icons.flag_outlined , color: Colors.black,)
                  ),
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              CircleAvatar(
                backgroundColor: Colors.black,
                radius: 21,
                child: CircleAvatar(
                  backgroundColor: Colors.grey.shade300,
                  child: IconButton(
                      onPressed: () {
                      },
                      icon: const Icon(Icons.compare_arrows , color: Colors.black,)
                  ),
                ),
              )
            ],
          ),
          const SizedBox(
            width: 20,
          ),
          Expanded(
            child: SingleChildScrollView(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                 AppBarName('User Name'),
                  const SizedBox(
                    height: 30,
                  ),
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Container(
                        height : _hight/9,
                        width: _width/3,
                        decoration: BoxDecoration(
                          color:  selectedButton == 'Recommendation' ? Colors.blue.shade100 : Colors.blue.shade50,
                          borderRadius: const BorderRadius.only(
                              topLeft: Radius.circular(20),
                              topRight: Radius.circular(20)
                          ),
                        ),
                        child: TextButton(
                          onPressed: () {
                            print('*************************');
                            setState(() {
                              selectedButton = 'Recommendation';
                            });

                          },
                          child: const Text('Recommendation' , style: TextStyle(fontSize: 14,color: Colors.black , fontWeight: FontWeight.bold),),
                        ),
                      ),
                      Container(
                        height : _hight/9,
                        width: _width/3,
                        decoration: BoxDecoration(
                          color: selectedButton == 'Demography' ? Colors.blue.shade100 : Colors.blue.shade50,
                          borderRadius: const BorderRadius.only(
                              topLeft: Radius.circular(20),
                              topRight: Radius.circular(20)
                          ),
                        ),
                        child: TextButton(
                          onPressed: () {
                            setState(() {
                              selectedButton = 'Demography';
                            });
                          },
                          child: const Text('Dynamics' , style: TextStyle(fontSize: 14,color: Colors.black , fontWeight: FontWeight.bold),),
                        ),
                      )
                    ],
                  ),
                  Container(
                    width: _width/1.5,
                    height: _hight/1.5,
                    decoration: const BoxDecoration(
                        color: Colors.pink,
                        borderRadius: BorderRadius.only(
                          bottomLeft: Radius.circular(40),
                          bottomRight: Radius.circular(40),
                        )
                    ),
                  ),
                  const SizedBox(
                    height: 9,
                  ),
                  Row(
                    children: [
                      Container(
                        width: _width/3,
                        height: _hight/2,
                        decoration: BoxDecoration(
                          color: Colors.white70,
                          borderRadius: BorderRadius.circular(40),
                          boxShadow: [
                            BoxShadow(
                              color: Colors.black.withOpacity(0.2),
                              blurRadius: 5,
                              offset: const Offset(5, 5),
                            ),
                          ],
                        ),
                        child:Column(
                          children: [
                            Padding(
                              padding: const EdgeInsets.all(22.0),
                              child: Row(
                                children: [
                                  Text('Delivery App Order Density' , style: bigBlueTextStyle,),
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
                                        titleStyle: const TextStyle(
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
                                        titleStyle: const TextStyle(
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
                            Center(child: Name())
                          ],
                        ),
                      ),
                      const SizedBox(
                        width: 5,
                      ),
                      Container(
                        width: _width/3,
                        height: _hight/2,
                        decoration: BoxDecoration(
                          color: Colors.grey.shade300,
                          borderRadius: BorderRadius.circular(40),
                          boxShadow: [
                            BoxShadow(
                              color: Colors.black.withOpacity(0.2),
                              blurRadius: 5,
                              offset: const Offset(5, 5),
                            ),
                          ],
                        ),
                        child: Column(
                          children: [
                            Padding(
                              padding: const EdgeInsets.all(22.0),
                              child: Row(
                                children: [
                                  Text('Average Price' , style: bigBlueTextStyle,),
                                ],
                              ),
                            ),
                              Center(
                              child: SizedBox(
                                height: 200,
                                width: 300,
                                child: BarChart(
                                  BarChartData(
                                    alignment: BarChartAlignment.spaceAround,
                                    maxY: 20,
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
                                              style: const TextStyle(color: Colors.black, fontSize: 12),
                                            );
                                          },
                                        ),
                                      ),
                                      bottomTitles: const AxisTitles(
                                        sideTitles: SideTitles(showTitles: false),
                                      ),
                                      topTitles: const AxisTitles(
                                        sideTitles: SideTitles(showTitles: false),
                                      ),
                                      rightTitles: const AxisTitles(
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
                                        //tooltipBgColor: Colors.white,
                                        getTooltipItem: (group, groupIndex, rod, rodIndex) {
                                          return BarTooltipItem(
                                            '\$${rod.toY}',
                                            const TextStyle(fontWeight: FontWeight.bold, color: Colors.black),
                                          );
                                        },
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                            ),
                            Name()
                          ],
                        ),
                      )
                    ],
                  ),
                  const SizedBox(
                    height: 13,
                  ),
                  Row(
                    children: [
                      Container(
                        width: _width/3,
                        height: _hight/2,
                        decoration: BoxDecoration(
                          color: Colors.grey.shade300,
                          borderRadius: BorderRadius.circular(40),
                          boxShadow: [
                            BoxShadow(
                              color: Colors.black.withOpacity(0.2),
                              blurRadius: 5,
                              offset: const Offset(5, 5),
                            ),
                          ],
                        ),
                        child:Column(
                          children: [
                            Padding(
                              padding: const EdgeInsets.all(22.0),
                              child: Row(
                                children: [
                                  Text('Demand Density' , style: bigBlueTextStyle,),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                      const SizedBox(
                        width: 5,
                      ),
                      Container(
                        width: _width/3,
                        height: _hight/2,
                        decoration: BoxDecoration(
                          color: Colors.white70,
                          borderRadius: BorderRadius.circular(40),
                          boxShadow: [
                            BoxShadow(
                              color: Colors.black.withOpacity(0.2),
                              blurRadius: 5,
                              offset: const Offset(5, 5),
                            ),
                          ],
                        ),
                        child: Column(
                          children: [
                            Padding(
                              padding: const EdgeInsets.all(22.0),
                              child: Row(
                                children: [
                                  Text('Population Density' , style: bigBlueTextStyle,),
                                ],
                              ),
                            ),
                            Container(
                              width: _width/4,
                              height: _hight/6.5,
                              decoration: BoxDecoration(
                                color:  Colors.indigo.shade900,
                                borderRadius: BorderRadius.circular(40),
                                boxShadow: [
                                  BoxShadow(
                                    color: Colors.black.withOpacity(0.2),
                                    blurRadius: 5,
                                    offset: const Offset(5, 5),
                                  ),
                                ],
                              ),
                              child: Row(
                                crossAxisAlignment: CrossAxisAlignment.center,
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  const Text('8000' , style: TextStyle(fontSize: 25,color: Colors.white,fontWeight: FontWeight.bold),),
                                  SizedBox(
                                    width: _width/9,
                                  ),
                                  const Icon(Icons.people , size: 40,color: Colors.white,)
                                ],
                              ),
                            ),
                            const SizedBox(
                              height: 10,
                            ),
                            Container(
                              width: _width/4,
                              height: _hight/6.5,
                              decoration: BoxDecoration(
                                color: Colors.blueGrey.shade400,
                                borderRadius: BorderRadius.circular(40),
                                boxShadow: [
                                  BoxShadow(
                                    color: Colors.black.withOpacity(0.2),
                                    blurRadius: 5,
                                    offset: const Offset(5, 5),
                                  ),
                                ],
                              ),
                              child: Row(
                                crossAxisAlignment: CrossAxisAlignment.center,
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  const Icon(Icons.people , size: 40, color: Colors.white,),
                                  SizedBox(
                                    width: _width/9,
                                  ),
                                  const Text('8000' , style: TextStyle(fontSize: 25,color: Colors.white,fontWeight: FontWeight.bold),),

                                ],
                              ),
                            ),
                          ],
                        ),
                      )
                    ],
                  ),
                  const SizedBox(
                    height: 13,
                  ),
                  Container(
                    width: _width/1.5,
                    height: _hight/2,
                    decoration: BoxDecoration(
                        color: Colors.white70,
                        borderRadius: BorderRadius.circular(40),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.black.withOpacity(0.2),
                          blurRadius: 5,
                          offset: const Offset(5, 5),
                        ),
                      ],
                    ),
                    child: Column(
                        children: [
                          Padding(
                              padding: const EdgeInsets.all(22.0),
                              child: Row(
                                  children: [
                                    Text('Facilities' , style:  bigBlueTextStyle,),
                                  ]
                              )
                          ),
                          Expanded(
                            child: BarChart(
                              BarChartData(
                                barGroups: _getBarGroups(),
                                titlesData: _getTitles(),
                                borderData: FlBorderData(show: false),
                                gridData: const FlGridData(show: true, drawHorizontalLine: true),
                              ),
                            ),
                          ),

                        ]
                    ),
                  ),





                ],
              ),
            ),
          ),
        ],
      ),

    );
  }


}
