import 'package:demo_flutter/pages/users/home_users.dart';
import 'package:flutter/material.dart';
import 'package:demo_flutter/pages/home_page.dart';


void main(){
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: HomePage(),
      theme: ThemeData(primarySwatch: Colors.amber),
      routes: {
        '/home_page': (context) =>  HomePage(),
        '/userlist_page': (context) => UserListPage(),
      },
    );
  }
}
