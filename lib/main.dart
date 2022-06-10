import 'package:flutter/material.dart';
import 'package:shopapp/pages/homepage.dart';
import 'package:shopapp/pages/secondScreen.dart';
import 'package:shopapp/pages/loginpage.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      initialRoute: '/',
      theme: ThemeData(primarySwatch: Colors.purple),
      routes: {
        '/': (context) => HomePage(),
        '/2': (context) => SecondScreen(),
        '/logIn': (context) => LoginPage(),
      },
    );
  }
}
