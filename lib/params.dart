import 'package:flutter/material.dart';
import 'package:flutter_seminario/UserService.dart';
import 'package:email_validator/email_validator.dart';


class ParamsSection extends StatefulWidget {
  const ParamsSection({super.key});


  @override
  // ignore: library_private_types_in_public_api
  _ParamsSectionState createState() => _ParamsSectionState();
}

class _ParamsSectionState extends State<ParamsSection> {
  final TextEditingController _firstnameController = TextEditingController();
  final TextEditingController _lastnameController = TextEditingController();
  final TextEditingController _genderController = TextEditingController();
  final TextEditingController _roleController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _phoneController = TextEditingController();
  final TextEditingController _birthdayController = TextEditingController();



  String _enteredFirstName = '';
  String _enteredLastName = '';
  String _enteredGender ='';
  String _enteredRole = '';
  String _enteredPassword ='';
  String _enteredEmail = '';
  String _enteredPhone = '';
  String _enteredBirthday = '';
  bool _man = false;
  bool _women = false;
  bool _other = false;

  late UserService _userService;

  bool isValidEmail(String email) {
    if (!EmailValidator.validate(email)) {
      return false;
    }
    return true;
  }


  @override
  void initState(){
    super.initState();
    _userService = UserService();
  }

  @override
  void dispose() {
    _firstnameController.dispose();
    _lastnameController.dispose();
    _genderController.dispose();
    _roleController.dispose();
    _passwordController.dispose();
    _emailController.dispose();
    _phoneController.dispose();
    _birthdayController.dispose();
    super.dispose();
  }

  void _showEnteredParams() {
      
    //if(validateEmail(_enteredEmail) == null){
    setState(() {
      _enteredFirstName = _firstnameController.text;
      _enteredLastName = _lastnameController.text;
      _enteredGender = _genderController.text;
      _enteredRole = _roleController.text;
      _enteredPassword = _passwordController.text;
      _enteredEmail = _emailController.text;
      _enteredPhone = _phoneController.text;
      _enteredBirthday = _birthdayController.text;
    });
    
    if(isValidEmail(_enteredEmail)==true){
    User newUser = User(
    first_name: _firstnameController.text,
    last_name: _lastnameController.text,
    gender: _enteredGender, // Aquí usamos el campo de género seleccionado
    role: _roleController.text,
    password: _passwordController.text,
    email: _emailController.text,
    phone_number: _phoneController.text,
    birth_date: _enteredBirthday, // Aquí usamos la fecha de cumpleaños seleccionada
    );



    _userService.createUser(newUser).then((_) {
        // Éxito al enviar el usuario al backend, realizar acciones adicionales si es necesario
        print('Usuario creado exitosamente');
      }).catchError((error) {
        // Manejar errores de solicitud HTTP
        print('Error al enviar usuario al backend: $error');

      });
      }
      else{
        print('Introduce un email válido');
      }
    }

    @override
    Widget build(BuildContext context) {
      
      return Padding(
        padding: const EdgeInsets.all(16.0), 
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              'Ingrese los parámetros para crear un usuario:',
              style: TextStyle(fontSize: 16),
            ),
            TextField(
              controller: _firstnameController,
              decoration: const InputDecoration(
                hintText: 'First Name',
                border: OutlineInputBorder(),
              ),
            ),
            TextField(
              controller: _lastnameController,
              decoration: const InputDecoration(
                hintText: 'Last Name',
                border: OutlineInputBorder(),
              ),
            ),
            TextField(
              controller: _passwordController,
              decoration: const InputDecoration(
                hintText: 'Contraseña',
                border: OutlineInputBorder(),
              ),
            ),
              // const Text(
              //   'GENDER',
              //     style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
              // ),
              // Row(
              // children: [
              //   Checkbox(
              //   value: _man,
              //   onChanged: (bool? value) {
              //     setState(() {
              //       _man = value!;
              //       _enteredGender = 'man';
              //     });
              //   },
              // ),
              // const Text('Man'),
              // Checkbox(
              //   value: _women,
              //   onChanged: (bool? value) {
              //     setState(() {
              //       _women = value!;
              //       _enteredGender = 'woman';
              //     });
              //   },
              // ),
              // const Text('Women'),
              // Checkbox(
              //   value: _other,
              //   onChanged: (bool? value) {
              //     setState(() {
              //       _other = value!;
              //       _enteredGender = 'other';

              //     });
              //   },
              // ),
              // const Text('Other'),
              // ],
              TextField(
              controller: _genderController,
              decoration: const InputDecoration(
                hintText: 'Gender',
                border: OutlineInputBorder(),
              ),
            ),
            //),
            TextField(
              controller: _roleController,
              decoration: const InputDecoration(
                hintText: 'Role',
                border: OutlineInputBorder(),
              ),
            ),
            TextFormField(
              controller: _emailController,
              decoration: const InputDecoration(
                hintText: 'Email',
                border: OutlineInputBorder(),
              ),
            ),
            TextField(
              controller: _phoneController,
              decoration: const InputDecoration(
                hintText: 'Phone',
                border: OutlineInputBorder(),
              ),
            ),
            TextField(
              controller: _birthdayController,
              decoration: const InputDecoration(
                hintText: 'Birthday',
                border: OutlineInputBorder(),
              ),
            ),

            
            const SizedBox(height: 10),
            ElevatedButton(
              onPressed: _showEnteredParams,
              child: const Text('Mostrar parámetros'),
            ),
            const SizedBox(height: 20),
            const Text(
              'Parámetros introducidos: ',
              style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
            ),
            Text(
              'First Name: $_enteredFirstName',
              style: const TextStyle(fontSize: 15),
            ),
            Text(
              'Last Name: $_enteredLastName',
              style: const TextStyle(fontSize: 15),
            ),
            Text(
              'Gender: $_enteredGender',
              style: const TextStyle(fontSize: 15),
            ),
            Text(
              'Role: $_enteredRole',
              style: const TextStyle(fontSize: 15),
            ),
            Text(
              'Contraseña: $_enteredPassword',
              style: const TextStyle(fontSize: 15),
            ),
            Text(
              'Email: $_enteredEmail',
              style: const TextStyle(fontSize: 15),
            ),
            Text(
              'Phone: $_enteredPhone',
              style: const TextStyle(fontSize: 15),
            ),
            Text(
              'Birthday: $_enteredBirthday',
              style: const TextStyle(fontSize: 15),
            ),
          ],
        ),
      );
    }
  
}
