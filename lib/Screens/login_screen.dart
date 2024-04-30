import 'package:flutter/material.dart';
import 'package:flutter_seminario/Models/UserModel.dart';
import 'package:flutter_seminario/Screens/home_users.dart';
import 'package:flutter_seminario/Widgets/button_sign_in.dart';
import 'package:flutter_seminario/Widgets/paramTextBox.dart';
import 'package:flutter_seminario/Services/UserService.dart';
import 'package:flutter_seminario/Resources/pallete.dart';
import 'package:get/get.dart';

late UserService userService;

class LoginScreen extends StatefulWidget {
  LoginScreen({Key? key}) : super(key: key);

  @override
  _LoginScreen createState() => _LoginScreen();
}

class _LoginScreen extends State<LoginScreen> {
  final LoginScreenController controller = Get.put(LoginScreenController());

  @override
  void initState(){
    super.initState();
    userService = UserService();
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
              const Text('Iniciar sesion', style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 50,
                ),
              ),
              const SizedBox(height: 40),
              
              const SizedBox(height: 15),
              ParamTextBox(controller: controller.emailController, text: 'Email:'),
              const SizedBox(height: 15),
              ParamTextBox(controller: controller.passwordController, text: 'Password:'),
              
              
              
              //Sección de botón de enviar
              SignInButton(controller: controller),
            ],
          ),
        )
      ),
    );
  }
}

class LoginScreenController extends GetxController {
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  

  bool invalid = false;
  bool parameters = false;




  void signIn() {
    if(emailController.text.isEmpty || passwordController.text.isEmpty){
      Get.snackbar(
        'Error', 
        'Campos vacios',
        snackPosition: SnackPosition.BOTTOM,
      );
    }
    else{
      if(GetUtils.isEmail(emailController.text)==true){
        
        userService.logIn(emailController.text, passwordController.text).then((statusCode) {
              // La solicitud se completó exitosamente, puedes realizar acciones adicionales si es necesario
              print('Usuario creado exitosamente');
              Get.snackbar(
                '¡Usuario Creado!', 
                'Usuario creado correctamente',
                snackPosition: SnackPosition.BOTTOM,
              );
              Get.to(() => UserListPage());
        }).catchError((error) {
          // Manejar errores de solicitud HTTP
          Get.snackbar(
            'Error', 
            'Este E-Mail o Teléfono ya están en uso actualmente.',
            snackPosition: SnackPosition.BOTTOM,
          );
          print('Error al enviar usuario al backend: $error');
        });
      }
      else{
        Get.snackbar(
          'Error', 
          'e-mail no valido',
          snackPosition: SnackPosition.BOTTOM,
        );
      }
    }
  }
}



