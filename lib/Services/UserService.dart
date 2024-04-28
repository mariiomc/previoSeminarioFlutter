import 'dart:convert';
import 'package:dio/dio.dart';

class UserService {
  final String baseUrl = "http://127.0.0.1:3000"; // URL de tu backend
  final dio = Dio();

//Función createUser
Future<void> createUser(User newUser)async{
    print('createUser');
    try{
      print('try');
      
      //Aquí llamamos a la función request
       await request(newUser);
     
    }
    catch(e){
      print('Error al crear usuario: $e');
    }
  }

//Función request (manda la petición al backend)
  Future<void> request(User newUser) async {
    try {
      print('request');
      // Utilizar Dio para enviar la solicitud POST a http://127.0.0.1:3000/users
      Response response = await dio.post('$baseUrl/users', data: newUser.toJson());
      //En response guardamos lo que recibimos como respuesta
      //Printeamos los datos recibidos
      print(response.data.toString());
      //Printeamos el status code recibido por el backend
      print(response.statusCode);
    } catch (e) {
      print('Error en la solicitud: $e');
    }
  }
}

class User {
  final String first_name;
  final String last_name;
  final String gender;
  final String role;
  final String password;
  final String email;
  final String phone_number;
  final String birth_date;

  User({
    required this.first_name,
    required this.last_name,
    required this.gender,
    required this.role,
    required this.password,
    required this.email,
    required this.phone_number,
    required this.birth_date,
  });

  Map<String, dynamic> toJson() {
    return {
      'first_name': first_name,
      'last_name': last_name,
      'gender': gender,
      'role': role,
      'password': password,
      'email': email,
      'phone_number': phone_number,
      'birth_date': birth_date,
    };
  }
}

