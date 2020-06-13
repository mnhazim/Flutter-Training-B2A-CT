import 'package:flutter/material.dart';
import 'package:lesson3/user.dart';

class Screen2 extends StatefulWidget {

  final User value;
  Screen2({Key key, this.value}) : super (key:key);

  @override
  _Screen2State createState() => _Screen2State();
}

class _Screen2State extends State<Screen2> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Screen 2'),
      ),
      body: Center(
        child: Container(
          child: Column(
            children: <Widget>[
              Text('${widget.value.age}', style: TextStyle(color: Colors.redAccent, fontSize: 30),),
              RaisedButton(
                child: Text("Go To Screen 3"),
                onPressed: () {
                  Navigator.pushNamed(context, 'screen3');
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
