import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class Listpage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('Material App Bar'),
        ),
        body: StreamBuilder<QuerySnapshot>(
          stream: Firestore.instance.collection('pengguna').snapshots(),
          builder:
              (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) {
            if (snapshot.hasError) return new Text('Error: ${snapshot.error}');
            switch (snapshot.connectionState) {
              case ConnectionState.waiting:
                return Center(child: CircularProgressIndicator());
              default:
                return new ListView(
                  children: snapshot.data.documents.map(
                    (DocumentSnapshot document) {
                      return ListTile(
                        title: Column(
                          children: <Widget>[
                            Row(
                              children: <Widget>[
                                Container(
                                  width: 200,
                                  child: Column(
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: <Widget>[
                                      Text(document['nama'].toString()),
                                      Text(document['noic'].toString()),
                                      Text(document['nokad'].toString()),
                                      Text(document['timestamp'].toString()),
                                    ],
                                  ),
                                ),
                                Column(
                                  children: <Widget>[
                                    //column letak buttons
                                    IconButton(
                                      icon: Icon(Icons.delete),
                                      onPressed: () {
                                        //delete
                                        Firestore.instance
                                            .collection("pengguna")
                                            .document(document.documentID)
                                            .delete();
                                      },
                                    ),
                                  ],
                                )
                              ],
                            ),
                          ],
                        ),
                      );
                    },
                  ).toList(),
                );
            }
          },
        ));
  }
}
