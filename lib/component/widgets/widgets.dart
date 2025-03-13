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
          SizedBox(
            width: 25,
          ),
          smallTitle('Sign',  TextStyle(fontSize: 14,color: Colors.black , fontWeight: FontWeight.bold))
          //Text('Sign' , style: smallBlackTextStyle,),
        ],
      ),
      const SizedBox(width: 30,),
      Row(
        children: [
          CircleAvatar(
            backgroundColor:  Colors.grey,
            radius: 15,
          ),
          SizedBox(
            width: 25,
          ),
          smallTitle('Half Million',  TextStyle(fontSize: 14,color: Colors.black , fontWeight: FontWeight.bold))
          //Text('Sign' , style: smallBlackTextStyle,),
        ],
      )

    ],
  ),
);

Widget AppBarName(text) =>  Row(
  children:  [
    CircleAvatar(radius: 30, backgroundColor: Colors.grey),
    SizedBox(width: 15),
    Text(text, style: smallBlackTextStyle),
  ],
);