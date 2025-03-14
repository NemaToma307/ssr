import 'package:flutter/material.dart';
import 'package:ssr_project/component/style/size_colors.dart';

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

Widget Name() =>  Padding(
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

Widget AppBarName(text) =>  Row(
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