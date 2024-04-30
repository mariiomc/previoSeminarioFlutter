import 'package:flutter/material.dart';
import 'package:flutter_seminario/Models/UserModel.dart';
<<<<<<< HEAD
import 'package:flutter_seminario/Screens/home_page.dart';
import 'package:flutter_seminario/Screens/home_users.dart';
import 'package:flutter_seminario/Screens/register_screen.dart';
=======
import 'package:flutter_seminario/Screens/home_users.dart';
>>>>>>> fb235762ccdfa3b401c09dacb4e284433893c810
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
<<<<<<< HEAD
  final Controller controller = Get.put(Controller());
=======
  final LoginScreenController controller = Get.put(LoginScreenController());
>>>>>>> fb235762ccdfa3b401c09dacb4e284433893c810

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
<<<<<<< HEAD
              const Text('Log in', style: TextStyle(
=======
              const Text('Iniciar sesion', style: TextStyle(
>>>>>>> fb235762ccdfa3b401c09dacb4e284433893c810
                  fontWeight: FontWeight.bold,
                  fontSize: 50,
                ),
              ),
              const SizedBox(height: 40),
<<<<<<< HEAD
              const SizedBox(height: 15),
              ParamTextBox(controller: controller.mailController, text: 'E-Mail'),
              const SizedBox(height: 15),
              ParamTextBox(controller: controller.contrasenaController, text: 'Contraseña'),
              const SizedBox(height: 40),
              SignInButton(onPressed: () => controller.logIn(), text: 'Log in'),
              const SizedBox(height: 15),
              SignInButton(onPressed: () => Get.to(RegisterScreen()), text: 'Register'),
=======
              
              const SizedBox(height: 15),
              ParamTextBox(controller: controller.emailController, text: 'Email:'),
              const SizedBox(height: 15),
              ParamTextBox(controller: controller.passwordController, text: 'Password:'),
              
              
              
              //Sección de botón de enviar
              SignInButton(controller: controller),
>>>>>>> fb235762ccdfa3b401c09dacb4e284433893c810
            ],
          ),
        )
      ),
    );
  }
}

<<<<<<< HEAD
class Controller extends GetxController {
  final TextEditingController contrasenaController = TextEditingController();
  final TextEditingController mailController = TextEditingController();
=======
class LoginScreenController extends GetxController {
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  
>>>>>>> fb235762ccdfa3b401c09dacb4e284433893c810

  bool invalid = false;
  bool parameters = false;

<<<<<<< HEAD
  void logIn() {
    if(contrasenaController.text.isEmpty || mailController.text.isEmpty){
=======



  void signIn() {
    if(emailController.text.isEmpty || passwordController.text.isEmpty){
>>>>>>> fb235762ccdfa3b401c09dacb4e284433893c810
      Get.snackbar(
        'Error', 
        'Campos vacios',
        snackPosition: SnackPosition.BOTTOM,
      );
    }
    else{
<<<<<<< HEAD
      if(GetUtils.isEmail(mailController.text)==true){
        final logIn = (
          email: mailController.text,
          password: contrasenaController.text,
        );
        userService.logIn(logIn).then((statusCode) {
          // La solicitud se completó exitosamente, puedes realizar acciones adicionales si es necesario
          print('Usuario creado exitosamente');
          Get.to(() => HomePage());
=======
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
>>>>>>> fb235762ccdfa3b401c09dacb4e284433893c810
        }).catchError((error) {
          // Manejar errores de solicitud HTTP
          Get.snackbar(
            'Error', 
<<<<<<< HEAD
            'Este E-Mail ya está en uso actualmente.',
            snackPosition: SnackPosition.BOTTOM,
          );
          print('Error al enviar log in al backend: $error');
=======
            'Este E-Mail o Teléfono ya están en uso actualmente.',
            snackPosition: SnackPosition.BOTTOM,
          );
          print('Error al enviar usuario al backend: $error');
>>>>>>> fb235762ccdfa3b401c09dacb4e284433893c810
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



