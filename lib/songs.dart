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
          // Column(
          //   mainAxisAlignment: MainAxisAlignment.center,
          //   children: [
          //     Text('Viewing songs page'),
          //     ElevatedButton(
          //       child: Text('Pop!'),
          //       onPressed: () {
          //         Navigator.pop(context);
          //       },
          //     ),
          //   ],
          // ),
        ),
      )
    );
  }
}

Widget listViewHomeZ = ListView.builder(
  itemCount: 6,
  itemBuilder: (BuildContext context, int index) {
    return Card(
          color: Colors.amber[400],
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
        );
  }
);