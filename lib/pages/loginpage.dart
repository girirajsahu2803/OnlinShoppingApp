import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:velocity_x/velocity_x.dart';
import 'homepage.dart';
import 'package:shopapp/utils/routefile.dart';

class LoginPage extends StatefulWidget {
  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  // LoginPage({Key? key}) : super(key: key);
  final String loginPage = '/login';
  TextEditingController UserName = TextEditingController();
  TextEditingController Welcome = TextEditingController();
  final GlobalKey<FormState> _formkey = GlobalKey<FormState>();

  func() {
    final form = _formkey.currentState!;
    if (form.validate())
      setState(() {
        Navigator.pushNamed(context, MyRoute.homePage);
      });
  }

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
                //'WELCOME',
                Welcome.text = "WELCOME",
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
            Form(
              key: _formkey,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Padding(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 20, vertical: 10),
                    child: TextFormField(
                      validator: (value) {
                        if (value!.isEmpty) {
                          return "Username cannot be empty";
                        }
                        return null;
                      },
                      controller: UserName,
                      decoration: InputDecoration(
                        labelText: 'UserName',
                        hintText: 'Enter UserName',
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 20, vertical: 10),
                    child: TextFormField(
                      validator: (value) {
                        if (value!.isEmpty) {
                          return "Password cannot be empty";
                        }
                        if (value.length < 6) {
                          return "Password length should be 6 atleast";
                        }
                        return null;
                      },
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
                  InkWell(
                    onTap: () {
                      func();
                    },
                    child: Ink(
                      //duration: Duration(seconds: 1),
                      decoration: BoxDecoration(
                        color: Colors.deepPurple,
                        borderRadius: BorderRadius.circular(8),
                      ),
                      width: 150,
                      height: 50,
                      child: Center(
                        child: Text(
                          "LOGIN",
                          style: TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                            fontSize: 18,
                          ),
                        ),
                      ),
                    ),
                  )
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
