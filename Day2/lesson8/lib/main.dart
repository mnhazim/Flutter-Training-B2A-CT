import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:lesson8/listpage.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Material App',
      home: Scaffold(
        appBar: AppBar(
          title: Text('Material App Bar'),
        ),
        body: Home(),
      ),
      routes: <String, WidgetBuilder> {
        'list' : (BuildContext context) => Listpage()
      },
    );
  }
}

class Home extends StatelessWidget {
  final _namaController = TextEditingController();
  final _emailController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Container(
      child: ListView(
        children: <Widget>[
          TextField(controller: _namaController),
          TextField(controller: _emailController),
          RaisedButton(
            child: Text("Save Data"),
            onPressed: () async {
              await Firestore.instance
                  .collection('pengguna')
                  .document()
                  .setData({
                'nama': _namaController.text,
                'noic': _emailController.text,
              });
            },
          ),
          RaisedButton(
            child: Text("List"),
            onPressed: () {
              Navigator.pushNamed(context, 'list');
            },
          ),
        ],
      ),
    );
  }
}
