import 'package:flutter/material.dart';
import 'package:shopapp/widgets/itemWidget.dart';
import 'package:shopapp/models/catalog.dart';

class GridTileWidget extends StatelessWidget {
  GridTileWidget({required this.item});
  final Item item;
  @override
  Widget build(BuildContext context) {
    return Card(
      clipBehavior: Clip.antiAlias,
      elevation: 1,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(15),
      ),
      child: GridTile(
        // footer: Column(
        //   children: [
        //     Text(
        //       item.name.toString(),
        //       textScaleFactor: 1.2,
        //       style: TextStyle(
        //         color: Colors.black,
        //       ),
        //     ),
        //     Text(
        //       item.desc.toString(),
        //       style: TextStyle(
        //         color: Colors.black45,
        //       ),
        //     ),
        //   ],
        // ),
        child: Image.network(
          item.image.toString(),
        ),
      ),
    );
  }
}
