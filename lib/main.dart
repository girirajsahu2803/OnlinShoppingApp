import 'package:flutter/material.dart';
import 'package:shopapp/core/store.dart';
import 'package:shopapp/pages/DetailPageScreen.dart';
import 'package:shopapp/pages/cartPage.dart';
import 'package:shopapp/pages/homepage.dart';
import 'package:shopapp/pages/secondScreen.dart';
import 'package:shopapp/pages/loginpage.dart';
import 'package:shopapp/utils/routefile.dart';
import 'package:shopapp/widgets/themes.dart';
import 'package:velocity_x/velocity_x.dart';

void main() {
  runApp(VxState(store: MyStore(), child: const MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      themeMode: ThemeMode.system,
      initialRoute: MyRoute.homePage,
      theme: MyTheme.lightThemeData,
      darkTheme: MyTheme.darkThemeData,
      routes: {
        MyRoute.homePage: (context) => HomePage(),
        '/2': (context) => SecondScreen(),
        MyRoute.loginPage: (context) => LoginPage(),
        MyRoute.detailPage: (context) => DetailPage(),
        MyRoute.CartPage: (context) => CartPage(),
      },
    );
  }
}
