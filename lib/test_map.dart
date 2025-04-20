// ملف: lib/local_html_map_view.dart

import 'dart:html';
//import 'dart:ui' as ui;
import 'dart:ui_web' as ui;
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';


import 'dart:html';
//import 'dart:ui' as ui; // مهم لتسجيل HtmlElementView
import 'dart:ui_web' as ui_web;
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  final TextEditingController _searchController = TextEditingController();

  // يمكنك إضافة بيانات الفروع في هذا المتغير
  // final List<Map<String, dynamic>> allBranches = [
  //   {'name': 'half', 'lat': 24.7136, 'lng': 46.6753, 'address': 'Address 1'},
  //   {'name': 'sign', 'lat': 24.7336, 'lng': 46.6853, 'address': 'Address 2'},
  // ];

  void _search() {
    String query = _searchController.text.trim();
    if (query.isEmpty) return;

    // إرسال استعلام البحث فقط إلى الخريطة
    final iframeElement = IFrameElement()
      ..src = 'assets/riyadh_heatmap.html'
      ..style.border = 'none'
      ..style.width = '100%'
      ..style.height = '100%';
    print('object');

    iframeElement.contentWindow?.postMessage({
      'type': 'search',  // تحديد نوع الرسالة على أنها بحث
      'query': query,    // إرسال النص الذي يبحث عنه المستخدم
    }, '*');
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'خريطة الرياض',
      home: Scaffold(
        appBar: AppBar(title: Text('خريطة الرياض')),
        body: Column(children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: TextField(
              controller: _searchController,
              decoration: InputDecoration(
                hintText: 'ابحث عن محل',
                suffixIcon: IconButton(
                  icon: Icon(Icons.search),
                  onPressed: _search,
                ),
              ),
            ),
          ),
          SizedBox(
            height: 500,
            width: 900,
            child: LocalHtmlMapView(),
          ),
        ]),
      ),
    );
  }
}

class LocalHtmlMapView extends StatelessWidget {
  final String htmlPath;

  LocalHtmlMapView({this.htmlPath = 'assets/riyadh_heatmap.html'});

  @override
  Widget build(BuildContext context) {
    if (!kIsWeb) {
      return Center(child: Text('Only supported on Flutter Web.'));
    }

    final IFrameElement iframeElement = IFrameElement()
      ..src = htmlPath
      ..id = 'map-iframe'
      ..style.border = 'none'
      ..style.width = '100%'
      ..style.height = '100%';

    // تسجيل viewType
    // ignore: undefined_prefixed_name
    ui_web.platformViewRegistry.registerViewFactory(
      'iframe-html-view',
          (int viewId) => iframeElement,
    );

    return HtmlElementView(viewType: 'iframe-html-view');
  }
}


//<!--
//         var map_3e92f02d3e9e7bbbd891cb48593401a9 = L.map(
//             "map_3e92f02d3e9e7bbbd891cb48593401a9",
//             {
//                 center: [24.7136, 46.6753],  // الرياض
//                 zoom: 10,
//                 zoomControl: true,
//                 preferCanvas: false,
//             }
//         );
//
//         // تحميل الخريطة من OpenStreetMap
//         var tile_layer_04726cc7fed04b3c31032ace31147b5f = L.tileLayer(
//             "https://tile.openstreetmap.org/{z}/{x}/{y}.png",
//             {
//                 minZoom: 0,
//                 maxZoom: 19,
//                 attribution: "&copy; <a href='https://www.openstreetmap.org/copyright'>OpenStreetMap</a> contributors",
//             }
//         ).addTo(map_3e92f02d3e9e7bbbd891cb48593401a9);
//
//         // استماع للرسائل القادمة من Flutter
//         window.addEventListener("message", function(event) {
//             const data = event.data;
//             if (data.type === "updateMarkers") {
//                 updateMarkers(data.branches);
//             }
//         });
//
//         // دالة لتحديث العلامات على الخريطة
//         function updateMarkers(branches) {
//             // مسح العلامات السابقة
//             if (window.markers) {
//                 window.markers.forEach(function(marker) {
//                     map_3e92f02d3e9e7bbbd891cb48593401a9.removeLayer(marker);
//                 });
//             }
//
//             // إضافة العلامات الجديدة
//             window.markers = [];
//             branches.forEach(function(branch) {
//                 var marker = L.marker([branch.lat, branch.lng])
//                     .addTo(map_3e92f02d3e9e7bbbd891cb48593401a9)
//                     .bindPopup('<b>' + branch.name + '</b><br>' + branch.address);
//
//                 window.markers.push(marker);
//             });
//
//             // تغيير مركز الخريطة إلى أول فرع في القائمة
//             if (branches.length > 0) {
//                 map_3e92f02d3e9e7bbbd891cb48593401a9.setView([branches[0].lat, branches[0].lng], 12);
//             }
//         }
//         -->



/////النسخ الاخير
// // إنشاء الخريطة
//          window.addEventListener("message", function(event) {
//     const data = event.data;
//     if (data.type === "search") {
//       const query = data.query.toLowerCase();
//       handleSearch(query);
//     }
//   });
//
//   function handleSearch(query) {
//     // مثال: افترض أن لدينا بعض العناصر (markers) على الخريطة
//     // ونريد تكبير الخريطة أو تمييز العنصر الذي يحتوي اسمه على query
//
//     let found = false;
//
//     window.markers?.forEach(marker => {
//       const popupText = marker.getPopup()?.getContent()?.toLowerCase() || '';
//       if (popupText.includes(query)) {
//         marker.openPopup();
//         map_3e92f02d3e9e7bbbd891cb48593401a9.setView(marker.getLatLng(), 14);
//         found = true;
//       }
//     });
//
//     if (!found) {
//       alert("لم يتم العثور على نتائج في الخريطة.");
//     }
//   }
