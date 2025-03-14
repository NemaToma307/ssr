
import 'package:flutter/material.dart';
import 'package:ssr_project/component/style/size_colors.dart';
import 'package:awesome_dialog/awesome_dialog.dart';

import '../../component/widgets/widgets.dart';


class businessForm extends StatefulWidget {
  const businessForm({Key? key}) : super(key: key);


  @override
  State<businessForm> createState() => _businessFormState();
}

class _businessFormState extends State<businessForm> {

  String? dropDownValue;
  String? statusValue;
  var maxValueRange = 0;

  List<String> items = [
    'Restaurant',
    'Cafe',
  ];

  List<String> itemsStatus = [
    'New Business',
    'New Branch',
  ];

  bool isChecked = false;
  final List<Map<String, dynamic>> options = [
    {"title": "Parking", "isChecked": false},
    {"title": "Public Transportation", "isChecked": false},
    {"title": "Outdoor Space", "isChecked": false},
  ];

  final List<Map<String, dynamic>> options2 = [
    {"title": "Mega Projects", "isChecked": false},
    {"title": "Universities", "isChecked": false},
    {"title": "Metro station", "isChecked": false},
    {"title": "Airports", "isChecked": false},
    {"title": "Hospital", "isChecked": false},
    {"title": "Schools", "isChecked": false},
    {"title": "Hotels", "isChecked": false},
  ];




  @override
  Widget build(BuildContext context) {
    var _width = MediaQuery.of(context).size.width/2.5;
    var _hight = MediaQuery.of(context).size.height/2.5;
    return Dialog(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(20.0),
      ),
      child: Container(
        width: 900,
        height: 500,
        padding: const EdgeInsets.all(20.0),
        child: SingleChildScrollView(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Row(
                children: [
                  Text('Let us Help you find the perfect location', style: bigBlueTextStyle),
                ],
              ),
              const SizedBox(height: 30.0),
              Padding(
                padding:  const EdgeInsets.only(
                    left: 40
                ),
                child: Column(
                    children: [
                      bidTitle('Business Information', smallBlueTextStyle),
                      const Divider(),
                      const SizedBox(height: 25.0),
                      smallTitle('Business name' ,smallGrayTextStyle),
                      const SizedBox(height: 5),
                      Row(
                        children: [
                          SizedBox(
                            width: 300,
                            child: TextField(
                              decoration: InputDecoration(
                                hintText: "Name",
                                border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(10),
                                  borderSide: const BorderSide(color: Colors.grey),
                                ),
                                contentPadding: const EdgeInsets.symmetric(horizontal: 12, vertical: 15),
                              ),
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(height: 50),
                      bidTitle('Budget', smallBlueTextStyle),
                      const Divider(),
                      const SizedBox(height: 25.0),
                      smallTitle('Rental Budget for month' ,smallGrayTextStyle),
                      SizedBox(
                        width: 800,
                        child: Slider(
                          value: maxValueRange.toDouble(),
                          onChanged: (value) {
                            setState(() {
                              maxValueRange = value.toInt();
                              value= maxValueRange.toDouble();
                              print("Slider value: $maxValueRange");
                              // html.window.location.reload();
                            });
                          },
                          min: 0,
                          max: 100000,
                        ),
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          Padding(
                            padding: const EdgeInsets.only(
                                right: 30
                            ),
                            child: Text(
                                "Range : " + maxValueRange.toString() +" SR",
                                style: const TextStyle(fontSize: 12,color: Colors.black , fontWeight: FontWeight.bold)
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(height: 50),
                      bidTitle('Business Type', smallBlueTextStyle),
                      const SizedBox(height: 5),
                      DropdownButtonFormField<String>(
                        value: dropDownValue,
                        decoration: InputDecoration(
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10),
                            borderSide: const BorderSide(color: Colors.grey),
                          ),
                          contentPadding: const EdgeInsets.symmetric(horizontal: 12, vertical: 15),
                        ),
                        hint: const Text("Select Business Type"),
                        items: items.map<DropdownMenuItem<String>>((String type) {
                          return DropdownMenuItem<String>(
                            value: type,
                            child: Text(type),
                          );
                        }).toList(),
                        onChanged: (String? value) {
                          setState(() {
                            dropDownValue = value;
                          });
                        },
                      ),
                      const SizedBox(height: 50),
                      bidTitle('Accessibility Preference', smallBlueTextStyle),
                      const Divider(),
                      const SizedBox(height: 25.0),
                      Row(
                        children: [
                          SizedBox(
                            width: 300,
                            height: 200,
                            child: ListView.builder(
                              itemCount: options.length,
                              itemBuilder: (context, index) {
                                return upCheck(options[index]["title"] , options[index]["isChecked"]);
                              },
                            ),
                          ),
                        ],
                      ),
                      bidTitle('Accessibility Preference', smallBlueTextStyle),
                      const Divider(),
                      SizedBox(
                        width: 800,
                        height: 160,
                        child:
                        GridView.builder(
                          //scrollDirection : Axis.horizontal,
                          itemCount: options2.length,
                          itemBuilder: (context, index) {
                            return downCheck(options2[index]["title"] , options2[index]["isChecked"]);
                          },
                          shrinkWrap: true,
                          physics: const NeverScrollableScrollPhysics(),
                          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                            crossAxisCount: 4,
                            crossAxisSpacing: 10,
                            mainAxisSpacing: 10,
                            childAspectRatio: 3.5,
                          ),
                        ),
                      ),
                      bidTitle('Business Status', smallBlueTextStyle),
                      const Divider(),
                      const SizedBox(height: 5),
                      DropdownButtonFormField<String>(
                        value: statusValue,
                        decoration: InputDecoration(
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10),
                            borderSide: const BorderSide(color: Colors.grey),
                          ),
                          contentPadding: const EdgeInsets.symmetric(horizontal: 12, vertical: 15),
                        ),
                        hint: const Text("Select Business Status"),
                        items: itemsStatus.map<DropdownMenuItem<String>>((String type) {
                          return DropdownMenuItem<String>(
                            value: type,
                            child: Text(type),
                          );
                        }).toList(),
                        onChanged: (String? value) {
                          setState(() {
                            statusValue = value;
                          });
                        },
                      ),
                    ]
                ),),
              const SizedBox(height: 30.0),
              Center(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Container(
                      width: 90,
                      height: 50,
                      decoration: BoxDecoration(
                        color: Colors.red,
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: TextButton(
                        child: const Text(
                          'Cancel',
                          style: TextStyle(fontSize: 15 , color: Colors.white),
                        ),
                        onPressed: () {
                          Navigator.of(context).pop();
                        },
                      ),
                    ),
                    const SizedBox(
                      width: 30,
                    ),
                    Container(
                      width: 90,
                      height: 50,
                      decoration: BoxDecoration(
                        color: Colors.blue.shade900,
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: TextButton(
                        child: const Text(
                          'Next',
                          style: TextStyle(fontSize: 15 , color: Colors.white),
                        ),
                        onPressed: () {
                          showDialog(
                              context: context,
                              builder: (BuildContext context) {
                                return Dialog(
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(20.0),
                                  ),
                                  child: Container(
                                    width: 900,
                                    height: 600,
                                    padding: const EdgeInsets.all(20.0),
                                    child: SingleChildScrollView(
                                      child: Column(
                                        mainAxisSize: MainAxisSize.min,
                                        children: [
                                          Row(
                                            children: [
                                              Text('Select Your Location', style: bigBlueTextStyle),
                                            ],
                                          ),
                                          const SizedBox(height: 15.0),
                                          Padding(
                                            padding:  const EdgeInsets.only(
                                                left: 40
                                            ),
                                            child: Column(
                                                crossAxisAlignment: CrossAxisAlignment.start,
                                                children: [
                                                  smallTitle('Riyadh', const TextStyle(fontSize: 14,color: Colors.black , fontWeight: FontWeight.bold)),
                                                  const SizedBox(height: 10.0),
                                                  Container(
                                                    width: _width*1.2,
                                                    height: _hight*1.6,
                                                    decoration: BoxDecoration(
                                                        color: Colors.pink,
                                                        borderRadius: BorderRadius.circular(40)
                                                    ),
                                                  )
                                                ]
                                            ),
                                          ),
                                          const SizedBox(height: 30.0),
                                          Center(
                                            child: Container(
                                              width: 90,
                                              height: 50,
                                              decoration: BoxDecoration(
                                                color: Colors.blue.shade900,
                                                borderRadius: BorderRadius.circular(10),
                                              ),
                                              child: TextButton(
                                                child: const Text(
                                                  'Submit',
                                                  style: TextStyle(fontSize: 15 , color: Colors.white),
                                                ),
                                                onPressed: () {
                                                  AwesomeDialog(
                                                    width: 500,
                                                    context: context,
                                                    dialogType: DialogType.success,
                                                    animType: AnimType.rightSlide,
                                                    //title: '',
                                                    desc: 'The operation was successful',
                                                    //btnCancelOnPress: () {},
                                                    btnOkOnPress: () {
                                                      Navigator.pop(context);
                                                      Navigator.pop(context);
                                                    },
                                                  ).show();
                                                },
                                              ),
                                            ),
                                          )


                                        ],
                                      ),
                                    ),
                                  ),
                                );}
                          );
                          // AwesomeDialog(
                          //   width: 500,
                          //   context: context,
                          //   dialogType: DialogType.success,
                          //   animType: AnimType.rightSlide,
                          //   //title: '',
                          //   desc: 'The operation was successful',
                          //   //btnCancelOnPress: () {},
                          //   btnOkOnPress: () {},
                          // ).show();
                        },
                      ),
                    ),
                  ],
                ),
              )


            ],
          ),
        ),
      ),
    );
  }



  Widget upCheck(text , index2 ) => Container(
    width: 300,
    padding: const EdgeInsets.all(10),
    child: Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
         Text(
          text,
          style: TextStyle(
            fontSize: 14,
            fontWeight: FontWeight.bold,
            color:Colors.grey.shade800,
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(left: 40),
          child: Checkbox(
            value: index2 ,
            activeColor: Colors.blue,
            onChanged: (bool? value) {
              setState(() {
                //index2 = value!;
                index2 = !index2;
                print( index2);
              });
            },
          ),
          // Checkbox(
          //   value: isChecked,
          //   activeColor: isChecked == true ? Colors.green : Colors.white,
          //   checkColor: Colors.white,
          //   onChanged: (bool? value) {
          //     setState(() {
          //       isChecked = !isChecked;
          //       //isChecked = value!;
          //       print('*********');
          //       print(isChecked);
          //       print('*****-----------****');
          //       //print(value);
          //     });
          //   },
          // ),
        ),

      ],
    ),
  );
  Widget downCheck(text , index2 ) => SizedBox(
    width: 300,
    child: Padding(
      padding: const EdgeInsets.only(
        left: 15
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            text,
            style: TextStyle(
              fontSize: 14,
              fontWeight: FontWeight.bold,
              color:Colors.grey.shade800,
            ),
          ),
          Checkbox(
            value: index2 ,
            activeColor: Colors.blue,
            onChanged: (bool? value) {
              setState(() {
                //index2 = value!;
                index2 = !index2;
                print( index2);
              });
            },
          ),

        ],
      ),
    ),
  );
}
