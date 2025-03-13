
import 'package:flutter/material.dart';
import 'package:ssr_project/component/style/size_colors.dart';

import '../../component/widgets/widgets.dart';

class facilities extends StatefulWidget {

  @override
  State<facilities> createState() => _facilitiesState();
}

class _facilitiesState extends State<facilities> {

  String selectedButton = 'Facilities';

  @override
  void initState() {
    super.initState();


  }

  @override
  Widget build(BuildContext context) {
    var _width = MediaQuery.of(context).size.width;
    var _hight = MediaQuery.of(context).size.height;

    return Scaffold(
      body: Row(
        children: [
          // Padding(
          //   padding: const EdgeInsets.only(left: 20),
          //   child: Column(
          //     // crossAxisAlignment: CrossAxisAlignment.center,
          //     mainAxisAlignment: MainAxisAlignment.center,
          //     children: [],
          //   ),
          // ),
          SizedBox(
            width: 80,
          ),
          SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: const EdgeInsets.only(top: 15),
                  child: AppBarName('UserName'),
                ),
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
                        color:  selectedButton == 'Facilities' ? Colors.blue.shade100 : Colors.blue.shade50,
                        borderRadius: BorderRadius.only(
                            topLeft: Radius.circular(20),
                            topRight: Radius.circular(20)
                        ),
                      ),
                      child: TextButton(
                        onPressed: () {
                          print('*************************');
                          setState(() {
                            selectedButton = 'Facilities';
                          });

                        },
                        child: Text('Facilities' , style: TextStyle(fontSize: 14,color: Colors.black , fontWeight: FontWeight.bold),),
                      ),
                    ),
                    Container(
                      height : _hight/9,
                      width: _width/3,
                      decoration: BoxDecoration(
                        color: selectedButton == 'Dynamics' ? Colors.blue.shade100 : Colors.blue.shade50,
                        borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(20),
                          topRight: Radius.circular(20)
                        ),
                      ),
                      child: TextButton(
                        onPressed: () {
                          setState(() {
                            selectedButton = 'Dynamics';
                          });
                        },
                        child: Text('Dynamics' , style: TextStyle(fontSize: 14,color: Colors.black , fontWeight: FontWeight.bold),),
                      ),
                    )
                  ],
                ),
                Container(
                width: _width/1.5,
                height: _hight/1.5,
                decoration: BoxDecoration(
                    color: Colors.pink,
                    borderRadius: BorderRadius.only(
                      bottomRight: Radius.circular(40),
                      bottomLeft: Radius.circular(40),
                    )
                ),

                  ),
                SizedBox(
                  height: 9,
                ),
                Center(
                  child: Row(
                    children: [
                      facilities(Icons.local_hospital_outlined ),
                      facilities(Icons.train_outlined),
                      facilities(Icons.hotel),
                      facilities(Icons.local_police),
                      facilities(Icons.book),
                      facilities(Icons.business ),
                      facilities(Icons.airplanemode_on),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget facilities (icon)=> Padding(
    padding: const EdgeInsets.all(7.0),
    child: Container(
      height: 130,
      width: 130,
      decoration: BoxDecoration(
        shape: BoxShape.rectangle,
        border: Border.all(
          width: 2,
          color: Colors.black,
        ),
        borderRadius: BorderRadius.circular(10)

      ),
      child: TextButton(
        child: Icon(icon , size: 45,),
        onPressed: () {  },
      ),
    ),
  );
}


