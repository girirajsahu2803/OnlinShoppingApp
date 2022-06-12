import 'package:flutter/material.dart';

class CatalogModel {
  static List<Item> products = [
    //   Item(
    //       id: 1,
    //       name: "iPhone 12 Pro",
    //       desc: "Apple iPhone 12th generation",
    //       price: 999,
    //       color: "#33505a",
    //       image:
    //           "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRISJ6msIu4AU9_M9ZnJVQVFmfuhfyJjEtbUm3ZK11_8IV9TV25-1uM5wHjiFNwKy99w0mR5Hk&usqp=CAc")
    //
  ];
  static List<Item> Catalogproducts = [];

  ///get ITEM BY ID
  Item? getByID(int id) {
    products.firstWhere((element) {
      return element.id == id;
    });
  }

  ///get ITEM BY POSITION
  Item getByPosition(int pos) {
    return products[pos];
  }
}

class Item {
  Item(
      {required this.id,
      required this.name,
      required this.desc,
      required this.price,
      required this.color,
      required this.image});
  factory Item.fromMap(Map<String, dynamic> mp) {
    return Item(
        id: mp["id"],
        name: mp["name"],
        price: mp["price"],
        color: mp["color"],
        desc: mp["desc"],
        image: mp["image"]);
  }
  toMap() => {
        "id": id,
        "name": name,
        "color": color,
        "price": price,
        "desc": desc,
        "image": image
      };
  final int? id;
  final String? name;
  final String? desc;
  final int? price;
  final String? color;
  final String? image;
}
