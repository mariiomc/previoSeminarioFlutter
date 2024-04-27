import 'package:flutter/material.dart';
import 'package:flutter_seminario/Screens/register_screen.dart';
import 'package:flutter_seminario/Resources/pallete.dart';

class SignInButton extends StatelessWidget {
  final RegisterScreenController controller;
  const SignInButton({Key? key, required this.controller}) : super(key: key);

  @override 
  Widget build(BuildContext context){
    return ElevatedButton(
      onPressed: controller.signUp,
      style: ElevatedButton.styleFrom(
        fixedSize: const Size(400, 55),
        backgroundColor: Pallete.salmonColor,
        foregroundColor: Colors.white,
      ),
      child: const Text('Crear usuario', style: TextStyle(
        fontWeight: FontWeight.w600,
        fontSize: 17,
      ),),
    );
  }
}