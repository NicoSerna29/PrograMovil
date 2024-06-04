import 'package:clase_proyecto_final/BD/db.dart';
import 'package:clase_proyecto_final/modelos/pokemon.dart';
import 'package:clase_proyecto_final/paginas/pagCentral.dart';
import 'package:flutter/material.dart';

class addPokemon extends StatelessWidget {
  static const String RUTA = "/add";

  @override
  Widget build(BuildContext context) {
    final Pokemon pokemon = ModalRoute.of(context)!.settings.arguments as Pokemon;
    return Scaffold(
      appBar: AppBar(
        title: Text("Registro Pokemon"),
      ),
      body: Container(
        child: _FormAdd(pokemon: pokemon),
      ),
    );
  }
}
class _FormAdd extends StatelessWidget {
  final Pokemon pokemon;

  const _FormAdd({Key? key, required this.pokemon}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final GlobalKey<FormState> keyForm = GlobalKey<FormState>();
    final  nameControl = TextEditingController();
    final  pokedexControl = TextEditingController();
    final  spriteControl = TextEditingController();

    return Container(
      padding: EdgeInsets.all(20),
      child: Form(
        key: keyForm,
        child: Column(
          children: <Widget>[
            TextFormField(
              controller: nameControl,
              validator: (value) {
                if (value?.isEmpty ?? true) {
                  return "Coloque el nombre del Pokemon";
                }
                return null;
              },
              decoration: InputDecoration(
                labelText: "Nombre del Pokemon",
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(15),
                ),
              ),
            ),
            SizedBox(height: 20),
            TextFormField(
              controller: pokedexControl,
              validator: (value) {
                if (value?.isEmpty ?? true) {
                  return "Coloque el número Pokedex";
                }
                return null;
              },
              decoration: InputDecoration(
                labelText: "Num Pokedex",
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(15),
                ),
              ),
            ),
            SizedBox(height: 20),
            TextFormField(
              controller: spriteControl,
              validator: (value) {
                if (value?.isEmpty ?? true) {
                  return "Coloque el sprite del Pokemon";
                }
                return null;
              },
              decoration: InputDecoration(
                labelText: "Sprite del Pokemon",
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(15),
                ),
              ),
            ),
            TextButton(
              child: Text("REGISTRAR"),
              onPressed: () {
                if (keyForm.currentState?.validate() ?? false) {
                  DB.addPoke(
                    Pokemon(
                      nameP: nameControl.text,
                      idP: pokedexControl.text,
                      spriteP: spriteControl.text,
                    ),
                  );
                  print("pokemon: " + nameControl.text);
                  Navigator.pushNamed(context, PagCentral.RUTA);
                }
              },
            ),
          ],
        ),
      ),
    );
  }
}