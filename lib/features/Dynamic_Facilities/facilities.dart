
import 'package:flutter/material.dart';
import 'package:ssr_project/component/style/size_colors.dart';

import '../../component/widgets/widgets.dart';

class facilities extends StatefulWidget {
  const facilities({Key? key}) : super(key: key);


  @override
  State<facilities> createState() => _facilitiesState();
}

class _facilitiesState extends State<facilities> {

  String selectedButton = 'Facilities';
  bool isSelected = false;

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
           SizedBox(
            width: _width/15,
          ),
          SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: const EdgeInsets.only(top: 15),
                  child: appBarName('UserName'),
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
                        borderRadius: const BorderRadius.only(
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
                        child: const Text('Facilities' , style: TextStyle(fontSize: 14,color: Colors.black , fontWeight: FontWeight.bold),),
                      ),
                    ),
                    Container(
                      height : _hight/9,
                      width: _width/3,
                      decoration: BoxDecoration(
                        color: selectedButton == 'Dynamics' ? Colors.blue.shade100 : Colors.blue.shade50,
                        borderRadius: const BorderRadius.only(
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
                      bottomRight: Radius.circular(40),
                      bottomLeft: Radius.circular(40),
                    )
                ),

                  ),
                const SizedBox(
                  height: 9,
                ),
                Center(
                  child: Row(
                    children: [
                      facilities(Icons.local_hospital_outlined ,_hight ,_width ,0 ,'hospital'),
                      facilities(Icons.train_outlined,_hight ,_width ,1,'train' ),
                      facilities(Icons.hotel,_hight ,_width ,2 , 'hotel'),
                      facilities(Icons.local_police,_hight ,_width , 3,'police' ),
                      facilities(Icons.book,_hight ,_width , 4 ,'book'),
                      facilities(Icons.business ,_hight ,_width  ,5 , 'business'),
                      facilities(Icons.airplanemode_on,_hight ,_width ,6 , 'airplanemode'),
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
  IconData? selectedIcon;
  Widget facilities (icon ,_height ,_width ,index , name )=> Padding(
    padding: const EdgeInsets.all(7.0),
    child: Container(
      height: _height/5,
      width: _width/12,
      decoration: BoxDecoration(
        shape: BoxShape.rectangle,
       // color: selectedIcon == icon ? Colors.blue.withOpacity(0.3) : Colors.transparent,
        border: Border.all(
          width: 3,
          color: selectedIcon == icon ? Colors.blue : darkBlueColor,
        ),
        borderRadius: BorderRadius.circular(10)

      ),
      child: GestureDetector(
        child: Icon(icon , size: 45, color: selectedIcon == icon ? Colors.blue : darkBlueColor,),
        onTap: () {
          setState(() {
            selectedIcon = icon;
          });
          print( name );
        },
      ),
    ),
  );
}


