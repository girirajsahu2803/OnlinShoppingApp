import 'package:flutter/material.dart';
import 'package:shopapp/core/store.dart';

import 'package:shopapp/models/catalog.dart';
import 'package:velocity_x/velocity_x.dart';

class CartModel {
  //catalog field
  CatalogModel? _catalog;

  //collection of IDS
  final List<Item?> _itemIDS = [];
  //get catalog
  CatalogModel? get catalog => _catalog;

  //set catalog
  set catalog(CatalogModel? newCatalog) {
    _catalog = newCatalog!;
  }

  //get items in the cart
  List<Item?> get items => _itemIDS;
  // _itemIDS.map((id) {
  //   if (_catalog != null) return _catalog?.getByID(id);
  // }).toList();

  //get total price
  int totalPrice() {
    int sum = 0;
    print(items.length);
    for (var k in items) {
      print(k?.price);
    }
    for (var k in items) {
      sum += k?.price ?? 0;
    }
    return sum;
  }
  // =>
  //       items.fold(0, (total, current) => total + current?.price ??0 );

  void add(Item? item) {
    print("${item?.id} added");
    _itemIDS.add(item);
  }

  void remove(Item? item) {
    _itemIDS.remove(item);
    print("${item?.id} removed");
  }
}

class AddMutation extends VxMutation<MyStore> {
  final Item? item;
  AddMutation({this.item});
  @override
  perform() {
    store?.cart?._itemIDS.add(item);
  }
}

class RemoveMutation extends VxMutation<MyStore> {
  final Item? item;
  RemoveMutation({this.item});
  @override
  perform() {
    store?.cart?._itemIDS.remove(item);
  }
}
