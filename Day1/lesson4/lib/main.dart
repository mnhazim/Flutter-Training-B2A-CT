import 'package:flutter/material.dart';
import 'dart:async';
import 'dart:convert';
import 'package:http/http.dart' as http;

void main() => runApp(MyApp());

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  List fruits = ['Apple', 'Banana', 'Grape'];

  String url = 'https://ams-api.astro.com.my/ams/v3/getChannelList';

  List data;

  Future<String> GetAstroApi() async {
    var response = await http.get(Uri.encodeFull(url), headers: {'Accept': 'application/json'});
    setState(() {
      var extractdata = json.decode(response.body);
      data = extractdata['channels'];
      print(data);
    });
    
  }

  Future init() async {
    this.GetAstroApi();
  }

  @override
  void initState() { 
    super.initState();
    init();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Material App',
      home: Scaffold(
        appBar: AppBar(
          title: Text('Material App Bar'),
        ),
        body: ListView.builder(
          itemCount: data.length,
          itemBuilder: (context,index){
            return ListTile(
              leading: CircleAvatar(
                backgroundImage: AssetImage('images/apple.jpeg'),
                radius: 20,
              ),
              title: Text(data[index]['channelTitle'].toString()),
              subtitle: Text(data[index]['channelStbNumber'].toString()),
              trailing: Icon(Icons.arrow_forward_ios),
            );
          },
        )
      ),
    );
  }
}