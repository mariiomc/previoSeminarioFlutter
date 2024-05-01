// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:flutter_seminario/Screens/home_users.dart';
import 'package:flutter_seminario/Resources/pallete.dart';
import 'package:flutter_seminario/Screens/register_screen.dart';
import 'package:flutter_seminario/Screens/login_screen.dart';

import 'package:get/get.dart';


class HomePage extends StatefulWidget {
  // ignore: prefer_const_constructors_in_immutables
  HomePage({super.key});

  @override
  State<HomePage> createState() => _nameState();
}

// ignore: camel_case_types
class _nameState extends State<HomePage> {
  int _selectedIndex = 0;

 /*  void navigationBar(int index){
    setState(() {
      _selectedIndex=index;
    });
  }
  final List<Widget> _pages = [
    UserListPage(),
  ]; */
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        
        // ignore: prefer_const_constructors
        title: Center(child: Text('DEMO FLUTTER',),),
        elevation: 0,
        leading: Builder(
          builder: (context) =>IconButton(
            icon: Icon(
            Icons.menu,
            color: Pallete.salmonColor,
            ),
            onPressed: (){
              Scaffold.of(context).openDrawer();
            },
          ),
        ),
      ),
      drawer: Drawer(
        backgroundColor: Pallete.greyColor,
        child: Column(
          children: [
            DrawerHeader(
              child: Image.asset(
                'logo.png',
                fit: BoxFit.cover,
              ),
            ),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 25.0),
              child: Divider(
                color:Pallete.backgroundColor,
              ),
            ),
            Padding(
              
              //onPressed:NavigationDestination(icon: icon, label: label),
              padding: EdgeInsets.only(left:25.0),
              child: ListTile(
                leading: Icon(
                  Icons.home,
                  color: Colors.white,
                ),
                title: Text(
                  'Home',
                  style: TextStyle(color: Colors.white),
                  ),
                onTap: () {
                  Get.to(() => HomePage());
                },
              ),
            ),
            Padding(
              padding: EdgeInsets.only(left:25.0),
              child: ListTile(
                leading: Icon(
                  Icons.flood_outlined,
                  color: Colors.white,

                ),
                title: Text(
                'Places',
                style: TextStyle(color: Colors.white),
                ),
                onTap: () {
                  Get.to(() => UserListPage());
                },
              ),
            ),
            Padding(
              padding: EdgeInsets.only(left:25.0),
              child: ListTile(
                leading: Icon(
                  Icons.book,
                  color: Colors.white,

                ),
                title: Text(
                  'Log In',
                  style: TextStyle(color: Colors.white),
                ),
                onTap: () {
                  Get.to(() =>LoginScreen());
                },
              ),
            ),
            Padding(
              padding: EdgeInsets.only(left:25.0),
              child: ListTile(
                leading: Icon(
                  Icons.ad_units,
                  color: Colors.white,

                ),
                title: Text(
                'Register',
                style: TextStyle(color: Colors.white),
                ),
                onTap: () {
                  Get.to(() =>RegisterScreen());
                },
              ),
            ),
          ],
        ),
      ),
      body: Center(child: Text('Esta es la pagina principal.'),),
    );
  }
}