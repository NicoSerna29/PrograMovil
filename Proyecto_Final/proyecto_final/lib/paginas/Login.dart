import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:proyecto_final/paginas/pagCentral.dart';

class Login extends StatelessWidget {
  static const String Route = '/';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        child: Row(
          children: [
            // Puedes agregar otros widgets aquí si es necesario
            Text("Some Text"),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.add),
        onPressed: () {
          Navigator.pushNamed(context, centralApp.Route);
        },
      ),
    );
  }
}