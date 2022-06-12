import 'package:flutter/material.dart';
import 'package:velocity_x/velocity_x.dart';
import 'package:shopapp/models/catalog.dart';
import 'package:shopapp/widgets/themes.dart';
import 'homeWidgets.dart';

class DetailPage extends StatelessWidget {
  DetailPage({this.catalog});
  final Item? catalog;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: Container(
        color: Colors.white,
        child: ButtonBar(
          alignment: MainAxisAlignment.spaceBetween,
          children: [
            "\$ ${catalog!.price!.toString()}".text.xl4.red800.bold.make(),
            ElevatedButton(
                    style: ButtonStyle(
                      shape: MaterialStateProperty.all(StadiumBorder()),
                    ),
                    onPressed: () {},
                    child: "Buy".text.xl2.make())
                .pOnly(right: 8)
                .h(50)
                .w(100),
          ],
        ).p(32),
      ),
      appBar: AppBar(),
      body: SafeArea(
        child: Container(
          //  padding: Vx.m24,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Hero(
                      tag: 'imageAnimation',
                      child: Image.network(catalog!.image.toString()).p8())
                  .h40(context),
              Expanded(
                flex: 1,
                child: VxArc(
                  edge: VxEdge.TOP,
                  arcType: VxArcType.CONVEY,
                  height: 30.0,
                  child: Container(
                    width: double.infinity,
                    color: Colors.white,
                    child: Column(
                      children: [
                        catalog!.name!.text.xl4
                            .color(MyTheme.darkBlusish)
                            .bold
                            .make(),
                        catalog!.desc!.text.black.xl2
                            .textStyle(context.captionStyle)
                            .make(),
                        10.heightBox,
                      ],
                    ).py(64),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
