import 'package:flutter/material.dart';

class SongsScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Songs'),
        backgroundColor: Colors.lightGreen[900],
      ),
      body: Container(
        decoration: BoxDecoration(
          color: Colors.lightGreenAccent.shade400,
        ),
        child: Center(
          child:listViewHomeZ,
        ),
      )
    );
  }
}

Widget listViewHomeZ = ListView.builder(
  itemCount: 18,
  itemBuilder: (BuildContext context, int index) {
    return Card(
      color: Colors.amber[400],
      child: InkWell(
        splashColor: Colors.blue.withAlpha(30),
        child: ListTile(
          title: Text("Mexican Black Bird"),
          subtitle: Text('Fandango'),
          leading: Image.asset('images/two2.jpg', height: 150.0, width: 150.0),
          trailing: Text("13"),
          onTap: () {
            Navigator.pop(context);
            // Navigator.pushNamed(
            //   context,
            //   '/Playlists',
            //   arguments: {}
            // );
          }
        ),
      )
    );
  }
);