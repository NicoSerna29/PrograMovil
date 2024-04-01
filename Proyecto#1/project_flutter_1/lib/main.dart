import 'package:flutter/material.dart';

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
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.green),
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
                //encabezado del drawer
                decoration: BoxDecoration(color: Colors.green),
                child: Column(
                  children: [
                    Text(
                      'I am a big tittle',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 26.0,
                        fontWeight: FontWeight.w900,
                      ),
                    ),
                    Text(
                      'I am a medium subtittle',
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: 16.0,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                    Text(
                      'I am a normal text',
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: 12.0,
                      ),
                    ),
                  ],
                ),
              ),
            ),
            ListTile(title: const Text('Option #1'), onTap: () {}),
            ListTile(title: const Text('Option #2'), onTap: () {}),
            ListTile(title: const Text('Option #3'), onTap: () {}),
            ListTile(title: const Text('Option #4'), onTap: () {}),
          ],
        ),
      ),
      appBar: AppBar(
        title: Text(widget.title),
        centerTitle: true, // Esto centra el título en la barra de navegación
        backgroundColor: Color.fromARGB(255, 6, 239, 49),
        // Puedes agregar más personalización aquí, como acciones, etc.
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(height: 30), // Espacio desde la parte superior
            Center(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                mainAxisSize: MainAxisSize.min,
                children: [
                  Container(
                    height: 30,
                    width: 120,
                    color: Colors.yellow,
                    margin: EdgeInsets.symmetric(horizontal: 10.0),
                  ),
                  SizedBox(width: 30), // Espacio común entre los contenedores
                  Container(
                    height: 30,
                    width: 120,
                    color: Colors.blue,
                    margin: EdgeInsets.symmetric(horizontal: 10.0),
                  ),
                  SizedBox(width: 30), // Espacio común entre los contenedores
                  Container(
                    height: 30,
                    width: 120,
                    color: Colors.red,
                    margin: EdgeInsets.symmetric(horizontal: 10.0),
                  ),
                ],
              ),
            ),

            TextSection(
              description:
                  'Amet tempor aliquip consectetur duis anim cillum ipsum reprehenderit esse culpa. Do amet est cillum nulla laborum anim incididunt ut aliqua ut aliqua minim tempor. Cillum culpa labore eiusmod eu nisi aliquip non Lorem. Ullamco est mollit laborum do sint labore. Occaecat consectetur sit laborum nisi quis dolore deserunt mollit ea pariatur qui irure incididunt dolore. Deserunt aute sunt irure aute ipsum mollit minim consectetur eu commodo aliquip amet. Commodo enim Lorem enim ex consectetur incididunt.',
            ),
            //ButtonSection(),
            //ButtonsSection(),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Column(
                  children: [
                    ButtonWithText(
                      color: Colors.black,
                      icon: Icons.alarm,
                    ),
                    TextButton(
                      onPressed: () {},
                      style: ElevatedButton.styleFrom(
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(5),
                        ),
                        foregroundColor: Color.fromARGB(255, 28, 207, 22),
                      ),
                      child: const Text('SELECT ALARM'),
                    ),
                  ],
                ),
                Column(
                  children: [
                    ButtonWithText(
                      color: Colors.black,
                      icon: Icons.key,
                    ),
                    ElevatedButton(
                      style: ElevatedButton.styleFrom(
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(5),
                          ),
                          foregroundColor: Color.fromARGB(255, 28, 207, 22),
                          backgroundColor: Color.fromARGB(255, 88, 247, 181)),
                      onPressed: () {},
                      child: const Text('SELECT KEY'),
                    ),
                  ],
                ),
                Column(
                  children: [
                    ButtonWithText(
                      color: Colors.black,
                      icon: Icons.camera,
                    ),
                    OutlinedButton(
                      onPressed: () {},
                      style: OutlinedButton.styleFrom(
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(5),
                        ),
                        foregroundColor: Color.fromARGB(255, 28, 207, 22),
                      ),
                      child: const Text('SELECT CAMERA'),
                    ),
                  ],
                ),
              ],
            ),
            Column(
              children: [
                SizedBox(height: 20),
                ListTile(title: const Text('Element #0')),
                ListTile(title: const Text('Element #1')),
                ListTile(title: const Text('Element #2')),
                ListTile(title: const Text('Element #3')),
              ],
            ),
            TextSection(
              description:
                  'Est do aliqua minim sunt velit velit ad aliquip est Lorem cillum ut ex veniam. Magna id ullamco est consequat. Dolore culpa ex proident ipsum eu. Ad proident ex pariatur anim quis. Deserunt quis labore consequat consequat aliqua culpa commodo fugiat fugiat pariatur velit. Consequat incididunt veniam laborum est cillum dolore ex culpa laboris in sunt culpa laborum. Et aute do in aliqua proident eu.',
            ),
            Container(
              padding: EdgeInsets.all(50),
              child: Text(
                "FIN DE LA APLICACION",
                style: TextStyle(
                  fontSize: 30,
                  color: Color.fromARGB(255, 28, 207, 22),
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
