// ignore_for_file: use_key_in_widget_constructors, prefer_const_constructors

import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_seminario/Screens/home_page.dart';
import 'package:flutter_seminario/Screens/detalles_user.dart';
import 'package:http/http.dart' as http;
import 'package:get/get.dart';
import 'package:dio/dio.dart' ;



class UserListPage extends StatefulWidget {
  @override
  _UserListPageState createState() => _UserListPageState();
}

class _UserListPageState extends State<UserListPage> {
 
  var lista_users;
  @override
  void initState() {
    super.initState();
    
    getData();
  }

  void getData() async{
    try{
      var res= await Dio().get('http://127.0.0.1:3000/users');
      setState(() {
        lista_users =res.data as List;
      });
      if(lista_users.statusCode==200){

      }else{
        print(lista_users.statusCode);
      }
    }catch(e){
      print(e);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Center(child: Text('User List',),),
        elevation: 0,
        leading: Builder(
          builder: (context) =>IconButton(
          icon: Icon(
            Icons.turn_left,
            color: Colors.black,
            ),
            onPressed: (){
              Get.to(HomePage());
            },
            ),
        ),
      ),
      body: ListView.builder(
        itemBuilder: (BuildContext context , int index ){
          return Card(
            child: ListTile(
              title: Text(lista_users[index]['first_name']),
              subtitle: Text(lista_users[index]['last_name']),
              onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => UserDetailsPage(user: lista_users[index]),
                ),
              );
            },
            ),
            
          );
          
        },

        itemCount: lista_users == null?0:lista_users.length,
        
        
        )
    
    );
  }
}