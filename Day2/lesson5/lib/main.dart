import 'package:flutter/material.dart';
import 'package:lesson5/screen1.dart';
import 'package:lesson5/screen2.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Material App',
      home: DefaultTabController(
        length: 2,
        child: Scaffold(
          appBar: AppBar(
            bottom: TabBar(
              tabs: <Widget>[
                Tab(icon: Icon(Icons.directions_car)),
                Tab(icon: Icon(Icons.directions_transit))
              ],
            ),
            title: Text('Flutter Tabs Demo'),
          ),
          body: TabBarView(
            children: <Widget>[
              Screen1(),
              Screen2(),
            ],
          ),
        ),
      ),
    );
  }
}
