import 'package:flutter/material.dart';
import 'package:shopapp/utils/routefile.dart';
import 'package:shopapp/widgets/drawer.dart';

class HomePage extends StatelessWidget {
  final String homepage = "/";
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawerEdgeDragWidth: 150,
      drawer: MyDrawer(),
      appBar: AppBar(
        title: const Text(
          ' Catalog App',
          style: TextStyle(color: Colors.black),
        ),
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
