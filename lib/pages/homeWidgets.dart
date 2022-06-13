import 'package:flutter/material.dart';
import 'package:shopapp/core/store.dart';
import 'package:shopapp/models/cart.dart';
import 'package:shopapp/pages/DetailPageScreen.dart';
import 'package:velocity_x/velocity_x.dart';
import 'package:shopapp/models/catalog.dart';

class CatalogHeader extends StatelessWidget {
  const CatalogHeader({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        "Catalog App".text.color(context.theme.accentColor).xl5.bold.make(),
        "Trending Products".text.color(context.theme.accentColor).xl2.make(),
      ],
    );
  }
}

class CatalogItem extends StatelessWidget {
  CatalogItem({required this.catalog});
  final Item? catalog;
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () async {
        //await Future.delayed(Duration(seconds: 2));
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) {
              return DetailPage(catalog: catalog);
            },
          ),
        );
      },
      child: VxBox(
        child: Row(
          children: [
            Hero(
              tag: 'imageAnimation',
              child: CatalogImage(
                catalog: catalog!.image.toString(),
              ),
            ),
            Expanded(
                child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                catalog!.name!.text.xl
                    .color(context.theme.accentColor)
                    .bold
                    .make(),
                catalog!.desc!.text
                    .color(context.theme.accentColor)
                    .textStyle(context.captionStyle)
                    .make(),
                10.heightBox,
                ButtonBar(
                  alignment: MainAxisAlignment.spaceBetween,
                  children: [
                    "Rs. ${catalog!.price!.toString()}".text.bold.make(),
                    AddToCartButton(catalogitem: catalog).pOnly(right: 8),
                  ],
                ),
              ],
            ))
          ],
        ),
      ).square(150).roundedSM.color(context.theme.cardColor).make().py(5),
    );
  }
}

class AddToCartButton extends StatelessWidget {
  AddToCartButton({this.catalogitem});
  Item? catalogitem;
  @override
  Widget build(BuildContext context) {
    VxState.watch(context, on: [AddMutation]);
    final CartModel? _cart = (VxState.store as MyStore).cart;
    bool isInCart = _cart?.items.contains(catalogitem) ?? false;
    return ElevatedButton(
        style: ButtonStyle(
          shape: MaterialStateProperty.all(StadiumBorder()),
        ),
        onPressed: () {
          AddMutation(item: catalogitem);
        },
        child: (isInCart) ? Icon(Icons.done) : "Cart".text.make());
  }
}

class CatalogList extends StatelessWidget {
  // CatalogList({required this.catalogModel});
  // final CatalogModel? catalogModel;
  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: ListView.builder(
          scrollDirection: Axis.vertical,
          shrinkWrap: true,
          itemCount: CatalogModel.products.length,
          itemBuilder: (context, index) {
            return CatalogItem(
              catalog: CatalogModel.products[index],
            );
          }),
    );
  }
}

class CatalogImage extends StatelessWidget {
  CatalogImage({required this.catalog});
  final String catalog;
  @override
  Widget build(BuildContext context) {
    return Image.network(
      catalog,
      //color: Colors.black,
      fit: BoxFit.contain,
    )
        .box
        .clip(Clip.antiAlias)
        .roundedLg
        .color(context.cardColor)
        .make()
        .p8()
        .w40(context);
  }
}
