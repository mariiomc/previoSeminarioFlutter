import 'package:flutter/material.dart';
import 'package:flutter_seminario/Screens/home_page.dart';
import 'package:flutter_seminario/Resources/pallete.dart';
import 'package:get/get.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    const String appTitle = 'Seminario Flutter';
    return GetMaterialApp(
      title: appTitle,
      theme: ThemeData.dark().copyWith(
        scaffoldBackgroundColor: Pallete.backgroundColor,
      ),
      home: HomePage(),
    );
  }
}

