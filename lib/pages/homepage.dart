import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:shopapp/utils/routefile.dart';
import 'package:shopapp/widgets/drawer.dart';
import 'package:shopapp/models/catalog.dart';
import 'package:shopapp/widgets/itemWidget.dart';
import 'package:shopapp/widgets/gridTile.dart';
import 'dart:convert';

class HomePage extends StatefulWidget {
  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final String homepage = "/";
  @override
  initState() {
    super.initState();
    localData();
  }

  localData() async {
    await Future.delayed(Duration(seconds: 2));
    var catalogJson = await rootBundle.loadString("files/catalog.json");
    print(catalogJson);
    var decodedData = jsonDecode(catalogJson);
    var productData = decodedData["products"];
    setState(() {
      CatalogModel.products = List.from(productData)
          .map<Item>((item) => Item.fromMap(item))
          .toList();
    });
  }

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
        child:
            (CatalogModel.products != null && CatalogModel.products.isNotEmpty)
                ? GridView.builder(
                    itemCount: CatalogModel.products.length,
                    gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisSpacing: 5,
                        mainAxisSpacing: 16,
                        crossAxisCount: 2),
                    itemBuilder: (context, index) {
                      return GridTileWidget(item: CatalogModel.products[index]);
                    },
                  )
                : Center(
                    child: CircularProgressIndicator(),
                  ),
      )),
    );
  }
}
