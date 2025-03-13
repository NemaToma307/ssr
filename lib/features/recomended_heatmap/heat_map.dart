import 'dart:html';

import 'package:flutter/material.dart';
import 'package:ssr_project/component/style/size_colors.dart';

import '../../component/widgets/widgets.dart';


class heatMap extends StatefulWidget {

  @override
  State<heatMap> createState() => _heatMapState();
}

class _heatMapState extends State<heatMap> {
  @override
  Widget build(BuildContext context) {
    var _width = MediaQuery.of(context).size.width;
    var _hight = MediaQuery.of(context).size.height;

    return Scaffold(
      body: Row(
        children: [
          Column(
            // crossAxisAlignment: CrossAxisAlignment.center,
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
                      }, icon: Icon(Icons.place_outlined , color: Colors.black,)),
                ),
              ) ,
              SizedBox(
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
                      icon: Icon(Icons.flag_outlined , color: Colors.black,)
                  ),
                ),
              )
            ],
          ),
          SizedBox(
            width: 20,
          ),
          Expanded(
            child: SingleChildScrollView(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  AppBarName('UserName'),
                  SizedBox(
                    height: 30,
                  ),
                  Container(
                    width: _width/1.5,
                    height: _hight/1.5,
                    decoration: BoxDecoration(
                        color: Colors.pink,
                        borderRadius: BorderRadius.circular(40)
                    ),
                  ),
                  SizedBox(
                    height: 9,
                  ),
                  Row(
                    children: [
                      Container(
                        width: _width/2.5,
                        height: _hight/2,
                        decoration: BoxDecoration(
                          color: Colors.grey.shade300,
                          borderRadius: BorderRadius.circular(40),
                        ),
                        child:  GridView.builder(
                          //scrollDirection : Axis.horizontal,
                          itemCount: 3,
                          itemBuilder: (context, index) {
                            return Cards('9' , 'ii' , Icons.car_rental);
                          },
                          shrinkWrap: true,
                          physics: const NeverScrollableScrollPhysics(),
                          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                            crossAxisCount: 2,
                            crossAxisSpacing: 10,
                            mainAxisSpacing: 10,
                            childAspectRatio: 2.5,
                          ),
                        ),
                      ),
                      SizedBox(
                        width: 5,
                      ),
                      Container(
                        width: _width/3.8,
                        height: _hight/2,
                        decoration: BoxDecoration(
                          color: Colors.grey.shade300,
                          borderRadius: BorderRadius.circular(40),
                        ),
                        child: Column(
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
                      )
                    ],
                  ),
                  SizedBox(
                    height: 13,
                  ),
                  Container(
                    width: _width/1.5,
                    height: _hight/2,
                    decoration: BoxDecoration(
                        color: Colors.grey.shade300,
                        borderRadius: BorderRadius.circular(40)
                    ),
                    child: SingleChildScrollView(
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
                          Container(
                            width: _width/1.5,
                            height: _hight/1,
                            decoration: BoxDecoration(
                              color: Colors.grey.shade300,
                              borderRadius: BorderRadius.circular(40),
                            ),
                            child:  GridView.builder(
                             // scrollDirection : Axis.vertical,
                              itemCount: 7,
                              itemBuilder: (context, index) {
                                return Cards2('9' , 'ii' , Icons.hotel);
                              },
                              shrinkWrap: true,
                              physics: const NeverScrollableScrollPhysics(),
                              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                                crossAxisCount: 3,
                                crossAxisSpacing: 10,
                                mainAxisSpacing: 10,
                                childAspectRatio: 1.5,
                              ),
                            ),
                          ),
                        ]
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 20,
                  ),





                ],
              ),
            ),
          ),
        ],
      ),

    );
  }

  Widget Cards(numbers , text , icon) => Container(
    margin: EdgeInsets.only(
      top: 20,
      left: 20,
      right: 20
    ),
    height: 350,
    decoration: BoxDecoration(
      color: Colors.white,
      borderRadius: BorderRadius.circular(30),
    ),
    child: Row(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: [
        Padding(
          padding: const EdgeInsets.only(
              top: 20,
              left: 30
          ),
          child: Column(
            children: [
              Text(numbers , style: bigBlueTextStyle,),
              SizedBox(height: 10,),
              Text(text , style: smallGrayTextStyle,)
            ],
          ),
        ),
        Icon(icon , size: 40,),

      ],
    ),
  );
  Widget Cards2(numbers , text , icon) => Container(
    margin: EdgeInsets.only(
        top: 20,
        left: 20,
        right: 20
    ),
    height: 300,
    width: 400,
    decoration: BoxDecoration(
      color: Colors.white,
      borderRadius: BorderRadius.circular(30),
    ),
    child: Row(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: [
        Padding(
          padding: const EdgeInsets.only(
              top: 20,
              left: 30
          ),
          child: Column(
            children: [
              Text(numbers , style: bigBlueTextStyle,),
              SizedBox(height: 10,),
              Text(text , style: smallGrayTextStyle,)
            ],
          ),
        ),
        Icon(icon , size: 40,),

      ],
    ),
  );
}
