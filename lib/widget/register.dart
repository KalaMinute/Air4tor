import 'package:air4tor/utility/my_style.dart';
import 'package:air4tor/utility/normal_dialog.dart';
import 'package:flutter/material.dart';

class Register extends StatefulWidget {
  @override
  _RegisterState createState() => _RegisterState();
}

class _RegisterState extends State<Register> {
  
  //Field
String name,email,password; // การประกาศตัวแปลที่เป็นค่าว่างคือ Null เพื่อเอามารอรับค่าจากการป้อนที่ keyboard

  // Method

  Widget nameForm() {
    Color color1 = Colors.orange.shade300;
    Color color2 = Colors.blue.shade300;
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        Container(
          width: 250.0,
          child: TextField(onChanged: (String string){ // 
            name = string.trim(); // trim คืออการตัดหน้าหลัง
          },
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
///////////////////////////////

  Widget emailForm() {
    Color color1 = Colors.orange.shade300;
    Color color2 = Colors.blue.shade300;
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        Container(
          width: 250.0,
          child: TextField(onChanged: (String string){  // onChange คือการเก้บค่าจากการป้อน
            email = string.trim();   // การเก็นค่ามาไว้ในตัวแปล
          },
            keyboardType: TextInputType.emailAddress, // ทำให้แป้นคีบอร์ดที่โผล่มาเป็นหน้าที่มีเครื่องมหาย@
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
          child: TextField(onChanged: (String string){
            password = string.trim();
          },
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

  ////////////////////////////

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
        onPressed: () {  // เมื่อมีการกดปุ่ม
          print('name = $name,email = $email,password = $password'); // ลองโชว์ดูว่าเมื่อกดปุ่มแล้วมันรับค่ามาได้รึยัง
          
          if (name == null||name.isEmpty ||
              email == null || email.isEmpty || 
              password == null || password.isEmpty) { 
             // ต้องตรวจทั้งช่องว่าง(การป้อนแล้วลบ)และค่าว่าง null เช่น name == null||name.isEmpty
            normalDialog(context, 'Have Space', 'Please Fill Every Blank'); // คือการเด้งแจ้งเตือนไม่กรอก
          } else {

          }
          
        },
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
