import 'package:flutter/material.dart';
import 'package:flutter_seminario/login_screen.dart';
import 'package:flutter_seminario/pallete.dart';
import 'package:flutter_seminario/params.dart';
import 'package:flutter_seminario/title.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    const String appTitle = 'Seminario Flutter';
    return MaterialApp(
      title: appTitle,
      theme: ThemeData.dark().copyWith(
        scaffoldBackgroundColor: Pallete.backgroundColor,
      ),
      home: LoginScreen(),
    );
  }
}
