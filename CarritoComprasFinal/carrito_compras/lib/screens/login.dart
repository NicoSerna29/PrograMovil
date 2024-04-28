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
                      vertical: 150.0),
                  child: Text(
                    "TIENDA POKEMON",
                    textAlign:
                        TextAlign.center,
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
                      color: Colors.black,
                    ),
                    SizedBox(height: 20),
                    Container(
                      width: 120,
                      height: 120,
                      decoration: BoxDecoration(
                          color: Colors.white,
                          border: Border.all(
                            color: Colors.black, 
                            width: 15.0,
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
                    SizedBox(height: MediaQuery.of(context).size.height / 2),
                    Container(
                      child: ElevatedButton(
                        onPressed: () {
                          GoRouter.of(context).go('/catalog');
                        },
                        style: ElevatedButton.styleFrom(
                          backgroundColor:
                              Colors.red,
                          minimumSize:Size(20.0, 20.0),
                        ),
                        child: Text(
                          "Acceder",
                          textAlign: TextAlign.center,
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
