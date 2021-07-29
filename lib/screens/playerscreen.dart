import 'package:flutter/material.dart';
import 'artistscreen.dart';

class PlayerScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        // backgroundColor: Colors.lightGreen.shade900,
        title: Text(
          "Player Page",
          style: TextStyle(color: Colors.white),
        ),
        actions: <Widget>[
          IconButton(
            onPressed: () {
              Navigator.pushNamed(
                context,
                '/PlayLists'
              );
            },
            icon: Icon(Icons.queue_music),
            tooltip: "Go to PlayLists Page"
          ),
          IconButton(
            onPressed: () {
              Navigator.pushNamed(
                context,
                '/Main'
              );
            },
            icon: Icon(Icons.home),
            tooltip: "Go To Home Page"
          ),
          IconButton(
            onPressed: () {
              Navigator.pushNamed(
                context,
                '/'
              );
            },
            icon: Icon(Icons.exit_to_app_sharp),
            tooltip: "Exit Page"
          ),
          // IconButton(
          //   icon: const Icon(Icons.add_alert),
          //   tooltip: 'Show Snackbar',
          //   onPressed: () {
          //     ScaffoldMessenger.of(context).showSnackBar(SnackBar(
          //       content: Text('ZZ Top \n Fandango \n Mexican Black Bird'),
          //       backgroundColor: Colors.purple,
          //     ));
          //   },
          // ),
        ]
      ),
      drawer: MyDrawer(),
      body: Container(
      decoration: BoxDecoration(
        color: Colors.lightGreenAccent.shade400,
      ),
      child: Column(
        children: <Widget>[
          buttonSection,
          Image.asset('images/two.jpg'),
          Center(
            child: Column(
              children: <Widget>[
                Padding(
                  padding: EdgeInsets.all(10.0),
                  child: Text(
                    "Currently Playing",
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.w600,
                      color: Colors.black,
                    ),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.all(10.0),
                  child: Text(
                    "ZZ Top",
                    style: TextStyle(
                      fontSize: 14,
                      fontWeight: FontWeight.w600,
                      color: Colors.black,
                    ),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.all(10.0),
                  child: Text(
                    "Fandango",
                    style: TextStyle(
                      fontSize: 14,
                      fontWeight: FontWeight.w600,
                      color: Colors.black,
                    ),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.all(10.0),
                  child: Text(
                    "Mexican Black Bird",
                    style: TextStyle(
                      fontSize: 14,
                      fontWeight: FontWeight.w600,
                      color: Colors.black,
                    ),
                  ),
                )
              ]
            ) 
          ),
        ]
      ),
    ));
  }
}

Column _buildButtonColumn(IconData icon, String label) {
  return Column(
    mainAxisSize: MainAxisSize.min,
    mainAxisAlignment: MainAxisAlignment.center,
    children: [
      Icon(icon, color: Colors.blue[900]),
      Container(
        margin: const EdgeInsets.only(top: 8),
        child: Text(
          label,
          style: TextStyle(
            fontSize: 14,
            fontWeight: FontWeight.w600,
            color: Colors.blue[900],
          ),
        ),
      ),
    ],
  );
}

Widget buttonSection = Container(
  padding: EdgeInsets.all(20),
  child: Row(
    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
    children: [
      _buildButtonColumn(Icons.skip_previous_sharp, "PREVIOUS"),
      _buildButtonColumn(Icons.play_arrow_sharp, 'PLAY'),
      _buildButtonColumn(Icons.stop_sharp, 'STOP'),
      _buildButtonColumn(Icons.skip_next_sharp, 'NEXT'),
    ],
  ),
);