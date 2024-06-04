import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:proyecto_final/paginas/pagCentral.dart';

class Login extends StatelessWidget {
  static const String Route = '/';
  final nameCrtl= TextEditingController();
  final contraCrtl = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Container(
        padding: EdgeInsets.all(20),
        child: Column(
          children: [
            Form(
              child: Column(
                children: <Widget>[
                  TextFormField(
                    controller: nameCrtl,
                    maxLines: 1,
                    validator: (value) {
                      if (value?.isEmpty ?? true) {
                        return "Data f";
                      }
                      return null;
                    },
                    decoration: InputDecoration(
                        labelText: "Ingrese su nombre de usuario",
                        border: OutlineInputBorder(
                            borderRadius:
                                BorderRadius.all(Radius.circular(10)))),
                  ),
                  SizedBox(
                    height: 15,
                  ),
                  TextFormField(
                    controller: contraCrtl,
                    maxLines: 1,
                    validator: (value) {
                      if (value?.isEmpty ?? true) {
                        return "Data f";
                      }
                      return null;
                    },
                    decoration: InputDecoration(
                        labelText: "Ingrese su contraseña de usuario",
                        border: OutlineInputBorder(
                            borderRadius:
                                BorderRadius.all(Radius.circular(10)))),
                  ),
                  SizedBox(
                    height: 15,
                  ),
                  ElevatedButton(
                    child: Text("Registrar"),
                    onPressed: () async {
                    },
                  ),
                  ElevatedButton(
                    child: Text("Ingresar"),
                    onPressed: () async {
                    },
                  )
                ],
              ),
            )
          ],
        ));
  }
}
