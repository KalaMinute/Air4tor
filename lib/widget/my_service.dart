import 'package:air4tor/utility/my_style.dart';
import 'package:air4tor/widget/authen.dart';
import 'package:dio/dio.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class MyService extends StatefulWidget {
  @override
  _MyServiceState createState() => _MyServiceState();
}

class _MyServiceState extends State<MyService> {
  // Field
  String nameLogin ='';
  String url = 'http://air4thai.pcd.go.th/services/getNewAQI_JSON.php?stationID=o10';
  String resultName = '';

  //Method
  @override
  void initState(){
    super.initState();
    findNameLogin();
    readAPI();
  }

  Future<void> readAPI()async{

    try {
      
      Response response = await Dio().get(url);
      print('response = $response'); // ลองดูว่าได้ค่า jsan มาจาก web รึยัง

    } catch (e) {
    }

  }

  Future<void> findNameLogin()async{
    FirebaseAuth auth = FirebaseAuth.instance;
    FirebaseUser firebaseUser = await auth.currentUser();
    setState(() {
      nameLogin = firebaseUser.displayName;
      if (nameLogin == null) {
        nameLogin = 'Unknow'; 
      }
    });
  }

  Widget showNameLogin(){
    return Column(mainAxisAlignment: MainAxisAlignment.center, // ดึงชื่อมาโชว์ว่า login ไว้ตรงกลาง
      children: <Widget>[
        Text('$nameLogin Login'), //ดึงชื่อ
      ],
    );   
  }


  Widget signOutButton() {
    return IconButton( tooltip: 'SingOut', // tooltip คือการกดค้าง
      icon: Icon(Icons.exit_to_app),
      onPressed: () {
        signOutProcess();
      },
    );
  }

  Future<void> signOutProcess()async{
    FirebaseAuth auth = FirebaseAuth.instance; // ทุกครั้งที่จะเชื่อมกับ firebase ต้องสร้าง instan
    await auth.signOut().then((response){

      MaterialPageRoute route = MaterialPageRoute(builder: (context) => Auther());
      Navigator.of(context).pushAndRemoveUntil(route, (route) => false);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(backgroundColor: Mystyle().darkColor,
        actions: <Widget>[showNameLogin(), signOutButton()],
        title: Text('Air4Tor'),
      ),
    );
  }
}
