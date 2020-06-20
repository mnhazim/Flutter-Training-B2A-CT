
import 'package:flutter/material.dart';

 class Home extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Home',
      home: Scaffold(
        appBar: AppBar(
          title: Text('Attendance App'),
        ),
        body: Center(
          child: Container(
            child: Column(
              children: <Widget>[
                RaisedButton(
                  child: Text('Create QRCode'),
                  onPressed: () {
                    Navigator.pushNamed(context, 'qrcreate');
                  },
                ),
                RaisedButton(
                  child: Text('Scan QRCode'),
                  onPressed: () {
                    Navigator.pushNamed(context, 'qrscan');
                  },
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}