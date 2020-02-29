import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class Auther extends StatefulWidget {
  @override
  _AutherState createState() => _AutherState();
}

class _AutherState extends State<Auther> {
// Field

// Method

  Widget showLogo() {
    return Container(
      height: 120.0,
      width: 120.0,
      child: Image.asset('images/logo.png'),
    );
  }

  Widget showAppName() {
    return Text(
      'Air4tor',
      style: GoogleFonts.lacquer(textStyle: TextStyle(
        color: Colors.orange.shade500,
        fontStyle: FontStyle.italic,
        fontWeight: FontWeight.bold,
        fontSize: 30.0,
      )),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: <Widget>[
            showLogo(),
            showAppName(),
            showAppName(),
          ],
        ),
      ),
    );
  }
}
