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
      backgroundColor: context.canvasColor,
      bottomNavigationBar: Container(
        color: context.canvasColor, //Colors.white,
        child: ButtonBar(
          alignment: MainAxisAlignment.spaceBetween,
          children: [
            "\$ ${catalog!.price!.toString()}".text.xl4.red800.bold.make().p1(),
            ElevatedButton(
                    style: ButtonStyle(
                      backgroundColor: MaterialStateProperty.all(Colors.purple),
                      shape: MaterialStateProperty.all(StadiumBorder()),
                    ),
                    onPressed: () {},
                    child: "Cart".text.xl2.make())
                .pOnly(right: 8)
                .h(50)
                .w(100),
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
      appBar: AppBar(
        backgroundColor: Colors.transparent,
      ),
      body: SafeArea(
        child: Container(
          color: Colors.white,
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
                    color: context.canvasColor,
                    child: Column(
                      children: [
                        catalog!.name!.text.xl4
                            .color(context.accentColor)
                            .bold
                            .make(),
                        catalog!.desc!.text
                            .color(context.accentColor)
                            .xl2
                            .textStyle(context.captionStyle)
                            .make(),
                        10.heightBox,
                        "Lorem ipsum dolor sit amet, um dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum."
                            .text
                            .color(context.accentColor)
                            .make()
                            .p(20),
                      ],
                    ).py(64).scrollVertical(),
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
