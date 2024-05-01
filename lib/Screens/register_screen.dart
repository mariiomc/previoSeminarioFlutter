import 'package:flutter/material.dart';
import 'package:flutter_seminario/Models/UserModel.dart';
import 'package:flutter_seminario/Screens/home_page.dart';
import 'package:flutter_seminario/Screens/home_users.dart';
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
              
              const SizedBox(height: 15),
              ParamTextBox(controller: controller.nombreController, text: 'Nombre'),
              const SizedBox(height: 15),
              ParamTextBox(controller: controller.apellidoController, text: 'Apellido'),
              const SizedBox(height: 15),
              ParamTextBox(controller: controller.generoController, text: 'Género'),
              const SizedBox(height: 15),
              ParamTextBox(controller: controller.rolController, text: 'Rol'),
              const SizedBox(height: 15),
              ParamTextBox(controller: controller.contrasenaController, text: 'Contraseña'),
              const SizedBox(height: 15),
              ParamTextBox(controller: controller.mailController, text: 'E-Mail'),
              Visibility(
                visible: controller.invalid,
                child: const Text(
                  'Invalid',
                  style: TextStyle(color: Pallete.salmonColor, fontSize: 15),
                ),
              ),
              const SizedBox(height: 15),
              ParamTextBox(controller: controller.telController, text: 'Teléfono'),
              const SizedBox(height: 15),
              ParamTextBox(controller: controller.cumpleController, text: 'Cumpleaños'),
              const SizedBox(height: 40),
              ElevatedButton(
                onPressed: () => controller.selectDate(context),
                child: Text('Seleccionar Fecha de Nacimiento'),
              ),
              const SizedBox(height: 15),
              // Mostrar la fecha seleccionada
              const SizedBox(height: 15),
              SignInButton(onPressed: () => controller.signUp(), text: 'Register'),
              const SizedBox(height: 40),
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
  bool parameters = false;

Future<void> selectDate(BuildContext context) async {
    final DateTime? pickedDate = await showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime(1900),
      lastDate: DateTime.now(),
    );
    if (pickedDate != null) {
      cumpleController.text = pickedDate.toString(); // Actualizar el controlador de texto con la fecha seleccionada
    }
  }


  void signUp() {
    if(nombreController.text.isEmpty || apellidoController.text.isEmpty || generoController.text.isEmpty || rolController.text.isEmpty || contrasenaController.text.isEmpty || 
    mailController.text.isEmpty || telController.text.isEmpty || cumpleController.text.isEmpty){
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
        userService.createUser(newUser).then((statusCode) {
          // La solicitud se completó exitosamente, puedes realizar acciones adicionales si es necesario
          print('Usuario creado exitosamente');
          Get.snackbar(
            '¡Usuario Creado!', 
            'Usuario creado correctamente',
            snackPosition: SnackPosition.BOTTOM,
          );
          Get.to(() => HomePage());
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



