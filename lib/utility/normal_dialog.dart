import 'package:flutter/material.dart';

Future<void> normalDialog(
    // การแจ้งเตือนที่ไม่มีการคืนค่า(viod) ถ้าจะเอาการคืนค่าก็ใส่อย่างอื่นเข้าไปแทน void
    BuildContext context,
    String title,
    String message) async {
  showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text(title),
          content: Text(message),
          actions: <Widget>[
            FlatButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: Text('OK'),
            ),
          ],
        );
      });
}
