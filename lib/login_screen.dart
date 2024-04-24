import 'package:flutter/material.dart';
import 'package:flutter_seminario/button_sign_in.dart';
import 'package:flutter_seminario/paramTextBox.dart';
import 'package:email_validator/email_validator.dart';
import 'package:flutter_seminario/UserService.dart';
import 'package:flutter_seminario/pallete.dart';

class LoginScreen extends StatefulWidget {
  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  // Create a text controller to retrieve the text from the custom text box.
  final TextEditingController nombreController = TextEditingController();
  final TextEditingController apellidoController = TextEditingController();
  final TextEditingController generoController = TextEditingController();
  final TextEditingController rolController = TextEditingController();
  final TextEditingController contrasenaController = TextEditingController();
  final TextEditingController mailController = TextEditingController();
  final TextEditingController telController = TextEditingController();
  final TextEditingController cumpleController = TextEditingController();
  late UserService userService;
  bool invalid = false;


  @override
    void initState(){
    super.initState();
    userService = UserService();
  }

  @override
  void dispose() {
    // Dispose of the controllers when the widget is removed from the widget tree.
    nombreController.dispose();
    apellidoController.dispose();
    generoController.dispose();
    rolController.dispose();
    contrasenaController.dispose();
    mailController.dispose();
    telController.dispose();
    cumpleController.dispose();
    super.dispose();
  }

  @override 
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('Seminario Flutter'),
        ),
        // #docregion addWidget
        body: SingleChildScrollView(
          child: Center(
            child: Column(
              children: [
                const SizedBox(height: 50),
                const Text('Crear usuario', style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 50,
                  ),
                ),
                const SizedBox(height: 40),
                ParamTextBox(controller: nombreController, text: 'Nombre'),
                const SizedBox(height: 15),
                ParamTextBox(controller: apellidoController, text: 'Apellido'),
                const SizedBox(height: 15),
                ParamTextBox(controller: generoController, text: 'Genero'),
                const SizedBox(height: 15),
                ParamTextBox(controller: rolController, text: 'Rol'),
                const SizedBox(height: 15),
                ParamTextBox(controller: contrasenaController, text: 'Contraseña'),
                const SizedBox(height: 15),
                ParamTextBox(controller: mailController, text: 'e-mail'),
                Visibility(
                  visible: invalid,
                  child: const Text(
                    'Invalid',
                    style: TextStyle(color: Pallete.salmonColor, fontSize: 15),
                  ),
                ),
                const SizedBox(height: 15),
                ParamTextBox(controller: telController, text: 'Telefono'),
                const SizedBox(height: 15),
                ParamTextBox(controller: cumpleController, text: 'Cupleaños'),
                const SizedBox(height: 40),
                //Sección de introducir parámetros
                //ParamsSection(),
                //Sección de botón de enviar
                SignInButton(onPressedCallback: onButtonPressed),
              ],
            ),
          )
        ),
    );
  }

  bool isValidEmail(String email) {
   if (!EmailValidator.validate(email)) {
    return false;
  }
    return true;
  }

  void onButtonPressed() {
    String mail = mailController.text;
    if(isValidEmail(mail)==true){

      User newUser = User(
      first_name: nombreController.text,
      last_name: apellidoController.text,
      gender: generoController.text,
      role: rolController.text,
      password: contrasenaController.text,
      email: mailController.text,
      phone_number: telController.text,
      birth_date: cumpleController.text,
      );

      userService.createUser(newUser).then((_) {
      // Éxito al enviar el usuario al backend, realizar acciones adicionales si es necesario
        print('Usuario creado exitosamente');
      }).catchError((error) {
      // Manejar errores de solicitud HTTP
      print('Error al enviar usuario al backend: $error');
      });
    }
    else{
      setState(() {
      invalid = true;
      });
    }
  }
}



