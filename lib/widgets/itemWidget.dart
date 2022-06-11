import 'package:flutter/material.dart';
import 'package:shopapp/models/catalog.dart';

class ItemWidget extends StatelessWidget {
  ItemWidget({@required this.item});
  final Item? item;
  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 0.5,
      child: ListTile(
        title: Text(
          item!.name,
          textScaleFactor: 1.2,
          style: TextStyle(color: Colors.black),
        ),
        subtitle: Text(
          item!.desc,
          style: TextStyle(color: Colors.black45),
        ),
        trailing: Text(
          "Rs. " + item!.price.toString(),
          style: TextStyle(color: Colors.purple, fontWeight: FontWeight.w600),
        ),
        leading: Image.network(item!.image),
      ),
    );
  }
}
