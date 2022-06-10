import 'package:flutter/material.dart';
import 'package:shopapp/utils/routefile.dart';
import 'package:shopapp/widgets/drawer.dart';

class HomePage extends StatelessWidget {
  final String homepage = "/";
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: MyDrawer(),
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
