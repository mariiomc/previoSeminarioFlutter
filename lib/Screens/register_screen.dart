import 'package:flutter/material.dart';
import 'package:flutter_seminario/Widgets/button_sign_in.dart';
import 'package:flutter_seminario/Widgets/paramTextBox.dart';
import 'package:flutter_seminario/Services/UserService.dart';
import 'package:flutter_seminario/Resources/pallete.dart';
import 'package:get/get.dart';

late UserService userService;

class RegisterScreen extends StatefulWidget {
  RegisterScreen({Key? key}) : super(key: key);

  @override
  _RegisterScreen createState() => _RegisterScreen();
}

class _RegisterScreen extends State<RegisterScreen> {
  final RegisterScreenController controller = Get.put(RegisterScreenController());

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
              const Text('Crear usuario', style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 50,
                ),
              ),
              const SizedBox(height: 40),
              ParamTextBox(controller: controller.nombreController, text: 'Nombre'),
              const SizedBox(height: 15),
              ParamTextBox(controller: controller.apellidoController, text: 'Apellido'),
              const SizedBox(height: 15),
              ParamTextBox(controller: controller.generoController, text: 'Genero'),
              const SizedBox(height: 15),
              ParamTextBox(controller: controller.rolController, text: 'Rol'),
              const SizedBox(height: 15),
              ParamTextBox(controller: controller.contrasenaController, text: 'Contraseña'),
              const SizedBox(height: 15),
              ParamTextBox(controller: controller.mailController, text: 'e-mail'),
              Visibility(
                visible: controller.invalid,
                child: const Text(
                  'Invalid',
                  style: TextStyle(color: Pallete.salmonColor, fontSize: 15),
                ),
              ),
              const SizedBox(height: 15),
              ParamTextBox(controller: controller.telController, text: 'Telefono'),
              const SizedBox(height: 15),
              ParamTextBox(controller: controller.cumpleController, text: 'Cupleaños'),
              const SizedBox(height: 40),
              //Sección de introducir parámetros
              //ParamsSection(),
              //Sección de botón de enviar
              SignInButton(controller: controller),
            ],
          ),
        )
      ),
    );
  }
}

class RegisterScreenController extends GetxController {
  final TextEditingController nombreController = TextEditingController();
  final TextEditingController apellidoController = TextEditingController();
  final TextEditingController generoController = TextEditingController();
  final TextEditingController rolController = TextEditingController();
  final TextEditingController contrasenaController = TextEditingController();
  final TextEditingController mailController = TextEditingController();
  final TextEditingController telController = TextEditingController();
  final TextEditingController cumpleController = TextEditingController();

  bool invalid = false;

  void signUp() {
    if(nombreController.text.isEmpty || nombreController.text.isEmpty || nombreController.text.isEmpty || nombreController.text.isEmpty || nombreController.text.isEmpty || 
    nombreController.text.isEmpty || nombreController.text.isEmpty || nombreController.text.isEmpty){
      Get.snackbar(
        'Error', 
        'Campos vacios',
        snackPosition: SnackPosition.BOTTOM,
      );
    }
    else{
      if(GetUtils.isEmail(mailController.text)==true){
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
        }).catchError((error) {
          // Manejar errores de solicitud HTTP
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



