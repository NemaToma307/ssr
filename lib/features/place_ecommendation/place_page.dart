

import 'dart:ui';
import 'package:awesome_dialog/awesome_dialog.dart';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:ssr_project/component/style/size_colors.dart';

import '../../component/widgets/widgets.dart';
import 'business_form.dart';

class placePage extends StatefulWidget {

  @override
  State<placePage> createState() => _placePageState();
}

class _placePageState extends State<placePage> {

  bool showGrid = false;
  bool isSelectedButton = true ;
  String selectedButton = 'place';

  bool flag = false;

  var items = [
    'Sign',
    'Half Million',
  ];

  var dropDownValue = 'Sign';



  @override
  Widget build(BuildContext context) {
    var _width = MediaQuery.of(context).size.width/2;
    var _hight = MediaQuery.of(context).size.height/1.5;
    return Row(
      children: [
        Padding(
          padding: const EdgeInsets.only(left: 20),
          child: Column(
            // crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              CircleAvatar(
                backgroundColor: selectedButton == 'place' ?  Colors.blue : Colors.black,
                radius: 33,
                child: CircleAvatar(
                  backgroundColor: Colors.grey.shade300,
                  radius: 31,
                  child: SizedBox(
                    height: 50,
                    width: 50,
                    child: IconButton(
                        constraints: BoxConstraints(),
                        padding: EdgeInsets.zero,
                        onPressed: (){
                          setState(() {
                            showGrid = false;
                            //isSelectedButton = !isSelectedButton;
                            selectedButton = 'place';
                            flag = !flag;
                          });
                        }, icon: Icon(Icons.place_outlined , color:  selectedButton == 'place' ?  Colors.blue : Colors.black, size: 37,)),
                  ),
                ),
              ) ,
              SizedBox(
                height: 20,
              ),
              CircleAvatar(
                backgroundColor:  selectedButton == 'flag' ?  Colors.blue : Colors.black,
                radius: 33,
                child: CircleAvatar(
                  backgroundColor: Colors.grey.shade300,
                  radius: 31,
                  child: SizedBox(
                    height: 50,
                    width: 50,
                    child: IconButton(
                        onPressed: () {
                          setState(() {
                            showGrid = true;
                            //isSelectedButton = !isSelectedButton;
                            selectedButton = 'flag';
                            flag = !flag;
                          });
                        },
                        icon: Icon(Icons.flag_outlined , color:  selectedButton == 'flag' ?  Colors.blue : Colors.black,size: 37,)
                    ),
                  ),
                ),
              )
            ],
          ),
        ),
        SizedBox(
          width: 20,
        ),
        Expanded(
          child: Column(
            // mainAxisAlignment: MainAxisAlignment.start,
            // crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.only(top: 15),
                child: AppBarName('UserName')
              ),
              SizedBox(
                height: 30,
              ),
              if(flag)
              Padding(
                padding: const EdgeInsets.symmetric(
                    horizontal: 30
                ),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    DropdownButton<dynamic>(
                      hint: Text('Select an Item', style:smallBlackTextStyle),
                      value: dropDownValue,
                      onChanged: (newValue) {
                        setState(() {
                          dropDownValue = newValue!;
                        });
                      },
                      items: items.map<DropdownMenuItem>((value) {
                        return DropdownMenuItem(
                          value: value,
                          child: Text(value , style:  smallBlackTextStyle),
                        );
                      }).toList(),
                    ),
                  ],
                ),
              ),
              showGrid == false ?
                Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Stack(
                      children: [
                        Container(
                          height : _hight/9,
                          width: _width*1.2,
                          decoration: BoxDecoration(
                            color: Colors.blue.shade50,
                            borderRadius: BorderRadius.only(
                                topLeft: Radius.circular(20),
                                topRight: Radius.circular(20)
                            ),
                          ),
                        ),
                        Container(
                          height : _hight/9,
                          width: _width/5,
                          decoration: BoxDecoration(
                            color: Colors.blue.shade100,
                            borderRadius: BorderRadius.only(
                                topLeft: Radius.circular(20),
                                topRight: Radius.circular(20)
                            ),
                          ),
                          child: TextButton(
                            onPressed: () {

                              showDialog(
                                  context: context,
                                  builder: (BuildContext context) {
                                    return businessForm();
                                  });
                              // Navigator.push(
                              //   context,
                              //   MaterialPageRoute( builder: (context) => showDialog(
                              //       context: context,
                              //       builder: (BuildContext context) {}),
                              //   ));

                             // showDialogWidget(context);
                            },
                            child: Text('+' , style: TextStyle(fontSize: 24,color: Colors.black , fontWeight: FontWeight.bold),),
                          ),
                        ),
                      ],
                    ),
                    Container(
                      width: _width*1.2,
                      height: _hight,
                      decoration: BoxDecoration(
                          color: Colors.pink,
                          borderRadius: BorderRadius.only(
                            bottomLeft: Radius.circular(40),
                            bottomRight: Radius.circular(40),
                          )
                      ),
                    )
                  ],
                ):
              SizedBox(
                height: _hight,
                width: _width*1.3,
                child: GridView.builder(
                  padding: EdgeInsets.all(16),
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                    crossAxisSpacing: 100,
                    mainAxisSpacing: 80,
                   //childAspectRatio : 3/5
                  ),
                  itemCount: 10,
                  itemBuilder: (context, index) {
                    return GestureDetector(
                      onTap: (){},
                      child: Stack(
                          children:[
                            Container(
                              height: _hight,
                              width: _width,
                              decoration: BoxDecoration(
                                color: Colors.grey.shade300,
                                borderRadius: BorderRadius.circular(10),

                              ),
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.end,
                                crossAxisAlignment: CrossAxisAlignment.end,
                                children: const [
                                  Center(child: Padding(
                                    padding: EdgeInsets.only(
                                        bottom: 5
                                    ),
                                    child: Text("Item", style: TextStyle(fontSize: 14,color: Colors.black , fontWeight: FontWeight.bold)),
                                  ))],
                              ),

                            ),
                            Center(
                              child: Container(
                                height: _hight/1.5,
                                width: _width/2.1,
                                decoration: BoxDecoration(
                                  color: Colors.white,
                                  borderRadius: BorderRadius.circular(20),
                                  border: Border.all(
                                    color: Colors.black,
                                    width: 1,
                                    style: BorderStyle.solid,
                                  ),

                                ),
                                child: Center(
                                  child: Text("map here44 $index", style: TextStyle(color: Colors.black)),
                                ),
                              ),
                            ),
                          ]
                      ),
                    );
                  },
                ),
              )



            ],
          ),
        ),
      ],
    );
  }
  //
  // Future<void> showDialogWidget(BuildContext context) => showDialog(
  //     context: context,
  //     builder: (BuildContext context) {
  //       return Dialog(
  //         shape: RoundedRectangleBorder(
  //           borderRadius: BorderRadius.circular(20.0),
  //         ),
  //         child: Container(
  //           width: 900,
  //           height: 500,
  //           padding: EdgeInsets.all(20.0),
  //           child: SingleChildScrollView(
  //             child: Column(
  //               mainAxisSize: MainAxisSize.min,
  //               children: [
  //                 Row(
  //                   children: [
  //                     Text('Let us Help you find the perfect location',
  //                         style: bigBlueTextStyle),
  //                   ],
  //                 ),
  //                 SizedBox(height: 30.0),
  //                 Padding(
  //                   padding: const EdgeInsets.only(left: 40),
  //                   child: Column(children: [
  //                     bidTitle('Business Information', smallBlueTextStyle),
  //                     Divider(),
  //                     SizedBox(height: 25.0),
  //                     smallTitle('Business name', smallGrayTextStyle),
  //                     SizedBox(height: 5),
  //                     Row(
  //                       children: [
  //                         Container(
  //                           width: 300,
  //                           child: TextField(
  //                             decoration: InputDecoration(
  //                               hintText: "Name",
  //                               border: OutlineInputBorder(
  //                                 borderRadius: BorderRadius.circular(10),
  //                                 borderSide: BorderSide(color: Colors.grey),
  //                               ),
  //                               contentPadding: EdgeInsets.symmetric(
  //                                   horizontal: 12, vertical: 15),
  //                             ),
  //                           ),
  //                         ),
  //                       ],
  //                     ),
  //                     SizedBox(height: 50),
  //                     bidTitle('Budget', smallBlueTextStyle),
  //                     Divider(),
  //                     SizedBox(height: 25.0),
  //                     smallTitle('Rental Budget for month', smallGrayTextStyle),
  //                     SizedBox(
  //                       width: 800,
  //                       child: Slider(
  //                         value: maxValueRange.toDouble(),
  //                         onChanged: (value) {
  //                           setState(() {
  //                             maxValueRange = value.toInt();
  //
  //                             value = maxValueRange.toDouble();
  //
  //                             print("Slider value: $maxValueRange");
  //
  //                             // html.window.location.reload();
  //                           });
  //                         },
  //                         min: 0,
  //                         max: 100000,
  //                       ),
  //                     ),
  //                     Row(
  //                       mainAxisAlignment: MainAxisAlignment.end,
  //                       children: [
  //                         Padding(
  //                           padding: const EdgeInsets.only(right: 30),
  //                           child: Text(
  //                               "Range : " + maxValueRange.toString() + " SR",
  //                               style: const TextStyle(
  //                                   fontSize: 12,
  //                                   color: Colors.black,
  //                                   fontWeight: FontWeight.bold)),
  //                         ),
  //                       ],
  //                     ),
  //                     SizedBox(height: 50),
  //                     bidTitle('Business Type', smallBlueTextStyle),
  //                     SizedBox(height: 5),
  //                     DropdownButtonFormField<String>(
  //                       value: dropDownValue,
  //                       decoration: InputDecoration(
  //                         border: OutlineInputBorder(
  //                           borderRadius: BorderRadius.circular(10),
  //                           borderSide: BorderSide(color: Colors.grey),
  //                         ),
  //                         contentPadding:
  //                         EdgeInsets.symmetric(horizontal: 12, vertical: 15),
  //                       ),
  //                       hint: Text("Select Business Type"),
  //                       items: items.map<DropdownMenuItem<String>>((String type) {
  //                         return DropdownMenuItem<String>(
  //                           value: type,
  //                           child: Text(type),
  //                         );
  //                       }).toList(),
  //                       onChanged: (String? value) {
  //                         setState(() {
  //                           dropDownValue = value!;
  //                         });
  //                       },
  //                     ),
  //                     SizedBox(height: 50),
  //                     bidTitle('Accessibility Preference', smallBlueTextStyle),
  //                     Divider(),
  //                     SizedBox(height: 25.0),
  //                     Row(
  //                       children: [
  //                         SizedBox(
  //                           width: 300,
  //                           height: 200,
  //                           child: ListView.builder(
  //                             itemCount: options.length,
  //                             itemBuilder: (context, index) {
  //                               return upCheck(options[index]["title"],
  //                                   options[index]["isChecked"]);
  //                             },
  //                           ),
  //                         ),
  //                       ],
  //                     ),
  //                     bidTitle('Accessibility Preference', smallBlueTextStyle),
  //                     Divider(),
  //                     SizedBox(
  //                       width: 800,
  //                       height: 160,
  //                       child: GridView.builder(
  //                         //scrollDirection : Axis.horizontal,
  //
  //                         itemCount: options2.length,
  //
  //                         itemBuilder: (context, index) {
  //                           return downCheck(options2[index]["title"],
  //                               options2[index]["isChecked"]);
  //                         },
  //
  //                         shrinkWrap: true,
  //
  //                         physics: const NeverScrollableScrollPhysics(),
  //
  //                         gridDelegate:
  //                         const SliverGridDelegateWithFixedCrossAxisCount(
  //                           crossAxisCount: 4,
  //                           crossAxisSpacing: 10,
  //                           mainAxisSpacing: 10,
  //                           childAspectRatio: 3.5,
  //                         ),
  //                       ),
  //                     ),
  //                     bidTitle('Business Status', smallBlueTextStyle),
  //                     const Divider(),
  //                     const SizedBox(height: 5),
  //                     DropdownButtonFormField<String>(
  //                       value: statusValue,
  //                       decoration: InputDecoration(
  //                         border: OutlineInputBorder(
  //                           borderRadius: BorderRadius.circular(10),
  //                           borderSide: const BorderSide(color: Colors.grey),
  //                         ),
  //                         contentPadding: const EdgeInsets.symmetric(
  //                             horizontal: 12, vertical: 15),
  //                       ),
  //                       hint: const Text("Select Business Status"),
  //                       items: itemsStatus
  //                           .map<DropdownMenuItem<String>>((String type) {
  //                         return DropdownMenuItem<String>(
  //                           value: type,
  //                           child: Text(type),
  //                         );
  //                       }).toList(),
  //                       onChanged: (String? value) {
  //                         setState(() {
  //                           statusValue = value;
  //                         });
  //                       },
  //                     ),
  //                   ]),
  //                 ),
  //                 SizedBox(height: 30.0),
  //                 Center(
  //                   child: Row(
  //                     mainAxisAlignment: MainAxisAlignment.center,
  //                     children: [
  //                       Container(
  //                         width: 90,
  //                         height: 50,
  //                         decoration: BoxDecoration(
  //                           color: Colors.red,
  //                           borderRadius: BorderRadius.circular(10),
  //                         ),
  //                         child: TextButton(
  //                           child: Text(
  //                             'Cancel',
  //                             style: TextStyle(fontSize: 15, color: Colors.white),
  //                           ),
  //                           onPressed: () {
  //                             Navigator.of(context).pop();
  //                           },
  //                         ),
  //                       ),
  //                       SizedBox(
  //                         width: 30,
  //                       ),
  //                       Container(
  //                         width: 90,
  //                         height: 50,
  //                         decoration: BoxDecoration(
  //                           color: Colors.blue.shade900,
  //                           borderRadius: BorderRadius.circular(10),
  //                         ),
  //                         child: TextButton(
  //                           child: Text(
  //                             'Next',
  //                             style: TextStyle(fontSize: 15, color: Colors.white),
  //                           ),
  //                           onPressed: () {
  //                             AwesomeDialog(
  //                               width: 500,
  //
  //                               context: context,
  //
  //                               dialogType: DialogType.success,
  //
  //                               animType: AnimType.rightSlide,
  //
  //                               //title: '',
  //
  //                               desc: 'The operation was successful',
  //
  //                               //btnCancelOnPress: () {},
  //
  //                               btnOkOnPress: () {},
  //                             ).show();
  //                           },
  //                         ),
  //                       ),
  //                     ],
  //                   ),
  //                 )
  //               ],
  //             ),
  //           ),
  //         ),
  //       );
  //     });

}
