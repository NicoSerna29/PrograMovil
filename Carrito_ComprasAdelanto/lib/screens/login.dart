// Copyright 2020 The Flutter team. All rights reserved.
// Use of this source code is governed by a BSD-style license that can be
// found in the LICENSE file.

import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class MyLogin extends StatelessWidget {
  const MyLogin({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Container(
          child: Stack(
            children: [
              Container(
                width: double.infinity,
                height: MediaQuery.of(context).size.height * 0.5,
                decoration: BoxDecoration(
                  color: const Color.fromARGB(255, 255, 17, 0),
                ),
                child: Padding(
                  padding: EdgeInsets.symmetric(
                      vertical: 150.0), // Padding vertical de 20.0
                  child: Text(
                    "TIENDA POKEMON",
                    textAlign:
                        TextAlign.center, // Alineación horizontal al centro
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 40.0,
                      fontWeight: FontWeight.bold,
                      letterSpacing: 8.5,
                    ),
                  ),
                ),
              ),
              Center(
                child: Stack(
                  alignment: Alignment.center,
                  children: [
                    Container(
                      width: double.infinity,
                      height: 50,
                      color: Colors.black, // Color del primer contenedor
                    ),
                    SizedBox(height: 20), // Espacio entre contenedores
                    Container(
                      width: 120,
                      height: 120,
                      decoration: BoxDecoration(
                          color: Colors.white,
                          border: Border.all(
                            color: Colors.black, // Color del borde
                            width: 15.0, // Ancho del borde
                          ),
                          borderRadius: BorderRadius.circular(70.0)),
                    ),
                  ],
                ),
              ),
              Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    // Esto empujará el contenedor hacia la mitad de la pantalla
                    SizedBox(height: MediaQuery.of(context).size.height / 2),
                    Container(
                      child: ElevatedButton(
                        onPressed: () {
                          GoRouter.of(context).go('/catalog');
                        },
                        style: ElevatedButton.styleFrom(
                          backgroundColor:
                              Colors.red, // Color de fondo del botón
                          minimumSize:
                              Size(20.0, 20.0), // Tamaño mínimo del botón
                        ),
                        child: Text(
                          "Acceder",
                          textAlign: TextAlign
                              .center, // Alineación horizontal al centro
                          style: TextStyle(
                            color: Colors.black,
                            fontSize: 20.0,
                            fontWeight: FontWeight.bold,
                            letterSpacing: 2.5,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
