import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:fluttertoast/fluttertoast.dart';

class SongsForAlbumScreen extends StatelessWidget {

  Future<List<dynamic>> fetchSongs(apiUrl) async {

    var result = await http.get(Uri.parse(apiUrl));
    return json.decode(result.body);
    
  }

  Future<List<dynamic>> fetchDBS() async {

    final String apiUrl = "http://192.168.0.91:9090/AllPlaylists";

    var result = await http.get(Uri.parse(apiUrl));
    print(json.decode(result.body));
    return json.decode(result.body);
  
  }

  @override
  Widget build(BuildContext context) {
    final albumID = ModalRoute.of(context)?.settings.arguments;
    final String apiUrl = "http://192.168.0.91:9090/SongsForAlbum?selected=$albumID";

    return Center(
      child: Scaffold(
        appBar: AppBar(
          title: Text("Songs"),
          actions: <Widget>[
            FutureBuilder<List<dynamic>>(
              future: fetchDBS(),
              builder: (BuildContext context, AsyncSnapshot snapshot) {
                if (snapshot.hasData) {
                  print(snapshot.data[0]["PlayListName"]);
                  print(snapshot.data.length);
                  final snackBar = SnackBar(
                    content: Text(snapshot.data[0]["PlayListName"], style: TextStyle(fontSize: 25)),
                    action: SnackBarAction(
                      label: 'Undo',
                      onPressed: () {
                            // Some code to undo the change.
                      },
                    ),
                  );
                  return 
                  IconButton(
                    icon: const Icon(Icons.playlist_add, size: 34.0),
                    tooltip: 'Current Selected Playlist',
                    onPressed: () {
                      ScaffoldMessenger.of(context).showSnackBar(snackBar);
                    },
                  );
                } else {
                    return CircularProgressIndicator();
                };
              },
            ),
          ],
        ),
        drawer: Theme(
          data: Theme.of(context).copyWith(
            canvasColor: Colors.purple, //desired color
          ),
          child: MyDrawer(),
        ),
        body: Container(
          decoration: BoxDecoration(
            color: Colors.purpleAccent.shade400,
        ),
          child: Center(
            child:
              FutureBuilder<List<dynamic>>(
                future: fetchSongs(apiUrl),
                builder: (BuildContext context, AsyncSnapshot snapshot) {
                  if (snapshot.hasData) {
                    return ListView.builder(
                      padding: const EdgeInsets.all(8),
                      itemCount: snapshot.data.length,
                      itemBuilder: (BuildContext context, int index) {
                        return GestureDetector(
                          onTap: () {
                            Navigator.of(context).pushNamed('/Player2', arguments: snapshot.data[index]["httpaddr"]);
                          },
                          child: Card(
                            child: ListTile(
                              tileColor: Colors.limeAccent.shade400,
                              // leading: Icon(Icons.play_arrow, size: 32.0),
                              title: Text('${snapshot.data[index]['title']}'),
                              trailing: IconButton(
                                icon: const Icon(Icons.add),
                                tooltip: 'Add to playlist',
                                onPressed: () {
                                  print("adding ${snapshot.data[index]['fileID']} to playlist");
                                },
                              ),

                            ),
                          ),
                        );
                      });
                  } else {
                    return CircularProgressIndicator();
                  }
                }
              ),
          )
        ),
      ),
    );
  }
}

class MyDrawer extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Drawer(
    child: ListView(
      children: <Widget>[
        ListTile(
          title: Text("Artists", style: TextStyle(fontSize: 28.0, fontWeight: FontWeight.bold)),
          trailing: Icon(Icons.arrow_forward),
          tileColor: Colors.red,
          onTap: () {
            Navigator.of(context).pop();
            Navigator.pushNamed(context, '/Artists');
          },
        ),
        ListTile(
          title: Text("Albums", style: TextStyle(fontSize: 28.0, fontWeight: FontWeight.bold)),
          trailing: Icon(Icons.arrow_forward),
          tileColor: Colors.blue,
          onTap: () {
            Navigator.of(context).pop();
            Navigator.pushNamed(context, '/Albums');
          },
        ),
        ListTile(
          title: Text("PlayLists", style: TextStyle(fontSize: 28.0, fontWeight: FontWeight.bold)),
          trailing: Icon(Icons.arrow_forward),
          tileColor: Colors.purpleAccent,
          onTap: () {
            Navigator.of(context).pop();
            Navigator.pushNamed(context, '/PlayLists');
          },
        ),
        ListTile(
          title: Text("Player", style: TextStyle(fontSize: 28.0, fontWeight: FontWeight.bold)),
          trailing: Icon(Icons.arrow_forward),
          tileColor: Colors.brown,
          onTap: () {
            Navigator.of(context).pop();
            Navigator.pushNamed(context, '/Player2');
          },
        ),
         ListTile(
          title: Text("EXIT", style: TextStyle(fontSize: 28.0)),
          trailing: Icon(Icons.arrow_forward),
          tileColor: Colors.pink,
          onTap: () {
            Navigator.of(context).pop();
            Navigator.pushNamed(context, '/');
          },
        ),
      ]
      ),
    );
  }
}
