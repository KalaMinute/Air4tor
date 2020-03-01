import 'package:air4tor/utility/my_style.dart';
import 'package:air4tor/widget/authen.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class MyService extends StatefulWidget {
  @override
  _MyServiceState createState() => _MyServiceState();
}

class _MyServiceState extends State<MyService> {
  // Field

  //Method

  Widget signOutButton() {
    return IconButton( tooltip: 'SingOut', // tooltip คือการกดค้าง
      icon: Icon(Icons.exit_to_app),
      onPressed: () {
        signOutProcess();
      },
    );
  }

  Future<void> signOutProcess()async{
    FirebaseAuth auth = FirebaseAuth.instance; // ทุกคั้งที่จะเชื่อมกับ firebase ต้องสร้าง instan
    await auth.signOut().then((response){

      MaterialPageRoute route = MaterialPageRoute(builder: (context) => Auther());
      Navigator.of(context).pushAndRemoveUntil(route, (route) => false);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(backgroundColor: Mystyle().darkColor,
        actions: <Widget>[signOutButton()],
        title: Text('Air4Tor'),
      ),
    );
  }
}
