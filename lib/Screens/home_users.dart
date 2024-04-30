// ignore_for_file: use_key_in_widget_constructors, prefer_const_constructors

import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_seminario/Models/PlaceModel.dart';
import 'package:flutter_seminario/Screens/home_page.dart';
import 'package:flutter_seminario/Screens/detalles_user.dart';
import 'package:flutter_seminario/Widgets/post.dart';
import 'package:http/http.dart' as http;
import 'package:get/get.dart';
import 'package:dio/dio.dart' ;
import 'package:flutter_seminario/Services/UserService.dart';

late UserService userService;


class UserListPage extends StatefulWidget {
    UserListPage({Key? key}) : super(key: key);

  @override
  _UserListPage createState() => _UserListPage();
}

class _UserListPage extends State<UserListPage> {
  late List<Place> lista_users;

  bool isLoading = true; // Nuevo estado para indicar si se están cargando los datos

  @override
  void initState() {
    super.initState();
    userService = UserService();
    getData();
  }

  void getData() async {
    try {
      lista_users = await userService.getData();
      setState(() {
        isLoading = false; // Cambiar el estado de carga cuando los datos están disponibles
      });
    } catch (error) {
      Get.snackbar(
        'Error',
        'No se han podido obtener los datos.',
        snackPosition: SnackPosition.BOTTOM,
      );
      print('Error al comunicarse con el backend: $error');
    }
  }

  @override
  Widget build(BuildContext context) {
    if (isLoading) {
      // Muestra un indicador de carga mientras se cargan los datos
      return Center(child: CircularProgressIndicator());
    } else {
      // Muestra la lista de usuarios cuando los datos están disponibles
      return Scaffold(
        appBar: AppBar(
          title: Center(child: Text('Places List')),
          elevation: 0,
          leading: Builder(
            builder: (context) => IconButton(
              icon: Icon(
                Icons.turn_left,
                color: Colors.black,
              ),
              onPressed: () {
                Get.to(HomePage());
              },
            ),
          ),
        ),
        body: ListView.builder(
          itemBuilder: (BuildContext context, int index) {
            return Card(
              child:
                PostWidget(place: lista_users[index]),
            );
          },
          itemCount: lista_users.length,
        ),
      );
    }
  }
}

  
