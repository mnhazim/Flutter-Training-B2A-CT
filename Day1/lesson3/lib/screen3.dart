import 'package:flutter/material.dart';

class Screen3 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Screen 3'),
      ),
      body: Center(
        child: Container(
          child: Column(
            children: <Widget>[
              Text('Screen 3'),
              RaisedButton(
                child: Text("Back To Screen 2"),
                onPressed: () {
                  Navigator.pop(context);
                },
              ),
              RaisedButton(
                child: Text("Go To Home"),
                onPressed: () {
                  Navigator.pushNamedAndRemoveUntil(context, 'screen1', (route) => false);
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
