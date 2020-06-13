import 'package:flutter/material.dart';

  void main() => runApp(SilverAppBarExample());

  class SilverAppBarExample extends StatelessWidget {
    @override
    Widget build(BuildContext context) {
      return MaterialApp(
        debugShowCheckedModeBanner: false,
        home: Scaffold(
          body: CustomScrollView(
            slivers: <Widget>[
              SliverAppBar(
                leading: IconButton(
                  icon: Icon(Icons.filter_1),
                  onPressed: () {
                    // Do something
                  }
                ),
                expandedHeight: 220.0,
                floating: true,
                pinned: true,
                snap: true,
                elevation: 50,
                backgroundColor: Colors.blue,
                flexibleSpace: FlexibleSpaceBar(
                    centerTitle: true,
                    title: Text('Sliverbar Demo 2',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 16.0,
                        )),
                    background: Image.network(
                      'https://scontent.fkul6-2.fna.fbcdn.net/v/t1.0-9/93142566_886375458505435_5068231099142897664_o.jpg?_nc_cat=107&_nc_sid=825194&_nc_ohc=1Zx2DLGoVNYAX9fPF8D&_nc_ht=scontent.fkul6-2.fna&oh=8fe8125b2a3ae13e3b499c9adfff21b7&oe=5F0BB67F',
                      fit: BoxFit.cover,
                    )
                ),
              ),
              new SliverList(
                  delegate: new SliverChildListDelegate(_buildList(50))
              ),
            ],
          ),
        ),
      );
    }

    List _buildList(int count) {
      List<Widget> listItems = List();

      for (int i = 0; i < count; i++) {
        listItems.add(new Padding(padding: new EdgeInsets.all(20.0),
            child: new Text(
                'Item ${i.toString()}',
                style: new TextStyle(fontSize: 25.0)
            )
        ));
      }

      return listItems;
    }
  }