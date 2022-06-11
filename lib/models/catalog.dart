import 'package:flutter/material.dart';

class Item {
  Item({this.id, this.name, this.desc, this.price, this.color, this.image});
  final String? id;
  final String? name;
  final String? desc;
  final int? price;
  final String? color;
  final String? image;
}

final products = [
  Item(
      id: "Codepur001",
      name: "iPhone 12 Pro",
      desc: "Apple iPhone 12th generation",
      price: 999,
      color: "#33505a",
      image:
          "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRISJ6msIu4AU9_M9ZnJVQVFmfuhfyJjEtbUm3ZK11_8IV9TV25-1uM5wHjiFNwKy99w0mR5Hk&usqp=CAc")
];
