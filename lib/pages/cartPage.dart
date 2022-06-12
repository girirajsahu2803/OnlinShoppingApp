import 'package:flutter/material.dart';
import 'package:shopapp/widgets/themes.dart';
import 'package:velocity_x/velocity_x.dart';

class CartPage extends StatelessWidget {
  const CartPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: context.canvasColor,
      appBar: AppBar(
        title: "Cart".text.color(context.accentColor).xl2.make(),
        backgroundColor: Colors.transparent,
      ),
      body: Column(
        children: [
          CardList(),
          Divider(),
          CartTotal(),
        ],
      ),
    );
  }
}

class CartTotal extends StatelessWidget {
  const CartTotal({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 150,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          "\$ 99999".text.xl4.make().px(10),
          30.widthBox,
          ElevatedButton(
                  onPressed: () {
                    ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(content: "Buying Not Supported".text.make()));
                  },
                  child: "Buy"
                      .text
                      .xl3
                      .color(context.accentColor)
                      .make()
                      .px(30)
                      .py(10))
              .p(5),
        ],
      ),
    ).px(10);
  }
}

class CardList extends StatelessWidget {
  const CardList({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: ListView.builder(
          shrinkWrap: true,
          itemCount: 5,
          scrollDirection: Axis.vertical,
          itemBuilder: (context, index) {
            return "item".text.make();
          }),
    );
  }
}
