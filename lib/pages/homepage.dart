import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:shopapp/core/store.dart';
import 'package:shopapp/models/cart.dart';
import 'package:shopapp/models/catalog.dart';
import 'package:shopapp/utils/routefile.dart';
import 'package:velocity_x/velocity_x.dart';
import 'dart:convert';
import 'homeWidgets.dart';
import 'package:http/http.dart' as http;

class HomePage extends StatefulWidget {
  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final String homepage = "/";
  //final url = "https://api.jsonbin.io/b/604dbddb683e7e079c4eefd3";
  @override
  initState() {
    super.initState();
    localData();
  }

  localData() async {
    await Future.delayed(Duration(seconds: 2));
    var catalogJson = await rootBundle.loadString("files/catalog.json");
    //final response = await http.get(Uri.parse(url));

    // var catalogJson = response.body;
    //print(response.statusCode);
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
    final _cart = (VxState.store as MyStore).cart;
    return Scaffold(
      floatingActionButton: VxConsumer(
          mutations: {AddMutation, RemoveMutation},
          builder: (context, _, status) {
            return FloatingActionButton(
              backgroundColor: context.theme.buttonColor,
              onPressed: () {
                Navigator.pushNamed(context, MyRoute.CartPage);
              },
              child: Icon(
                Icons.shopping_cart,
                color: Colors.white,
              ),
            ).badge(color: Vx.red500, size: 20, count: _cart?.items.length);
          }),
      backgroundColor: context.canvasColor,
      body: SafeArea(
        child: Container(
          padding: Vx.m32,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            //mainAxisAlignment: MainAxisAlignment.center,
            children: [
              CatalogHeader().pOnly(bottom: 30),
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
