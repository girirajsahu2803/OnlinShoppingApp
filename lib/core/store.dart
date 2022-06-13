import 'package:shopapp/models/cart.dart';
import 'package:velocity_x/velocity_x.dart';
import 'package:flutter/material.dart';

import 'package:shopapp/models/catalog.dart';

import 'package:shopapp/pages/cartPage.dart';

class MyStore extends VxStore {
  CartModel? cart;
  CatalogModel? catalog;
  MyStore() {
    catalog = CatalogModel();
    cart = CartModel();
    cart?.catalog = catalog;
  }
}
