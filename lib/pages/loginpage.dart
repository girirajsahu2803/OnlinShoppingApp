import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_fonts/google_fonts.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          SizedBox(
            height: 20,
          ),
          Center(
            child: Text(
              'LOGIN PAGE',
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
                padding: const EdgeInsets.all(8.0),
                child: TextFormField(
                  decoration: InputDecoration(
                    // labelText: 'UserName',
                    hintText: 'Enter UserName',
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: TextFormField(
                  obscureText: true,
                  decoration: InputDecoration(
                    // labelText: 'UserPassword',
                    hintText: 'Enter Password',
                  ),
                ),
              ),
              SizedBox(
                height: 20,
              ),
              ElevatedButton(
                style: ButtonStyle(
                    // foregroundColor: MaterialStateProperty<Color>(),
                    ),
                onPressed: () {},
                child: Text(
                  ' LOGIN ',
                  style: GoogleFonts.lato(color: Colors.white),
                ),
              )
            ],
          ),
        ],
      ),
    );
  }
}
