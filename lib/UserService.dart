import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:flutter_seminario/lib/models/user.dart';

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
      } else {
        print('Error al crear usuario - Código de estado: ${response.statusCode}');
      }
    } catch (e) {
      print('Error al crear usuario: $e');
    }
  }
}
