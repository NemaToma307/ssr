

import 'package:flutter/material.dart';
import 'package:ssr_project/component/widgets/widgets.dart';
import 'package:ssr_project/features/Dynamic_Facilities/facilities.dart';
import 'package:ssr_project/features/place_recommendation/place_page.dart';

import '../my_business/business_page.dart';
import '../setting/setting_section.dart';

class homePage extends StatefulWidget {
  const homePage({Key? key}) : super(key: key);


  @override
  State<homePage> createState() => _homePageState();
}

class _homePageState extends State<homePage> {



  final List<Widget> _pages = const [
    Center(child: Text("Place Recommendation", style: TextStyle(fontSize: 24))),
    Center(child: Text("Dynamic & Facilities", style: TextStyle(fontSize: 24))),
    Center(child: Text("My Business", style: TextStyle(fontSize: 24))),
    Center(child: Text("Settings", style: TextStyle(fontSize: 24))),
    Center(child: Text("Help Centre", style: TextStyle(fontSize: 24))),
    Center(child: Text("Contact Us", style: TextStyle(fontSize: 24))),
    Center(child: Text("Logging Out...", style: TextStyle(fontSize: 24, color: Colors.red))),
  ];


  int _selectedIndex = 0;

  void _onItemTapped(int index) {
    setState(() {

      _selectedIndex = index;
      print('here in onItemTapped $_selectedIndex');



    });
  }
  @override
  Widget build(BuildContext context) {

    var _width = MediaQuery.of(context).size.width/4;
    return Scaffold(
      body: Row(
        children: [
          Container(
            width: _width,
            decoration: BoxDecoration(
              color: Colors.white,
              border: Border(right: BorderSide(color: Colors.grey.shade300, width: 1)),
            ),
            child: Column(
              children: [
                const DrawerHeader(
                  decoration: BoxDecoration(color: Colors.white),
                  child: Row(
                    children: [
                      CircleAvatar(radius: 30, backgroundColor: Colors.grey),
                      SizedBox(width: 10),
                      Text("Logo ", style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
                    ],
                  ),
                ),
                Expanded(
                    child: ListView(
                      children: [
                        DrawerItem(0 , _selectedIndex , Icons.place , 'Place Recommendation' , _onItemTapped),
                        DrawerItem(1 , _selectedIndex , Icons.domain , 'Dynamic & Facilities' , _onItemTapped),
                        DrawerItem(2 , _selectedIndex , Icons.business , 'My Business' , _onItemTapped),
                        DrawerItem(3 , _selectedIndex , Icons.settings , 'Setting' , _onItemTapped),
                      ],
                    )
                ),
                const Divider(),
                DrawerItem(4 , _selectedIndex , Icons.help_outline_outlined , 'Help Center' , _onItemTapped),
                DrawerItem(5 , _selectedIndex , Icons.chat , 'Contact Us' , _onItemTapped),
                DrawerItem(6 , _selectedIndex , Icons.logout , 'Log out' , _onItemTapped),

              ],
            ),
          ),
          Expanded(
            child: Container(
              color: Colors.grey.shade100,
              child:  _selectedIndex == 0 ?   const placePage()
               :   _selectedIndex == 1 ? const facilities()
               :  _selectedIndex == 2 ? const businessPage()
               : const setting()
              //_pages[_selectedIndex]
              // _pages[_selectedIndex] == 0 ? Navigator.pushNamed(context, '/second') :
              // _pages[_selectedIndex] == 1 ? facilities() :
              // _pages[_selectedIndex] == 2 ? businessPage() : setting() ,

            ),
          ),
        ],
      ),

    );

  }



}

