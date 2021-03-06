import 'package:air4tor/utility/my_style.dart';
import 'package:air4tor/utility/normal_dialog.dart';
import 'package:air4tor/widget/my_service.dart';
import 'package:air4tor/widget/register.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class Auther extends StatefulWidget {
  @override
  _AutherState createState() => _AutherState();
}

class _AutherState extends State<Auther> {
// Field

  String user = '', password = '';

//// Method
  ///
  @override
  void initState() {
    super.initState();
    checkState(); //ตรวจสอบการ login ค้างที่ firebase
  }

  Future<void> checkState() async {
    FirebaseAuth firebaseAuth = FirebaseAuth.instance;
    FirebaseUser firebaseUser = await firebaseAuth.currentUser();
    if (firebaseUser != null) {
      MaterialPageRoute route =
          MaterialPageRoute(builder: (BuildContext buildContext) {
        return MyService();
      });
      Navigator.of(context).pushAndRemoveUntil(route, (route) => false);
    }
  }

  Widget newRegisterButton() {
    return FlatButton(
      child: Text(
        'New Register',
        style:
            TextStyle(color: Mystyle().darkColor, fontStyle: FontStyle.italic),
      ),
      onPressed: () {
        print('You Click Register'); // โชว์ดูว่ามีการคลิกจริงไหม

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
        onPressed: () {
          checkAuthen();
        },
      ),
    );
  }

  Future<void> checkAuthen() async {
    FirebaseAuth auth = FirebaseAuth.instance;
    await auth
        .signInWithEmailAndPassword(email: user, password: password)
        .then((response) {
          checkState();
        })
        .catchError((response) {
      String title = response.code;
      String message = response.message;
      normalDialog(context, title, message);
    });
  }

  Widget userForm() {
    return Container(
      width: 250.0,
      child: TextField(
        keyboardType: TextInputType.emailAddress,
        onChanged: (value) {
          user = value.trim();
        },
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
        obscureText: true,
        onChanged: (value) {
          password = value.trim();
        },
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
            radius: 1.1,
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
