import 'package:air4tor/utility/my_style.dart';
import 'package:air4tor/widget/register.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class Auther extends StatefulWidget {
  @override
  _AutherState createState() => _AutherState();
}

class _AutherState extends State<Auther> {
// Field

///////////////////////////////////// Method

  Widget newRegisterButton() {
    return FlatButton(
      child: Text(
        'New Register',
        style:
            TextStyle(color: Mystyle().darkColor, fontStyle: FontStyle.italic),
      ),
      onPressed: () {
        print('You Click Register');

        MaterialPageRoute route =
            MaterialPageRoute(builder: (BuildContext context) {
          return Register();
        });
        Navigator.of(context).push(route);
      },
    );
  }

  Widget loginButton() {
    return Container(
      width: 250.0,
      child: RaisedButton(
        color: Mystyle().darkColor,
        child: Text(
          'login',
          style: TextStyle(color: Colors.white),
        ),
        onPressed: () {},
      ),
    );
  }

  Widget userForm() {
    return Container(
      width: 250.0,
      child: TextField(
        decoration: InputDecoration(
          enabledBorder: UnderlineInputBorder(
              borderSide: BorderSide(color: Mystyle().darkColor)),
          hintStyle: TextStyle(color: Mystyle().darkColor),
          hintText: 'User :',
        ),
      ),
    );
  }

  Widget passForm() {
    return Container(
      width: 250.0,
      child: TextField(
        decoration: InputDecoration(
          enabledBorder: UnderlineInputBorder(
              borderSide: BorderSide(color: Mystyle().darkColor)),
          hintStyle: TextStyle(color: Mystyle().darkColor),
          hintText: 'Password :',
        ),
      ),
    );
  }

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
      style: GoogleFonts.lacquer(
          textStyle: TextStyle(
        color: Mystyle().darkColor,
        fontStyle: FontStyle.italic,
        fontWeight: FontWeight.bold,
        fontSize: 30.0,
      )),
    );
  }

//////////////////////////////////////////////////////////////////
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          gradient: RadialGradient(
            colors: <Color>[Colors.white, Mystyle().primaryColor],
            radius: 0.9,
          ),
        ),
        child: Center(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: <Widget>[
              showLogo(),
              showAppName(),
              userForm(),
              passForm(),
              loginButton(),
              newRegisterButton(),
            ],
          ),
        ),
      ),
    );
  }
}
