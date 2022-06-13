import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:shopapp/models/catalog.dart';
import 'package:shopapp/utils/routefile.dart';
import 'package:velocity_x/velocity_x.dart';
import 'dart:convert';
import 'homeWidgets.dart';

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
      floatingActionButton: FloatingActionButton(
        backgroundColor: context.theme.buttonColor,
        onPressed: () {
          Navigator.pushNamed(context, MyRoute.CartPage);
        },
        child: Icon(
          Icons.shopping_cart,
          color: Colors.white,
        ),
      ),
      backgroundColor: context.canvasColor,
      body: SafeArea(
        child: Container(
          padding: Vx.m32,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            //mainAxisAlignment: MainAxisAlignment.center,
            children: [
              CatalogHeader(),
              if (CatalogModel.products != null &&
                  CatalogModel.products.isNotEmpty)
                CatalogList()
              else
                CircularProgressIndicator().expand().centered(),
            ],
          ),
        ),
      ),
    );
  }
}
