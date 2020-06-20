import 'package:flutter/material.dart';
import 'package:lesson7/home.dart';
import 'package:lesson7/qrcreate.dart';
import 'package:lesson7/qrscan.dart';
 
void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Home(),
      //route
      routes: <String, WidgetBuilder>{
        'qrcreate': (BuildContext context) => CreateQRCode(),
        'qrscan': (BuildContext context) => ScanQRCode(),
      },
    );
  }
}