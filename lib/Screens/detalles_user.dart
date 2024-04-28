import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_seminario/Screens/home_page.dart';
import 'package:http/http.dart' as http;
import 'package:get/get.dart';
import 'package:dio/dio.dart' ;


class UserDetailsPage extends StatelessWidget {
  final dynamic user;

  const UserDetailsPage({Key? key, required this.user}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('User Details'),
      ),
      body: Padding(
        padding: EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text('First Name: ${user['first_name']}'),
            Text('Last Name: ${user['last_name']}'),
            Text('Gender: ${user['gender']}'),
            Text('Email: ${user['email']}'),
            Text('Phone Number: ${user['phone_number']}'),
            Text('Rol: ${user['rol']}'),
            Text('Birth Date: ${user['birth_date']}'),
            // Add more user details here as needed
          ],
        ),
      ),
    );
  }
}