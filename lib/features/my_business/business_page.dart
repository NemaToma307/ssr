import 'package:flutter/material.dart';
import 'package:ssr_project/component/style/size_colors.dart';
import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:ssr_project/features/my_business/reviews.dart';
import 'package:ssr_project/features/place_recommendation/edit_business_form.dart';
import '../../component/widgets/widgets.dart';


class businessPage extends StatefulWidget {
  const businessPage({Key? key}) : super(key: key);


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
                    radius: 33,
                    child: CircleAvatar(
                      radius: 31,
                      backgroundColor: Colors.grey.shade300,
                      child: SizedBox(
                        height: 50,
                        width: 50,
                        child: IconButton(
                          onPressed: () {
                            // Navigator.push(
                            //   context,
                            //   MaterialPageRoute(builder: (context) => businessForm()),
                            // );
                          },
                          icon: const Icon(Icons.add, color: Colors.black , size: 37,),
                        ),
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
                  child: appBarName('UserName')
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
                                        const SizedBox(height: 5),
                                        Row(
                                          children: [
                                            SizedBox(
                                              width: 400,
                                              child: TextField(
                                                controller: brunchController ,
                                                // onChanged: (val) {
                                                //   setState(() {
                                                //     brunchController.text = val ;
                                                //   });
                                                // },
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
                                        const SizedBox(
                                          height: 30,
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
                                                    'Add',
                                                    style: TextStyle(fontSize: 15 , color: Colors.white),
                                                  ),
                                                  onPressed: () {
                                                    brunchController.text != '' ?
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
                                                                        Text('Brunch Information', style: bigBlueTextStyle),
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
                                                                            bidTitle('Brunch Name', smallBlueTextStyle),
                                                                            const SizedBox(height: 15.0),
                                                                            SizedBox(
                                                                              width: 400,
                                                                              child: TextField(
                                                                                controller: brunchNameController,
                                                                                onChanged: (val) {
                                                                                  setState(() {
                                                                                    brunchController.text = val ;
                                                                                  });
                                                                                },
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
                                                                            const SizedBox(height: 10.0),
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
                                                                                'Submit',
                                                                                style: TextStyle(fontSize: 15 , color: Colors.white),
                                                                              ),
                                                                              onPressed: () {
                                                                                brunchNameController.text != '' ?
                                                                                AwesomeDialog(
                                                                                  width: 500,
                                                                                  context: context,
                                                                                  dialogType: DialogType.success,
                                                                                  animType: AnimType.rightSlide,
                                                                                  //title: '',
                                                                                  desc: 'The operation was successful',
                                                                                  //btnCancelOnPress: () {},
                                                                                  btnOkOnPress: () {},
                                                                                ).show() :
                                                                                showDialog(
                                                                                    context: context,
                                                                                    builder: (BuildContext context) {
                                                                                      return fillBlank(context);
                                                                                    }
                                                                                );
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
                                                    ) : showDialog(
                                                        context: context,
                                                        builder: (BuildContext context) {
                                                          return fillBlank(context);
                                                        }
                                                    );
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
                        child: const Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children:[
                            Icon(Icons.local_cafe_outlined , size: 80,color: Colors.black,),
                            SizedBox(height: 70,),
                            Text('Half Million' , style: TextStyle(fontSize: 20,color: Colors.black,fontWeight: FontWeight.bold)),
                          ],
                        ),
                      ),
                    ),
                    const SizedBox(
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
                                    padding: const EdgeInsets.all(20.0),
                                    child: Column(
                                      // mainAxisSize: MainAxisSize.min,
                                      mainAxisAlignment: MainAxisAlignment.start,
                                      crossAxisAlignment: CrossAxisAlignment.start,
                                      children: [
                                        Text('Select Brunch' ,style: smallGrayTextStyle),
                                        const SizedBox(height: 5),
                                        Row(
                                          children: [
                                            SizedBox(
                                              width: 400,
                                              child: TextField(
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
                                        const SizedBox(
                                          height: 30,
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
                        child: const Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Icon(Icons.restaurant_outlined , size: 80, color: Colors.black,),
                            SizedBox(height: 70,),
                            Text('Sign' , style: TextStyle(fontSize: 20,color: Colors.black,fontWeight: FontWeight.bold)),
                          ],
                        ),
                      ),
                    ),


                  ],
                ) : dropDownValue == 'Sign' ?

                businessTypeContainer('Sign',_hight,_width ,/*الليست تبع ساين كلها*/ /*'name1 ' , 44,'Cafe' , 'Parking' , 'Hospital' , 'New Branch'*/)
                    : dropDownValue == 'Monthly' ?
                const reviews() :
                businessTypeContainer('Half Million',_hight,_width, /*الليست تبع هاف كلها*/ /*'name1 ' , 44,'Cafe' , 'Parking' , 'Hospital' , 'New Branch'*/)

              ],
            ),
          ),
        ],
      ),

    );
  }

}
