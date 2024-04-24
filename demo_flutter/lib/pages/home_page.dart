// ignore_for_file: prefer_const_constructors

import 'package:demo_flutter/pages/users/home_users.dart';
import 'package:flutter/material.dart';


class HomePage extends StatefulWidget {
   // ignore: prefer_const_constructors_in_immutables
   HomePage({super.key});

  @override
  State<HomePage> createState() => _nameState();
}

// ignore: camel_case_types
class _nameState extends State<HomePage> {
  int _selectedIndex=0;

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
            color: Colors.black,
            ),
            onPressed: (){
              Scaffold.of(context).openDrawer();
            },
            ),
        ),
      ),
      drawer: Drawer(
        backgroundColor: Colors.lightGreen,
        child: Column(
          children: [
            DrawerHeader(
              child: Image.asset(
                'lib/images/logo.png',
                color: Colors.white,
                ),
                ),
            Padding(
                  padding: EdgeInsets.symmetric(horizontal: 25.0),
                  child: Divider(
                    color:Colors.grey[800] ,
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
                  Navigator.pop(context);
                  Navigator.pushNamed(context,'/userlist_page');
                },
              ),
              ),
            Padding(
              padding: EdgeInsets.only(left:25.0),
              child: ListTile(
                leading: Icon(
                  Icons.account_circle_outlined,
                  color: Colors.white,

                ),
                title: Text(
                   'Users',
                   style: TextStyle(color: Colors.white),
                   ),
                   onTap: () {
                    Navigator.pop(context);
                  Navigator.pushNamed(context,'/userlist_page');
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
                   'Posts',
                   style: TextStyle(color: Colors.white),
                   ),
                   onTap: () {
                    Navigator.pop(context);
                  Navigator.pushNamed(context,'/userlist_page');
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