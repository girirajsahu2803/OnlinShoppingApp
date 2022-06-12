import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:shopapp/utils/routefile.dart';
import 'package:shopapp/widgets/drawer.dart';
import 'package:shopapp/models/catalog.dart';
import 'package:shopapp/widgets/itemWidget.dart';
import 'package:shopapp/widgets/gridTile.dart';
import 'package:shopapp/widgets/themes.dart';
import 'package:velocity_x/velocity_x.dart';
import 'dart:convert';

class HomePage extends StatefulWidget {
  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final String homepage = "/";
  @override
  initState() {
    super.initState();
    localData();
  }

  localData() async {
    await Future.delayed(Duration(seconds: 2));
    var catalogJson = await rootBundle.loadString("files/catalog.json");
    print(catalogJson);
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
    return Scaffold(
      backgroundColor: MyTheme.creamColor,
      body: SafeArea(
        child: Container(
          padding: Vx.m32,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              CatalogHeader(),
              if (CatalogModel.products != null &&
                  CatalogModel.products.isNotEmpty)
                CatalogList()
              else
                Center(child: CircularProgressIndicator()),
            ],
          ),
        ),
      ),
    );
  }
}

class CatalogHeader extends StatelessWidget {
  const CatalogHeader({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        "Catalog App".text.color(MyTheme.darkBlusish).xl5.bold.make(),
        "Trending Products".text.color(MyTheme.darkBlusish).xl2.make(),
      ],
    );
  }
}

class CatalogItem extends StatelessWidget {
  CatalogItem({required this.catalog});
  final Item? catalog;
  @override
  Widget build(BuildContext context) {
    return VxBox(
      child: Row(
        children: [
          CatalogImage(
            catalog: catalog!.image.toString(),
          ),
          Expanded(
              child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              catalog!.name!.text.xl.color(MyTheme.darkBlusish).bold.make(),
              catalog!.desc!.text.black.textStyle(context.captionStyle).make(),
              10.heightBox,
              ButtonBar(
                alignment: MainAxisAlignment.spaceBetween,
                children: [
                  "\$${catalog!.price!.toString()}".text.bold.make(),
                  ElevatedButton(
                          style: ButtonStyle(
                            shape: MaterialStateProperty.all(StadiumBorder()),
                          ),
                          onPressed: () {},
                          child: "Buy".text.make())
                      .pOnly(right: 8),
                ],
              ),
            ],
          ))
        ],
      ),
    ).square(150).roundedSM.white.make().py(5);
  }
}

class CatalogList extends StatelessWidget {
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
      fit: BoxFit.contain,
    )
        .box
        .rounded
        .clip(Clip.antiAlias)
        .p8
        .color(MyTheme.creamColor)
        .make()
        .p8()
        .w40(context);
  }
}
