import 'package:flutter/material.dart';
import 'package:ssr_project/component/style/size_colors.dart';
import 'package:ssr_project/features/place_recommendation/edit_business_form.dart';
import 'package:ssr_project/core/data/model/form_model.dart';

Widget DrawerItem(index, selectedIndex, icon, title, onTap) {
  bool isSelected = false;

  index == selectedIndex ? isSelected = true : false;

  return ListTile(
    leading: Icon(icon, color: isSelected ? Colors.blue : Colors.black54),
    trailing: isSelected
        ? Container(
            height: 20,
            width: 5,
            decoration: BoxDecoration(
                color: Colors.blue, borderRadius: BorderRadius.circular(40)),
          )
        : const SizedBox(),
    title: Text(
      title,
      style: TextStyle(
          color: isSelected ? Colors.blue : Colors.black,
          fontWeight: isSelected ? FontWeight.bold : FontWeight.normal),
    ),
    onTap: () => onTap(index),
  );
}

Widget bidTitle(text, style) => Row(
      children: [
        Text(
          text,
          style: style,
        )
      ],
    );

Widget smallTitle(text, style) => Row(
      children: [
        Text(
          text,
          style: style,
        )
      ],
    );

Widget name() =>  Padding(
  padding: const EdgeInsets.all(22.0),
  child: Row(
    children: [
      Row(
        children: [
          CircleAvatar(
            backgroundColor:  Colors.blue.shade900,
            radius: 15,

          ),
          const SizedBox(
            width: 25,
          ),
          smallTitle('Sign',  const TextStyle(fontSize: 14,color: Colors.black , fontWeight: FontWeight.bold))
          //Text('Sign' , style: smallBlackTextStyle,),
        ],
      ),
      const SizedBox(width: 30,),
      Row(
        children: [
          const CircleAvatar(
            backgroundColor:  Colors.grey,
            radius: 15,
          ),
          const SizedBox(
            width: 25,
          ),
          smallTitle('Half Million',  const TextStyle(fontSize: 14,color: Colors.black , fontWeight: FontWeight.bold))
          //Text('Sign' , style: smallBlackTextStyle,),
        ],
      )

    ],
  ),
);

Widget appBarName(text) =>  Row(
  children:  [
    const CircleAvatar(radius: 30, backgroundColor: Colors.grey),
    const SizedBox(width: 15),
    Text(text, style: smallBlackTextStyle),
  ],
);

Widget fillBlank (context)=> Dialog(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(20.0),
        ),
        child: Container(
          width: 60,
          height: 150,
          padding: const EdgeInsets.all(20.0),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              const Center(
                child: Text('Please fill the blank'),
              ),
              const SizedBox(height: 25.0),
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
                  ],
                ),
              )


            ],
          ),
        ),

);

List<FormModel> typeBusiness=[];

Widget businessTypeContainer(dropDownValueName,_height ,_width /*, name , budget , type , listOne , listTow , status*/ )=> SizedBox(
  height: _height,
  width: _width,
  child: GridView.builder(
    padding: const EdgeInsets.all(16),
    gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
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
                                  child: const Text(
                                    'Delete',
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
                                    'Edit',
                                    style: TextStyle(fontSize: 15 , color: Colors.white),
                                  ),
                                  onPressed: () {
                                    showDialog(
                                        context: context,
                                        builder: (BuildContext context){
                                          return editBusinessForm(
                                              typeBusiness[index].name ,
                                              typeBusiness[index].budget ,
                                              typeBusiness[index].type ,
                                              typeBusiness[index].optionListOne,
                                              typeBusiness[index].optionListTow,
                                              typeBusiness[index].status,
                                            // map
                                          );
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
                            child: Text("map here44 $index", style: const TextStyle(color: Colors.black)),
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
                      child: Text(typeBusiness[index].name.toString(), style: TextStyle(fontSize: 14,color: Colors.black , fontWeight: FontWeight.bold)),
                    ))],
                ),

              ),

            ]
        ),
      );
    },
  ),
);