import 'package:flutter/material.dart';

import 'package:shopapp/models/catalog.dart';

class CartModel {
  //catalog field
  CatalogModel _catalog = CatalogModel();

  //collection of IDS
  final List<int> _itemIDS = [];
  //get catalog
  CatalogModel get catalog => _catalog;

  //set catalog
  set catalog(CatalogModel? newCatalog) {
    _catalog = newCatalog!;
  }

  //get items in the cart
  List<Item> get items => _itemIDS.map((id) => _catalog.getByID(id)!).toList();

  //get total price
  int getTotalPrice() {
    int sum = 0;
    for (var k in items) {
      sum += k!.price!.toInt();
    }
    return sum;
  }

  void add(Item? item) {
    _itemIDS.add(item!.id!.toInt());
  }

  void remove(Item? item) {
    _itemIDS.remove(item!.id!.toInt());
  }
}
