
import 'package:flutter/material.dart';
import 'package:ssr_project/component/style/size_colors.dart';
import 'package:awesome_dialog/awesome_dialog.dart';

import '../../component/widgets/widgets.dart';


class editBusinessForm extends StatefulWidget {

  String? name ;
  var budget;
  String? businessType;
  String? preferences1;
  String? preferences2;
  String? status;

  editBusinessForm(nameArg , budgetArg , businessTypeArg , preferencesArgOne , preferencesArgTow  ,statusArg, {Key? key}) : super(key: key){
   name         = nameArg;
   budget       = budgetArg;
   businessType = businessTypeArg;
   preferences1  = preferencesArgOne;
   preferences2  = preferencesArgTow;
   status       = statusArg;
  }

  @override
  State<editBusinessForm> createState() => _editBusinessFormState();
}

class _editBusinessFormState extends State<editBusinessForm> {

  TextEditingController nameEditingController = TextEditingController();

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
                  Text('Edit Business Preference', style: bigBlueTextStyle),
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
                              controller: nameEditingController,
                              decoration: InputDecoration(
                                hintText: widget.name,
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
                          value: widget.budget.toDouble(),
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
                            child: StatefulBuilder(
                              builder: (BuildContext context, void Function(void Function()) setState) {
                                setState(() {
                                  widget.budget = maxValueRange;
                                });
                               return Text(
                                    "Range : " +
                                        widget.budget.toString()
                                        + " SR",
                                    style: const TextStyle(fontSize: 12,
                                        color: Colors.black,
                                        fontWeight: FontWeight.bold)
                                );
                              }
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(height: 50),
                      bidTitle('Business Type', smallBlueTextStyle),
                      const SizedBox(height: 5),
                      DropdownButtonFormField<String>(
                        value: widget.businessType!.contains('Cafe') ?  widget.businessType :
                        widget.businessType!.contains('Restaurant') ?  widget.businessType : dropDownValue,
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
                              itemBuilder: (context, index) =>
                              widget.preferences1!.contains(options[index]["title"]) ?
                              upCheck(options[index]["title"] , true) :
                              upCheck(options[index]["title"] , options[index]["isChecked"])
                               // return upCheck(options[index]["title"] , options[index]["isChecked"]);
                              ,
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
                          itemBuilder: (context, index) =>
                            widget.preferences2!.contains(options2[index]["title"]) ?
                             downCheck(options2[index]["title"] , true) :
                             downCheck(options2[index]["title"] , options2[index]["isChecked"])
                           // return downCheck(options2[index]["title"] , options2[index]["isChecked"]);
                          ,
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
                        value: widget.status!.contains('New Branch') ?  widget.status :
                        widget.status!.contains('New Business') ?  widget.status : statusValue,
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
                          'Back',
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
                          'Save',
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
                            btnOkOnPress: () {},
                          ).show();
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
