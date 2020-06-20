import 'dart:async';
import 'package:barcode_scan/barcode_scan.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class ScanQRCode extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Scan QR'),
      ),
      body: ReadQRCode(),
    );
  }
}

class ReadQRCode extends StatefulWidget {
  @override
  _ReadQRCodeState createState() => new _ReadQRCodeState();
}

class _ReadQRCodeState extends State<ReadQRCode> {
  String barcode = "";

  @override
  initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: <Widget>[
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
            child: Text(
              barcode,
              textAlign: TextAlign.center,
              style: TextStyle(fontSize: 25.0),
            ),
          ),
          SizedBox(height: 20.0),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 60.0, vertical: 5.0),
            child: FlatButton(
                color: Colors.lightGreen,
                textColor: Colors.white,
                splashColor: Colors.blueGrey,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(22),
                ),
                onPressed: scanQR,
                child: Text('SCAN QR')),
          ),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 60.0, vertical: 5.0),
            child: OutlineButton(
                color: Colors.lightBlue,
                textColor: Colors.blueGrey[100],
                splashColor: Colors.blueGrey[100],
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(22),
                ),
                onPressed: () {
                  barcode = "";
                  Navigator.pop(context);
                },
                child: Text('Back')),
          ),
          SizedBox(
            height: 40,
          ),
        ],
      ),
    ));
  }

//functions
  Future scanQR() async {
    try {
      String barcode = await BarcodeScanner.scan();
      setState(() => this.barcode = barcode);
      print('Successfully scanned!');
      
      //toast here
      final snackBar = SnackBar(
        content: Text('Successfully Saved Attendance!'),
      );

      // Find the Scaffold in the Widget tree and use it to show a SnackBar!
      Scaffold.of(context).showSnackBar(snackBar);
    } on PlatformException catch (e) {
      if (e.code == BarcodeScanner.CameraAccessDenied) {
        setState(() {
          this.barcode = 'The user did not grant the camera permission!';
        });
      } else {
        setState(() => this.barcode = 'Unknown error: $e');
      }
    } on FormatException {
      setState(() => this.barcode =
          'null (User returned using the "back"-button before scanning anything. Result)');
    } catch (e) {
      setState(() => this.barcode = 'Unknown error: $e');
    }
  }

  
}