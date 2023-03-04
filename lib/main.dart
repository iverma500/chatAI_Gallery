import 'package:flutter/material.dart';
import 'pages/chatPage.dart';

void main() => runApp(const MyApp());

class MyApp extends StatefulWidget{
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MiAppState();
}

class _MiAppState extends State<MyApp> {

  @override
  Widget build(BuildContext context) {
    String title = "Gallery + AI Chat app";
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Inicio(title: title,), //widget custom
    ); //patrón de diseño
  }
}

class Inicio extends StatefulWidget{
  const Inicio({Key? key,required this.title}) : super(key: key);
  final String title;
  @override
  _InicioState createState() => _InicioState();
}

class _InicioState extends State<Inicio> {

  int actualPage = 0;

  List<Widget> pages = [
    const chatPage(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: pages[actualPage],
      bottomNavigationBar: BottomNavigationBar(
        onTap: (index){
          setState(() {
            actualPage = index;
          });
        },
        currentIndex: actualPage,
        items: const [
          BottomNavigationBarItem(icon: Icon(Icons.chat), label: "Chat AI"),
        ],
      ),
    );
  }
}