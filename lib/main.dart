import 'package:cloud_storage/pages/profile.dart';
//import 'package:cloud_storage/styles/app_styles.dart';
import 'package:flutter/material.dart';
//import 'package:flutter_svg/flutter_svg.dart';
import '../pages/home.dart';
import '../pages/profile.dart';
import 'package:get/get.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        body: Homepage(),
      ),
    );
  }
}
