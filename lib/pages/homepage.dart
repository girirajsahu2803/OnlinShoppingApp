import 'package:flutter/material.dart';
import 'package:shopapp/utils/routefile.dart';
import 'package:shopapp/widgets/drawer.dart';
import 'package:shopapp/models/catalog.dart';
import 'package:shopapp/widgets/itemWidget.dart';

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
          child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: ListView.builder(
            itemCount: CatalogModel.products.length,
            itemBuilder: (context, index) {
              return ItemWidget(
                item: CatalogModel.products[index],
              );
            }),
      )),
    );
  }
}
