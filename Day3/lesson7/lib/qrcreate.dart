import 'package:flutter/material.dart';
import 'package:qr_flutter/qr_flutter.dart';

class CreateQRCode extends StatefulWidget {
  @override
  _CreateQRCodeState createState() => _CreateQRCodeState();
}

class _CreateQRCodeState extends State<CreateQRCode> {
  //Declare variable
  String myQRCode = '1234567890';
  final _qrcodeController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('Create QRCode'),
        ),
        body: Center(
          child: Container(
            margin: EdgeInsets.fromLTRB(105, 10, 105, 10),
            child: Column(
              children: <Widget>[
                QrImage(
                  data: myQRCode,
                  version: QrVersions.auto,
                  size: 200.0,
                ),
                TextField(controller: _qrcodeController,
                decoration: InputDecoration(
              border: OutlineInputBorder(),
            ),),
                RaisedButton(
                  color: Colors.blue,
                  child: Text('Generate New QRCode', style: TextStyle(color: Colors.white),),
                  onPressed: () {
                    setState(() {
                      myQRCode = _qrcodeController.text;
                    });
                  },
                ),
              ],
            ),
          ),
        ),
    );
  }
}