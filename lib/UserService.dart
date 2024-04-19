import 'dart:convert';
import 'package:http/http.dart' as http;

class UserService {
  final String baseUrl = "http://127.0.0.1:3000"; // URL de tu backend

  Future<void> createUser(User newUser) async {
    final url = Uri.parse('$baseUrl/users'); // URL para crear un nuevo usuario

    try {
      final response = await http.post(
        url,
        headers: <String, String>{
          'Content-Type': 'application/json; charset=UTF-8',
        },
        body: jsonEncode(newUser.toJson()), // Convertir el objeto User a JSON
      );

      if (response.statusCode == 201) {
        print('Usuario creado exitosamente');
      } else if (response.statusCode == 500) {
        print('Error al crear usuario - Código de estado: ${response.statusCode} - Cambiar email o phone' );
      }
      else{
         print('Error al crear usuario - Código de estado: ${response.statusCode}');
      }
    } catch (e) {
      print('Error al crear usuario: $e');

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

