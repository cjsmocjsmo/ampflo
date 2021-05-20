import 'package:flutter/material.dart';

class PlayListsScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Playlists"),
        backgroundColor: Colors.lightGreen[900],
      ),
      actions: <Widget>[
          IconButton(
            onPressed: () {
              Navigator.pushNamed(
                context,
                '/Songs'
              );
            },
            icon: Icon(Icons.album_sharp),
            tooltip: "Go to Songs Page"
          ),
          IconButton(
            onPressed: () {
              Navigator.pushNamed(
                context,
                '/Playlists'
              );
            },
            icon: Icon(Icons.add_rounded),
            tooltip: "Go To Playlist Page"
          ),
          IconButton(
            onPressed: () {
              Navigator.pushNamed(
                context,
                '/'
              );
            },
            icon: Icon(Icons.exit_to_app_sharp),
            tooltip: "Exit App"
          ),
          IconButton(
            icon: const Icon(Icons.add_alert),
            tooltip: 'Show Snackbar',
            onPressed: () {
              ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                content: Text('ZZ Top \n Fandango \n Mexican Black Bird'),
                backgroundColor: Colors.purple,
              ));
            },
          ),
        ]
      ),
      body: Container(
        decoration: BoxDecoration(
          color: Colors.lightGreenAccent.shade400,
        ),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text('Viewing playlist page'),
              ElevatedButton(
                style: ButtonStyle(
                  backgroundColor: MaterialStateProperty.all<Color>(Colors.lightGreen),
                ),
                child: Text('Pop!'),
                onPressed: () {
                  Navigator.pop(context);
                },
              ),
            ],
          ),
        ),
      )
    );
  }
}