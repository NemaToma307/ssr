import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:ssr_project/component/style/size_colors.dart';
import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:ssr_project/features/my_business/reviews.dart';
import '../../component/widgets/widgets.dart';
import '../place_ecommendation/business_form.dart';
import '../place_ecommendation/edit_business_form.dart';


class businessPage extends StatefulWidget {

  @override
  State<businessPage> createState() => _businessPageState();
}

class _businessPageState extends State<businessPage> {



  TextEditingController brunchController = TextEditingController();
  TextEditingController brunchNameController = TextEditingController();
  TextEditingController brunchNameControllerInReview = TextEditingController();

  var items = [
    'home',
    'Sign',
    'Half Million',
    'Monthly'
  ];

  var dropDownValue = 'home';
  bool _isButtonVisible = true;


  @override
  Widget build(BuildContext context) {
    var _width = MediaQuery.of(context).size.width/2;
    var _hight = MediaQuery.of(context).size.height/1.5;
    return Scaffold(
      body: Row(
        children: [
          Padding(
            padding: const EdgeInsets.only(left: 20),
            child: Column(
              // crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                if (_isButtonVisible)
                  CircleAvatar(
                    backgroundColor: Colors.black,
                    radius: 21,
                    child: CircleAvatar(
                      backgroundColor: Colors.grey.shade300,
                      child: IconButton(
                        onPressed: () {
                          // Navigator.push(
                          //   context,
                          //   MaterialPageRoute(builder: (context) => businessForm()),
                          // );
                        },
                        icon: const Icon(Icons.add, color: Colors.black),
                      ),
                    ),
                  ),
                const SizedBox(
                  height: 20,
                ),
                // CircleAvatar(
                //   backgroundColor: Colors.black,
                //   radius: 21,
                //   child: CircleAvatar(
                //     backgroundColor: Colors.grey.shade300,
                //     child: IconButton(
                //         onPressed: () {
                //           setState(() {
                //
                //           });
                //         },
                //         icon: const Icon(Icons.edit , color: Colors.black,)
                //     ),
                //   ),
                // )
              ],
            ),
          ),
          const SizedBox(
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
                const SizedBox(
                  height: 30,
                ),
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
                            _isButtonVisible = dropDownValue != 'Monthly';
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
                ) ,
                dropDownValue == 'home' ?
                Row(
                  children: [
                    Container(
                      height: 290,
                      width: 250,
                      decoration: BoxDecoration(
                        color: Colors.grey.shade300,
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: TextButton(
                        onPressed: () {
                          showDialog(
                              context: context,
                              builder: (BuildContext context) {
                                return Dialog(
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(20.0),
                                  ),
                                  child: Container(
                                    width: 500,
                                    height: 200,
                                    padding: const EdgeInsets.all(20.0),
                                    child: Column(
                                     // mainAxisSize: MainAxisSize.min,
                                      mainAxisAlignment: MainAxisAlignment.start,
                                      crossAxisAlignment: CrossAxisAlignment.start,
                                      children: [
                                        Text('Select Brunch' ,style: smallGrayTextStyle),
                                        SizedBox(height: 5),
                                        Row(
                                          children: [
                                            Container(
                                              width: 400,
                                              child: TextField(
                                                controller: brunchController ,
                                                decoration: InputDecoration(
                                                  //hintText: "Name",
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
                                        SizedBox(
                                          height: 40,
                                        ),
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
                                                  child: Text(
                                                    'Cancel',
                                                    style: TextStyle(fontSize: 15 , color: Colors.white),
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
                                                  borderRadius: BorderRadius.circular(10),
                                                ),
                                                child: TextButton(
                                                  child: Text(
                                                    'Add',
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
                                                                  padding: EdgeInsets.all(20.0),
                                                                  child: SingleChildScrollView(
                                                                    child: Column(
                                                                      mainAxisSize: MainAxisSize.min,
                                                                      children: [
                                                                        Row(
                                                                          children: [
                                                                            Text('Brunch Information', style: bigBlueTextStyle),
                                                                          ],
                                                                        ),
                                                                        SizedBox(height: 15.0),
                                                                        Padding(
                                                                          padding:  const EdgeInsets.only(
                                                                              left: 40
                                                                          ),
                                                                          child: Column(
                                                                            crossAxisAlignment: CrossAxisAlignment.start,
                                                                              children: [
                                                                                bidTitle('Brunch Name', smallBlueTextStyle),
                                                                                SizedBox(height: 15.0),
                                                                                Container(
                                                                                  width: 400,
                                                                                  child: TextField(
                                                                                    controller: brunchNameController,
                                                                                    decoration: InputDecoration(
                                                                                      hintText: "Name",
                                                                                      border: OutlineInputBorder(
                                                                                        borderRadius: BorderRadius.circular(10),
                                                                                        borderSide: BorderSide(color: Colors.grey),
                                                                                      ),
                                                                                      contentPadding: EdgeInsets.symmetric(horizontal: 12, vertical: 15),
                                                                                    ),
                                                                                  ),
                                                                                ),
                                                                                SizedBox(height: 10.0),
                                                                                Container(
                                                                                  width: _width/1,
                                                                                  height: _hight/1.5,
                                                                                  decoration: BoxDecoration(
                                                                                      color: Colors.pink,
                                                                                      borderRadius: BorderRadius.circular(40)
                                                                                  ),
                                                                                )
                                                                              ]
                                                                          ),),
                                                                        SizedBox(height: 30.0),
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
                                                                                  child: Text(
                                                                                    'Cancel',
                                                                                    style: TextStyle(fontSize: 15 , color: Colors.white),
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
                                                                                  borderRadius: BorderRadius.circular(10),
                                                                                ),
                                                                                child: TextButton(
                                                                                  child: Text(
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
                                                              );}
                                                        );
                                                      },
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
                                );}
                          );
                        },
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children:const [
                            Icon(Icons.local_cafe_outlined , size: 80,color: Colors.black,),
                            SizedBox(height: 70,),
                            Text('Half Million' , style: TextStyle(fontSize: 20,color: Colors.black,fontWeight: FontWeight.bold)),
                          ],
                        ),
                      ),
                    ),
                    SizedBox(
                      width: 20,
                    ),
                    Container(
                      height: 290,
                      width: 250,
                      decoration: BoxDecoration(
                        color: Colors.grey.shade300,
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: TextButton(
                        onPressed: () {
                          showDialog(
                              context: context,
                              builder: (BuildContext context) {
                                return Dialog(
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(20.0),
                                  ),
                                  child: Container(
                                    width: 500,
                                    height: 200,
                                    padding: EdgeInsets.all(20.0),
                                    child: Column(
                                      // mainAxisSize: MainAxisSize.min,
                                      mainAxisAlignment: MainAxisAlignment.start,
                                      crossAxisAlignment: CrossAxisAlignment.start,
                                      children: [
                                        Text('Select Brunch' ,style: smallGrayTextStyle),
                                        SizedBox(height: 5),
                                        Row(
                                          children: [
                                            Container(
                                              width: 400,
                                              child: TextField(
                                                decoration: InputDecoration(
                                                  //hintText: "Name",
                                                  border: OutlineInputBorder(
                                                    borderRadius: BorderRadius.circular(10),
                                                    borderSide: BorderSide(color: Colors.grey),
                                                  ),
                                                  contentPadding: EdgeInsets.symmetric(horizontal: 12, vertical: 15),
                                                ),
                                              ),
                                            ),
                                          ],
                                        ),
                                        SizedBox(
                                          height: 40,
                                        ),
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
                                                  child: Text(
                                                    'Cancel',
                                                    style: TextStyle(fontSize: 15 , color: Colors.white),
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
                                                  color: Colors.blue,
                                                  borderRadius: BorderRadius.circular(10),
                                                ),
                                                child: TextButton(
                                                  child: Text(
                                                    'Add',
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
                                );}
                          );
                        },
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: const [
                            Icon(Icons.restaurant_outlined , size: 80, color: Colors.black,),
                            SizedBox(height: 70,),
                            Text('Sign' , style: TextStyle(fontSize: 20,color: Colors.black,fontWeight: FontWeight.bold)),
                          ],
                        ),
                      ),
                    ),


                  ],
                ) : dropDownValue == 'Sign' ?
                SizedBox(
                    height: _hight,
                    width: _width,
                  child: GridView.builder(
                    padding: EdgeInsets.all(16),
                    gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2,
                      crossAxisSpacing: 20,
                      mainAxisSpacing: 20,
                     // childAspectRatio : 3/5,
                    ),
                    itemCount: 10,
                    itemBuilder: (context, index) {
                      return GestureDetector(
                        onTap: () {
                          print('///////////');

                        },
                        onLongPress: (){
                          showDialog(
                              context: context,
                              builder: (BuildContext context) {
                                return Dialog(
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(20.0),
                                  ),
                                  child: Container(
                                    width: 500,
                                    height: 200,
                                    padding: const EdgeInsets.all(20.0),
                                    child: Column(
                                      // mainAxisSize: MainAxisSize.min,
                                      mainAxisAlignment: MainAxisAlignment.center,
                                      crossAxisAlignment: CrossAxisAlignment.center,
                                      children: [
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
                                                  child: Text(
                                                    'Delete',
                                                    style: TextStyle(fontSize: 15 , color: Colors.white),
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
                                                  borderRadius: BorderRadius.circular(10),
                                                ),
                                                child: TextButton(
                                                  child: Text(
                                                    'Edit',
                                                    style: TextStyle(fontSize: 15 , color: Colors.white),
                                                  ),
                                                  onPressed: () {
                                                    showDialog(
                                                    context: context,
                                                    builder: (BuildContext context){
                                                      return editBusinessForm('name1 ' , 44,'Cafe' , 'Parking' , 'Hospital' , 'New Branch');
                                                    });

                                                  },
                                                ),
                                              ),
                                            ],
                                          ),
                                        )
                                      ],
                                    ),
                                  ),
                                );}
                          );
                        },
                        child: Stack(
                            children:[
                              Container(
                                height: 290,
                                width: 250,
                                decoration: BoxDecoration(
                                  color: Colors.grey.shade300,
                                  borderRadius: BorderRadius.circular(10),
                                ),
                                child: Column(
                                  // mainAxisAlignment: MainAxisAlignment.end,
                                  // crossAxisAlignment: CrossAxisAlignment.end,
                                  children:  [
                                    Padding(
                                      padding: const EdgeInsets.all(18.0),
                                      child: Center(
                                        child: Container(
                                          height: 200,
                                          width: 200,
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
                                    ),
                                    const SizedBox(
                                      height: 20,
                                    ),
                                    Center(child: Padding(
                                      padding: EdgeInsets.only(
                                          bottom: 5
                                      ),
                                      child: Text("Item", style: TextStyle(fontSize: 14,color: Colors.black , fontWeight: FontWeight.bold)),
                                    ))],
                                ),

                              ),

                            ]
                        ),
                      );
                    },
                  ),
                ) : dropDownValue == 'Monthly' ?
                reviews()
                  : SizedBox(
                  height: _hight,
                  width: _width,
                  child: GridView.builder(
                    padding: EdgeInsets.all(16),
                    gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2,
                      crossAxisSpacing: 20,
                      mainAxisSpacing: 20,
                      // childAspectRatio : 3/5,
                    ),
                    itemCount: 10,
                    itemBuilder: (context, index) {
                      return Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: GestureDetector(
                          onTap: () {
                            print('/////////// half ');

                          },
                          onLongPress: (){
                            showDialog(
                                context: context,
                                builder: (BuildContext context) {
                                  return Dialog(
                                    shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(20.0),
                                    ),
                                    child: Container(
                                      width: 500,
                                      height: 200,
                                      padding: const EdgeInsets.all(20.0),
                                      child: Column(
                                        // mainAxisSize: MainAxisSize.min,
                                        mainAxisAlignment: MainAxisAlignment.center,
                                        crossAxisAlignment: CrossAxisAlignment.center,
                                        children: [
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
                                                    child: Text(
                                                      'Delete',
                                                      style: TextStyle(fontSize: 15 , color: Colors.white),
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
                                                    borderRadius: BorderRadius.circular(10),
                                                  ),
                                                  child: TextButton(
                                                    child: Text(
                                                      'Edit',
                                                      style: TextStyle(fontSize: 15 , color: Colors.white),
                                                    ),
                                                    onPressed: () {
                                                      showDialog(
                                                          context: context,
                                                          builder: (BuildContext context){
                                                            return editBusinessForm('name1 ' , 44,'Cafe' , 'Parking' , 'Hospital' , 'New Branch');
                                                          });

                                                    },
                                                  ),
                                                ),
                                              ],
                                            ),
                                          )
                                        ],
                                      ),
                                    ),
                                  );}
                            );
                          },
                          child: Stack(
                              children:[
                                Container(
                                  height: 290,
                                  width: 250,
                                  decoration: BoxDecoration(
                                    color: Colors.grey.shade300,
                                    borderRadius: BorderRadius.circular(10),
                                  ),
                                  child: Column(
                                    // mainAxisAlignment: MainAxisAlignment.end,
                                    // crossAxisAlignment: CrossAxisAlignment.end,
                                    children:  [
                                      Padding(
                                        padding: const EdgeInsets.all(18.0),
                                        child: Center(
                                          child: Container(
                                            height: 200,
                                            width: 200,
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
                                      ),
                                      const SizedBox(
                                        height: 20,
                                      ),
                                      Center(child: Padding(
                                        padding: EdgeInsets.only(
                                            bottom: 5
                                        ),
                                        child: Text("Item half", style: TextStyle(fontSize: 14,color: Colors.black , fontWeight: FontWeight.bold)),
                                      ))],
                                  ),

                                ),

                              ]
                          ),
                        ),
                      );
                    },
                  ),
                )

              ],
            ),
          ),
        ],
      ),

    );
  }

}
