import 'package:air4tor/utility/my_style.dart';
import 'package:flutter/material.dart';

class Register extends StatefulWidget {
  @override
  _RegisterState createState() => _RegisterState();
}

class _RegisterState extends State<Register> {
  //Field

  // Method

  Widget nameForm() {
    Color color1 = Colors.orange.shade300;
    Color color2 = Colors.blue.shade300;
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        Container(
          width: 250.0,
          child: TextField(
            decoration: InputDecoration(
              enabledBorder:
                  UnderlineInputBorder(borderSide: BorderSide(color: color2)),
              helperStyle: TextStyle(color: color2),
              labelStyle: TextStyle(color: color1),
              icon: Icon(
                Icons.face,
                size: 36.0,
                color: color1,
              ),
              helperText: 'Type Your Name in the Blank', // อันนี้คือด้านล่าง
              labelText: 'Display Name :', // อันนี้คือด้านบน
            ),
          ),
        ),
      ],
    );
  }
////////////////////////////////////////

  Widget emailForm() {
    Color color1 = Colors.orange.shade300;
    Color color2 = Colors.blue.shade300;
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        Container(
          width: 250.0,
          child: TextField(
            keyboardType: TextInputType.emailAddress,
            decoration: InputDecoration(
              enabledBorder:
                  UnderlineInputBorder(borderSide: BorderSide(color: color2)),
              helperStyle: TextStyle(color: color2),
              labelStyle: TextStyle(color: color1),
              icon: Icon(
                Icons.home,
                size: 36.0,
                color: color1,
              ),
              helperText: 'Type Your Email in the Blank',
              labelText: 'Email :',
            ),
          ),
        ),
      ],
    );
  }

  /////////////////////////////

  Widget passForm() {
    Color color1 = Colors.orange.shade300;
    Color color2 = Colors.blue.shade300;
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        Container(
          width: 250.0,
          child: TextField(
            decoration: InputDecoration(
              enabledBorder:
                  UnderlineInputBorder(borderSide: BorderSide(color: color2)),
              helperStyle: TextStyle(color: color2),
              labelStyle: TextStyle(color: color1),
              icon: Icon(
                Icons.fingerprint,
                size: 36.0,
                color: color1,
              ),
              helperText: 'Type Your Password in the Blank',
              labelText: 'Password :',
            ),
          ),
        ),
      ],
    );
  }

  //////////////////////

  Widget registerButton() {
    // สร้างปุ่ม
    return Container(
      margin: EdgeInsets.only(top: 30.0), //ระยะห่างจากตัวข้างบน
      width: 250.0,
      child: OutlineButton(
        shape:
            RoundedRectangleBorder(borderRadius: BorderRadius.circular(10.0)), // ปรับความมนของปุ่ม
        borderSide: BorderSide(color: Mystyle().darkColor), // สีขอบของปุ่ม
        child: Text('Regiter',style: TextStyle(color: Mystyle().darkColor),), //อักษรและสีอักษร
        onPressed: () {},
      ),
    );
  }

  /////////////////////////////////
  ////////////////////////////////
  ///////////////////////////////
  ///
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Register'),
        backgroundColor: Mystyle().darkColor,
      ),
      body: SingleChildScrollView(
        // ทำให้หน้าจอมันเลื่อนได้
        child: Container(
          margin: EdgeInsets.only(top: 20.0),
          child: Column(
            children: <Widget>[
              nameForm(),
              emailForm(),
              passForm(),
              registerButton(),
            ],
          ),
        ),
      ),
    );
  }
}
