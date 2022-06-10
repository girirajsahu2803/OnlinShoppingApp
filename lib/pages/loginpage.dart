import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'homepage.dart';
import 'package:shopapp/utils/routefile.dart';

class LoginPage extends StatelessWidget {
  //const LoginPage({Key? key}) : super(key: key);
  final String loginPage = '/login';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        scrollDirection: Axis.vertical,
        padding: EdgeInsets.all(20),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            SizedBox(
              height: 100,
            ),
            Center(
              child: Text(
                'WELCOME',
                style: GoogleFonts.lato(
                  fontSize: 20,
                  fontWeight: FontWeight.w600,
                  color: Colors.blueAccent,
                ),
              ),
            ),
            Container(
              height: 300,
              width: 300,
              padding: const EdgeInsets.all(15.0),
              child: SvgPicture.asset(
                'images/login.svg',
                fit: BoxFit.contain,
              ),
            ),
            Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Padding(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                  child: TextFormField(
                    decoration: InputDecoration(
                      labelText: 'UserName',
                      hintText: 'Enter UserName',
                    ),
                  ),
                ),
                Padding(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                  child: TextFormField(
                    obscureText: true,
                    decoration: InputDecoration(
                      labelText: 'Password',
                      hintText: 'Enter Password',
                    ),
                  ),
                ),
                SizedBox(
                  height: 40,
                ),
                ElevatedButton(
                  style: TextButton.styleFrom(
                    minimumSize: Size(150, 40),

                    // foregroundColor: MaterialStateProperty<Color>(),
                  ),
                  onPressed: () {
                    Navigator.pushNamed(context, MyRoute.homePage);
                  },
                  child: Text(
                    ' LOGIN ',
                    style: GoogleFonts.lato(color: Colors.white),
                  ),
                )
              ],
            ),
          ],
        ),
      ),
    );
  }
}
