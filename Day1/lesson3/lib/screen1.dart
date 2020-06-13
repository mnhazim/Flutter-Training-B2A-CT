import 'package:flutter/material.dart';
import 'package:lesson3/screen2.dart';

class Screen1 extends StatefulWidget {
  
  @override
  _Screen1State createState() => _Screen1State();
}

class _Screen1State extends State<Screen1> {
  final _myController = TextEditingController();
  final _myController2 = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Screen 1'),
      ),
      body: Center(
        child: Container(
          child: Column(
            children: <Widget>[
              Text('Name'),
              TextField(controller: _myController,),
              Text('Age'),
              TextField(controller: _myController2,),
              RaisedButton(
                child: Text("Go To Screen 2"),
                onPressed: () {
                  Navigator.push(context, MaterialPageRoute(builder: (context) => Screen2() ));
                },
              )
            ],
          ),
        ),
      ),
    );
  }
}
