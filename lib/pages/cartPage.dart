import 'package:flutter/material.dart';
import 'package:shopapp/models/cart.dart';
import 'package:velocity_x/velocity_x.dart';
import 'package:shopapp/core/store.dart';

class CartPage extends StatelessWidget {
  const CartPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: ButtonBar(
        alignment: MainAxisAlignment.spaceBetween,
        children: [
          CartTotal(),
        ],
      ),
      backgroundColor: context.canvasColor,
      appBar: AppBar(
        title: "Cart".text.color(context.accentColor).xl2.make(),
        backgroundColor: Colors.transparent,
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          CardList(),
          Divider(),
        ],
      ).scrollVertical(),
    );
  }
}

class CardList extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    VxState.watch(context, on: [RemoveMutation]);
    final CartModel? _cart = (VxState.store as MyStore).cart;
    return ListView.builder(
        shrinkWrap: true,
        itemCount: _cart?.items.length,
        scrollDirection: Axis.vertical,
        itemBuilder: (context, index) {
          return ListTile(
            leading: Icon(Icons.done),
            title:
                //cart.items[index]?.name?
                _cart?.items[index]?.name?.text
                        .color(context.accentColor)
                        .make() ??
                    "product".text.make(),
            trailing: IconButton(
              icon: Icon(Icons.remove_circle_outline),
              onPressed: () {
                RemoveMutation(item: _cart?.items[index]);
              },
            ),
          );
        });
  }
}

class CartTotal extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final CartModel? _cart = (VxState.store as MyStore).cart;
    return SizedBox(
      height: 150,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        //crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          //${cart?.getTotalPrice()}
          VxConsumer(
              builder: (context, _, status) {
                return "\$ ${_cart?.totalPrice()}".text.xl4.make();
              },
              mutations: {AddMutation, RemoveMutation}).px(10),
          30.widthBox,
          ElevatedButton(
                  onPressed: () {
                    ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(content: "Buying Not Supported".text.make()));
                  },
                  child: "Buy".text.xl3.white.make().px(30).py(10))
              .p(5),
        ],
      ),
    ).px(10);
  }
}
