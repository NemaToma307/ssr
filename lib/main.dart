import 'package:flutter/material.dart';
import 'package:ssr_project/features/place_ecommendation/place_page.dart';

import 'features/Dashboard/home_page.dart';
import 'features/Dynamic_Facilities/facilities.dart';
import 'features/area_compare/compare_heat_maps.dart';
import 'features/my_business/business_page.dart';
import 'features/my_business/reviews.dart';
import 'features/place_ecommendation/business_form.dart';
import 'features/place_ecommendation/place_page.dart';
import 'features/recomended_heatmap/heat_map.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home:  homePage(),
    );
  }
}
