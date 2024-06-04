import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:proyecto_final/paginas/pagCentral.dart';

class addPoke extends StatelessWidget {
  static const String Route = '/add';

  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Añadir Pokemon"),
      ),
      body: Container(
        child: FormAdd(),
      ),
    );
  }
}

class FormAdd extends StatelessWidget {
  final GlobalKey<FormState> keyg = GlobalKey<FormState>();
  final idCrtl = TextEditingController();
  final nameCrtl = TextEditingController();
  final imgCrtl = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Container(
        padding: EdgeInsets.all(20),
        child: Form(
          key: keyg,
          child: Column(
            children: <Widget>[
              TextFormField(
                controller: idCrtl,
                maxLines: 1,
                validator: (value) {
                  if (value?.isEmpty ?? true) {
                    return "Data f";
                  }
                  return null;
                },
                decoration: InputDecoration(
                    labelText: "ID Pokemon",
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(10)))),
              ),
              SizedBox(height: 15,),
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
                    labelText: "Nombre Pokemon",
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(10)))),
              ),
              SizedBox(height: 15,),
              TextFormField(
                controller: imgCrtl,
                maxLines: 1,
                validator: (value) {
                  if (value?.isEmpty ?? true) {
                    return "Data f";
                  }
                  return null;
                },
                decoration: InputDecoration(
                    labelText: "Sprite Pokemon",
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(10)))),
              ),
              ElevatedButton(
                child: Text("Registrar"),
                onPressed: () {
                  if (keyg.currentState?.validate() ?? false) {
                    Navigator.pushNamed(context, centralApp.Route);
                  }
                  ;
                },
              ),
            ],
          ),
        ));
  }
}
