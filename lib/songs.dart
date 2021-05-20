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
          // child:listViewHomeZ,
          testGridView,
        ),
      )
    );
  }
}


Widget testGridView = GridView.count(
  primary: false,
  padding: const EdgeInsets.all(20),
  crossAxisSpacing: 10,
  mainAxisSpacing: 10,
  crossAxisCount: 2,
  children: <Widget>[
    GestureDetector(
      onTap: () {
        Navigator.pushNamed(
          context,
          '/Songs',
          arguments: {}
        );
        child: Container(
          padding: const EdgeInsets.all(8),
          child: Image.asset('images/two2.jpg', height: 250.0, width: 200.0),
          // child: const Text("He'd have you all unravel at the"),
          // color: Colors.teal[100],
        ),
      },
    ),
    GestureDetector(
      onTap: () {
        Navigator.pushNamed(
          context,
          '/Songs',
          arguments: {}
        );
        child: Container(
          padding: const EdgeInsets.all(8),
          child: Image.asset('images/two2.jpg', height: 250.0, width: 200.0),
          // child: const Text("He'd have you all unravel at the"),
          // color: Colors.teal[100],
        ),
      },
    ),
    Container(
      child: padding: const EdgeInsets.all(8),
      Image.asset('images/two2.jpg', height: 250.0, width: 200.0),
      // child: const Text("He'd have you all unravel at the"),
      // color: Colors.teal[100],
    ),
    Container(
      padding: const EdgeInsets.all(8),
      child: Image.asset('images/two2.jpg', height: 250.0, width: 200.0),
      // child: const Text("He'd have you all unravel at the"),
      // color: Colors.teal[100],
    ),
    Container(
      padding: const EdgeInsets.all(8),
      child: Image.asset('images/two2.jpg', height: 250.0, width: 200.0),
      // child: const Text("He'd have you all unravel at the"),
      // color: Colors.teal[100],
    ),
    Container(
      padding: const EdgeInsets.all(8),
      child: Image.asset('images/two2.jpg', height: 250.0, width: 200.0),
      // child: const Text("He'd have you all unravel at the"),
      // color: Colors.teal[100],
    ),
    Container(
      padding: const EdgeInsets.all(8),
      child: Image.asset('images/two2.jpg', height: 250.0, width: 200.0),
      // child: const Text("He'd have you all unravel at the"),
      // color: Colors.teal[100],
    ),
    Container(
      padding: const EdgeInsets.all(8),
      child: Image.asset('images/two2.jpg', height: 250.0, width: 200.0),
      // child: const Text("He'd have you all unravel at the"),
      // color: Colors.teal[100],
    ),
    Container(
      padding: const EdgeInsets.all(8),
      child: Image.asset('images/two2.jpg', height: 250.0, width: 200.0),
      // child: const Text("He'd have you all unravel at the"),
      // color: Colors.teal[100],
    ),
    GestureDetector(
      onTap: () {
        Navigator.pushNamed(
          context,
          '/Songs',
          arguments: {}
        );
      },
      child: Container(
        padding: const EdgeInsets.all(8),
        child: Image.asset('images/two2.jpg', height: 250.0, width: 200.0),
      // child: const Text("He'd have you all unravel at the"),
      // color: Colors.teal[100],
    ),
    GestureDetector(
      onTap: () {
        Navigator.pushNamed(
          context,
          '/Songs',
          arguments: {}
        );
      },
      child: Container(
        padding: const EdgeInsets.all(8),
        child: Image.asset('images/two2.jpg', height: 250.0, width: 200.0),
        // child: const Text("He'd have you all unravel at the"),
        // color: Colors.teal[100],
      ),
    )
    
  ]
)



Widget listViewHomeZ = ListView.builder(
  itemCount: 18,
  itemBuilder: (BuildContext context, int index) {
    return Card(
      color: Colors.amber[400],
        child: ListTile(
          title: Text("Mexican Black Bird"),
          subtitle: Text('Fandango'),
          leading: Image.asset('images/two2.jpg', height: 250.0, width: 200.0),
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