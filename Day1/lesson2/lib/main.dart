import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Material App',
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(
          title: Text('Material App Bar'),
        ),
        body: Home(),
      ),
    );
  }
}

//type stateless
class Home extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Center(
        child: Column(
          children: <Widget>[
            RaisedButton(
              color: Colors.redAccent,
              child: Text(
                "Show SnackBar",
                style: TextStyle(color: Colors.white),
              ),
              onPressed: () {
                final mySnackBar = SnackBar(
                  content: Text("My SnackBar"),
                  action: SnackBarAction(
                      label: "OK",
                      onPressed: () {
                        print("Snack OK");
                      }),
                );
                Scaffold.of(context).showSnackBar(mySnackBar);
              },
            ),
            RaisedButton(
              color: Colors.teal,
              child: Text(
                "Alert",
                style: TextStyle(color: Colors.white),
              ),
              onPressed: () {
                showDialog(
                  context: context,
                  builder: (BuildContext context) {
                    return AlertDialog(
                      title: Text("This is Model"),
                      content: Text("Content for this model"),
                      actions: <Widget>[
                        RaisedButton(
                            child: Text(
                              "Submit",
                              style: TextStyle(color: Colors.redAccent),
                            ),
                            onPressed: () {
                              print("Done");
                            }),
                        RaisedButton(
                            child: Text(
                              "Cancel",
                              style: TextStyle(color: Colors.teal),
                            ),
                            onPressed: () {
                              Navigator.pop(context);
                            })
                      ],
                    );
                  },
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
