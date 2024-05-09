
//------------ Ejercicio 1 -----------------------------


//import 'package:flutter/material.dart';

//void main() {
//  runApp(MyApp());
//}

//class MyApp extends StatelessWidget {
//  @override
//  Widget build(BuildContext context) {
//    return MaterialApp(
//      home: Page1(),
//    );
//  }
//}

//class Page1 extends StatelessWidget {
//  @override
//  Widget build(BuildContext context) {
//    return Scaffold(
//      appBar: AppBar(
//        title: Text('Page 1'),
//      ),
//      body: Center(
//        child: ElevatedButton(
//          onPressed: () {
//            Navigator.push(
//              context,
//              MaterialPageRoute(builder: (context) => Page2(title: 'Page 2')),
//            );
//          },
//          child: Text('Ir a la página 2'),
//        ),
//      ),
//    );
//  }
//}

//class Page2 extends StatelessWidget {
//  final String title;

//  Page2({required this.title});

//  @override
//  Widget build(BuildContext context) {
//    return Scaffold(
//      appBar: AppBar(
//        title: Text(title),
//      ),
//      body: Center(
//        child: ElevatedButton(
//          onPressed: () {
//            Navigator.pop(context);
//          },
//          child: Text('Volver a la página 1'),
//        ),
//      ),
//    );
//  }
//}




//------------ Ejercicio 2 -----------------------------

//import 'package:flutter/material.dart';

//void main() {
//  runApp(MyApp());
//}

//class MyApp extends StatelessWidget {
//  @override
//  Widget build(BuildContext context) {
//    return MaterialApp(
//      initialRoute: '/',
//      routes: {
//        '/': (context) => Page1(),
//        '/page2': (context) => Page2(title: 'Page 2'),
//      },
//    );
//  }
//}

//class Page1 extends StatelessWidget {
//  @override
//  Widget build(BuildContext context) {
//    return Scaffold(
//      appBar: AppBar(
//        title: Text('Page 1'),
//      ),
//      body: Center(
//        child: ElevatedButton(
//          onPressed: () {
//            Navigator.pushNamed(context, '/page2'); // Utiliza Navigator.pushNamed
//          },
//          child: Text('Ir a la pagina 2'),
//        ),
//      ),
//    );
//  }
//}

//class Page2 extends StatelessWidget {
//  final String title;

//  Page2({required this.title});

//  @override
//  Widget build(BuildContext context) {
//    return Scaffold(
//      appBar: AppBar(
//        title: Text(title),
//      ),
//      body: Center(
//        child: ElevatedButton(
//          onPressed: () {
//            Navigator.pop(context);
//          },
//          child: Text('Volver a la pagina 1'),
//        ),
//      ),
//    );
//  }
//}

//------------ Ejercicio 3 -----------------------------


//main.dart
import 'package:flutter/material.dart';
import 'routes.dart';

void main() {
  runApp(MyApp());
}

class Page1 extends StatefulWidget {
  @override
  _Page1State createState() => _Page1State();
}

class _Page1State extends State<Page1> {
  final TextEditingController _textEditingController = TextEditingController();
  String _inputText = '';

  @override
  void dispose() {
    _textEditingController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Page 1')),
      body: Container(
        color: Color.fromARGB(255, 243, 222, 184),
        padding: EdgeInsets.all(20),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            TextField(
              controller: _textEditingController,
              decoration: InputDecoration(
                hintText: 'Enter your text',
              ),
              onChanged: (value) {
                setState(() {
                  _inputText = value;
                });
              },
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                Navigator.pushNamed(
                  context,
                  page2Route,
                  arguments: _inputText, // Pasamos el texto como argumento
                );
              },
              child: Text('Go to Page 2'),
            ),
          ],
        ),
      ),
    );
  }
}

class Page2 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final String textFromPage1 = ModalRoute.of(context)!.settings.arguments as String;

    return Scaffold(
      appBar: AppBar(title: Text('Page 2')),
      body: Container(
        color: Color.fromARGB(255, 105, 130, 177),
        padding: EdgeInsets.all(20),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                'Text from Page 1:',
                style: TextStyle(fontSize: 20),
              ),
              SizedBox(height: 10),
              Text(
                textFromPage1,
                style: TextStyle(fontSize: 16),
              ),
              SizedBox(height: 20),
              ElevatedButton(
                onPressed: () {
                  Navigator.pop(context);
                },
                child: Text('Go back to Page 1'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      initialRoute: page1Route,
      routes: {
        page1Route: (context) => Page1(),
        page2Route: (context) => Page2(),
      },
    );
  }
}
