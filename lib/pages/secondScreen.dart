import 'package:flutter/material.dart';

class SecondScreen extends StatelessWidget {
  const SecondScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: Drawer(),
      appBar: AppBar(
        title: Text('APP Screen 2', style: TextStyle(color: Colors.white)),
      ),
      body: Container(
        //color: Colors.red,
        child: Center(
          child: Text(
            'hello',
            style: TextStyle(color: Colors.blueAccent),
          ),
        ),
      ),
    );
  }
}
