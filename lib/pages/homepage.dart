import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: Drawer(),
      appBar: AppBar(
        title: Text('APP', style: TextStyle(color: Colors.white)),
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
