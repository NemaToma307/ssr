
// import 'dart:ui_web' as ui;
//
// import 'dart:html' as html;
//
// //import 'dart:ui';
// import 'package:awesome_dialog/awesome_dialog.dart';
// //import 'dart:ui' as ui; // استيراد ui platform view
import 'package:flutter/material.dart';
import 'package:ssr_project/component/style/size_colors.dart';

import '../../component/widgets/widgets.dart';
import 'business_form.dart';

class placePage extends StatefulWidget {
  const placePage({Key? key}) : super(key: key);


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
                        constraints: const BoxConstraints(),
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
              const SizedBox(
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
                            borderRadius: const BorderRadius.only(
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
                            borderRadius: const BorderRadius.only(
                                topLeft: Radius.circular(20),
                                topRight: Radius.circular(20)
                            ),
                          ),
                          child: TextButton(
                            onPressed: () {

                              showDialog(
                                  context: context,
                                  builder: (BuildContext context) {
                                    return  businessForm();
                                  });
                              // Navigator.push(
                              //   context,
                              //   MaterialPageRoute( builder: (context) => showDialog(
                              //       context: context,
                              //       builder: (BuildContext context) {}),
                              //   ));

                             // showDialogWidget(context);
                            },
                            child: const Text('+' , style: TextStyle(fontSize: 24,color: Colors.black , fontWeight: FontWeight.bold),),
                          ),
                        ),
                      ],
                    ),
                    Container(
                      width: _width*1.2,
                      height: _hight,
                      decoration: const BoxDecoration(
                          color: Colors.pink,
                          borderRadius: BorderRadius.only(
                            bottomLeft: Radius.circular(40),
                            bottomRight: Radius.circular(40),
                          )
                      ),
                      // child: ClipRRect(
                      //   borderRadius: BorderRadius.only(
                      //     bottomLeft: Radius.circular(40),
                      //     bottomRight: Radius.circular(40),
                      //   ),
                      //   child: HtmlElementView(
                      //     viewType: 'iframeElement',
                      //   ),
                      // ),
                    )
                  ],
                ):
                SizedBox(
                height: _hight,
                width: _width*1.3,
                child: GridView.builder(
                  padding: const EdgeInsets.all(16),
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
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
                              child: const Column(
                                mainAxisAlignment: MainAxisAlignment.end,
                                crossAxisAlignment: CrossAxisAlignment.end,
                                children: [
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
                                  child: Text("map here44 $index", style: const TextStyle(color: Colors.black)),
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



}
// اللي شغال
// void registerIFrame() {
//   html.IFrameElement iframe = html.IFrameElement()
//     ..src = "assets/riyadh_heatmap.html"
//     ..style.border = "none"
//     ..style.width = "100%"
//     ..style.height = "100%";
//
//   // تسجيل العنصر
//   ui.platformViewRegistry.registerViewFactory(
//     'iframeElement',
//         (int viewId) => iframe,
//   );
// }



