import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'PROYECTO#1 PROGRAWEB',
      theme: ThemeData(
        useMaterial3: true, //parte fundamental diseño
      ),
      home: const MyHomePage(title: 'Practice for Test'),
      //busqué como cambiar el color del titulo a color blanco pero todo me daba error
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});
  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: Drawer(
        child: Column(
          children: [
            SizedBox(
              width: double.infinity,
              child: DrawerHeader(
                decoration: BoxDecoration(color: Colors.blue),
                //encabezado del drawer
                child: Column(
                  children: [
                    Text(
                      'Small tittle',
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: 10.0,
                      ),
                    ),
                    Text(
                      'Medium Tittle',
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: 13.0,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                    Text(
                      'Big Tittle',
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: 23.0,
                        fontWeight: FontWeight.w900,
                      ),
                    ),
                  ],
                ),
              ),
            ),
            ListTile(title: const Text('Option #1'), onTap: () {}),
            ListTile(title: const Text('Option #2'), onTap: () {}),
            ListTile(title: const Text('Option #3'), onTap: () {}),
          ],
        ),
      ),
      appBar: AppBar(
        title: Text(widget.title),
        centerTitle: true, // Esto centra el título en la barra de navegación
        // Puedes agregar más personalización aquí, como acciones, etc.
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(height: 10), // Espacio desde la parte superior
            Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                mainAxisSize: MainAxisSize.min,
                children: [
                  Container(
                    height: 30,
                    width: 500,
                    color: Colors.yellow,
                    margin: EdgeInsets.symmetric(horizontal: 10.0),
                  ),
                  SizedBox(width: 30), // Espacio común entre los contenedores
                  Container(
                    height: 30,
                    width: 300,
                    color: Colors.blue,
                    margin: EdgeInsets.symmetric(horizontal: 10.0),
                  ),
                  SizedBox(width: 30), // Espacio común entre los contenedores
                  Container(
                    height: 30,
                    width: 500,
                    color: Colors.red,
                    margin: EdgeInsets.symmetric(horizontal: 10.0),
                  ),
                ],
              ),
            ),
            Container(
              width: 480,
              child: TextSection(
                description:
                    'Amet tempor aliquip consectetur duis anim cillum ipsum reprehenderit esse culpa. Do amet est cillum nulla laborum anim incididunt ut aliqua ut aliqua minim tempor. Cillum culpa labore eiusmod eu nisi aliquip non Lorem. Ullamco est mollit laborum do sint labore. Occaecat consectetur sit laborum nisi quis dolore deserunt mollit ea pariatur qui irure incididunt dolore. Deserunt aute sunt irure aute ipsum mollit minim consectetur eu commodo aliquip amet. Commodo enim Lorem enim ex consectetur incididunt.',
              ),
            ),
            Center(
              child: Container(
                width: 300.0,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    ElevatedButton(
                      style: ElevatedButton.styleFrom(
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(5),
                          ),
                          backgroundColor: Color.fromARGB(255, 43, 207, 17)),
                      onPressed: () {},
                      child: ButtonWithText(
                        color: Colors.black,
                        icon: Icons.android,
                      ),
                    ),
                    ElevatedButton(
                      style: ElevatedButton.styleFrom(
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(5),
                          ),
                          backgroundColor: Color.fromARGB(255, 13, 16, 210)),
                      onPressed: () {},
                      child: ButtonWithText(
                        color: Colors.black,
                        icon: Icons.apple,
                      ),
                    ),
                  ],
                ),
              ),
            ),
            Container(
              width: 150.0,
              child: TextSection(
                  description:
                      'Ad quis magna minim laborum aute. Amet esse ut exercitation culpa sint aliqua. Laborum aliquip anim reprehenderit elit reprehenderit irure elit consequat aliquip et ullamco cupidatat minim cupidatat. Officia amet consequat est est ipsum laborum pariatur tempor. Ea laboris ut Lorem veniam.'),
            ),
            Container(
              padding: EdgeInsets.all(50),
              child: Text(
                "end of aplication",
                style: TextStyle(
                  fontSize: 30,
                  color: Colors.black,
                  fontWeight: FontWeight.w100,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class TextSection extends StatelessWidget {
  final String description;
  const TextSection({required this.description});
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(18.0),
      child: Text(description),
    );
  }
}

class ButtonWithText extends StatelessWidget {
  const ButtonWithText({
    super.key,
    required this.color,
    required this.icon,
  });

  final Color color;
  final IconData icon;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Icon(icon, color: color),
        Padding(
          padding: const EdgeInsets.only(top: 8),
        ),
      ],
    );
  }
}
