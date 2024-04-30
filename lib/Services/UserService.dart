import 'dart:convert';
import 'package:flutter_seminario/Models/PlaceModel.dart';
import 'package:flutter_seminario/Screens/home_users.dart';
import 'package:flutter_seminario/Models/UserModel.dart';
import 'package:dio/dio.dart'; // Usa un prefijo 'Dio' para importar la clase Response desde Dio
import 'package:get_storage/get_storage.dart';


class UserService {
  final String baseUrl = "http://127.0.0.1:3000"; // URL de tu backend
  final Dio dio = Dio(); // Usa el prefijo 'Dio' para referenciar la clase Dio

var statusCode;
var data;
var token;
//Función createUser
Future<int> createUser(User newUser)async{
    print('createUser');
        print('try');
        //Aquí llamamos a la función request
        print('request');
        // Utilizar Dio para enviar la solicitud POST a http://127.0.0.1:3000/users
        Response response = await dio.post('$baseUrl/users', data: newUser.toJson());
        //En response guardamos lo que recibimos como respuesta
        //Printeamos los datos recibidos

        data = response.data.toString();
        
        print('Data: $data');
        //Printeamos el status code recibido por el backend

        statusCode = response.statusCode;
        print('Status code: $statusCode');

        if (statusCode == 201) {
      // Si el usuario se crea correctamente, retornamos el código 201
          print('201');
          return 201;
        } else if (statusCode == 400) {
          // Si hay campos faltantes, retornamos el código 400
                print('400');

          return 400;
        } else if (statusCode == 500) {
          // Si hay un error interno del servidor, retornamos el código 500
                print('500');

          return 500;
        } else {
          // Otro caso no manejado
                print('-1');

          return -1;
        }
 
    }


   Future<List<Place>> getData() async {
  print('getData');
  var res = await dio.get('$baseUrl/place');
  List<dynamic> responseData = res.data; // Obtener los datos de la respuesta
  
  // Convertir los datos en una lista de objetos Place
  List<Place> places = responseData.map((data) => Place.fromJson(data)).toList();
  
  return places; // Devolver la lista de lugares
}

  }



