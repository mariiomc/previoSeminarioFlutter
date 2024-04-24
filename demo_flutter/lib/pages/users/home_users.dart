// ignore_for_file: use_key_in_widget_constructors, prefer_const_constructors

import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:demo_flutter/services/UserService.dart';
import 'package:http/http.dart' as http;


class User {
  final String id;
  final String name;
  

  User({required this.id, required this.name});

  factory User.fromJson(Map<String, dynamic> json) {
    return User(
      id: json['_id'],
      name: json['first_name'],
    );
  }
}

class UserListPage extends StatefulWidget {
  @override
  _UserListPageState createState() => _UserListPageState();
}

class _UserListPageState extends State<UserListPage> {
  late Future<List<User>> _futureUsers;

  @override
  void initState() {
    super.initState();
    
    _futureUsers= fetchUsers();
  }

  Future<List<User>> fetchUsers() async {
    final response =
        await http.get(Uri.parse('http://127.0.0.1:3000/users'),headers: <String, String>{
          'Content-Type': 'application/json; charset=UTF-8',
          //'Access-Control-Allow-Origin': '*',
        },);

    if (response.statusCode == 200) {
      final List<dynamic> data = jsonDecode(response.body);
      print(data.map((json) => User.fromJson(json)).toList());
      List<User> users = data.map((userData) {
          return User(
          id: userData['_id'],
          name: userData['first_name'],
          
    // Agrega otros campos según sea necesario
  );
}).toList();
print(users[0].id);
print(users[0].name);
print(users[1].id);
print(users[1].name);
print(users[2].id);
print(users[2].name);
      return users;
    } else {
      throw Exception('Failed to load users');
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
              Navigator.pushNamed(context, '/home_page');
            },
            ),
        ),
      ),
      body: Column(
        children: [
          
          FutureBuilder<List<User>>(
          future: _futureUsers,
          builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return Center(child: CircularProgressIndicator());
          } else if (snapshot.hasError) {
            return Center(child: Text('Error: ${snapshot.error}'));
          } else {
            return ListView.builder(
              itemCount: snapshot.data!.length,
              
              itemBuilder: (context, index) {
                final user = snapshot.data![index];
                return ListTile(
                  title: Text(user.name),
                  // Puedes agregar más información del usuario aquí si es necesario
                );
              },
            );
          }
          
        },
        ),
      ],
        
        
      ),
      
    );
  }
}