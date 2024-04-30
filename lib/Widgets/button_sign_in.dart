import 'package:flutter/material.dart';
import 'package:flutter_seminario/Resources/pallete.dart';

class SignInButton extends StatelessWidget {
  final String text; 
  final VoidCallback onPressed;
  const SignInButton({Key? key, required this.onPressed, required this.text}) : super(key: key);

  @override 
  Widget build(BuildContext context){
    return ElevatedButton(
      onPressed: onPressed,
      style: ElevatedButton.styleFrom(
        fixedSize: const Size(400, 55),
        backgroundColor: Pallete.salmonColor,
        foregroundColor: Colors.white,
      ),
      child: Text(text, style: const TextStyle(
        fontWeight: FontWeight.w600,
        fontSize: 17,
      ),),
    );
  }
}