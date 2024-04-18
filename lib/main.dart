import 'package:flutter/material.dart';
import 'package:flutter_seminario/params.dart';
import 'package:flutter_seminario/title.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    const String appTitle = 'Seminario Flutter';
    return MaterialApp(
      title: appTitle,
      home: Scaffold(
        appBar: AppBar(
          title: const Text(appTitle),
        ),
        // #docregion addWidget
        body: const SingleChildScrollView(
          child: Column(
            children: [
              TitleSection(
                name: 'Añadir Usuario',
              ),
              //Sección de introducir parámetros
              ParamsSection(),
              //Sección de botón de enviar
            ],
          ),
        ),
        // #enddocregion addWidget
      ),
    );
  }
}

