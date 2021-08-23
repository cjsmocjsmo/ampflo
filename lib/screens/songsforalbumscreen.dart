import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';



class SongsForAlbumScreen extends StatelessWidget {

  Future<List<dynamic>> fetchSongs(apiUrl) async {

    var result = await http.get(Uri.parse(apiUrl));
    return json.decode(result.body);
    
  }

  // Future<List<dynamic>> fetchDBS() async {
  //   final String apiUrl = "http://192.168.0.91:9090/AllPlaylists";

  //   var result = await http.get(Uri.parse(apiUrl));
  //   print(json.decode(result.body));
  //   return json.decode(result.body);
    
  // }

  @override
  Widget build(BuildContext context) {
    final albumID = ModalRoute.of(context)?.settings.arguments;
    final String apiUrl = "http://192.168.0.91:9090/SongsForAlbum?selected=$albumID";

    // void _audioPlayerTaskEntrypoint() async {
    //   AudioServiceBackground.run(() => AudioPlayerTask());
    // }

    return Center(
      child: Scaffold(
        appBar: AppBar(
          title: Text("Songs"),
          actions: <Widget>[
            IconButton(
              icon: const Icon(Icons.playlist_add, size: 34.0),
              tooltip: 'Choose PlayList To Add Songs To',
              onPressed: () {
                var dbs = fetchDBS();
                showDialog(
                  context: context,
                  builder: (BuildContext context) => _buildPopupDialog(context),
                );
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
                            // print(snapshot.data[index]["artistID"]);
                            // String dirp = "/media/pi/PiTB/media/TVShows";
                            // String ap = dirp + snapshot.data[index]["tvfspath"];
                            // final String apiPU = "http://192.168.0.42:8181/OmxplayerPlayMediaReact?medPath=" + ap;
                            // playEpi(apiPU);
                            // Navigator.pop(context);
                            // Navigator.of(context).pop();
                            // Navigator.pushNamed(context, '/AlbumsForArtist');
                            Navigator.of(context).pushNamed('/Player2', arguments: snapshot.data[index]["httpaddr"]);
                          },
                          child: Card(
                            child: ListTile(
                              tileColor: Colors.limeAccent.shade400,
                              leading: Icon(Icons.play_arrow, size: 32.0),
                              title: Text('${snapshot.data[index]['title']}'),
                              // trailing: Icon(Icons.add, size: 32.0),
                              trailing: IconButton(
                                icon: const Icon(Icons.add),
                                tooltip: 'Add to playlist',
                                onPressed: () {
                                  print("adding ${snapshot.data[index]['fileID']} to playlist");
                                  
                                  // showDialog(
                                  //   context: context,
                                  //   builder: (BuildContext context) => _buildPopupDialog(context),
                                  // );
                                  // Navigator.of(context).pushNamed('/PlayLists', arguments: snapshot.data[index]["fileID"]);
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
Future<List<dynamic>> fetchDBS() async {
    final String apiUrl = "http://192.168.0.91:9090/AllPlaylists";

    var result = await http.get(Uri.parse(apiUrl));
    print(json.decode(result.body));
    return json.decode(result.body);
    
  }
Widget _buildPopupDialog(BuildContext context) {

  

  return AlertDialog(
    title: const Text('Select PlayList'),
    content: new Column(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        FutureBuilder<List<dynamic>>(
          future: fetchDBS(),
          builder: (BuildContext context, AsyncSnapshot snapshot) {
            print(snapshot.data[0]["PlayListName"]);
            if (snapshot.hasData) {
              print(snapshot.data[0]["PlayListName"]);
              return ListView.builder(
                padding: const EdgeInsets.all(2),
                itemCount: snapshot.data.length,
                itemBuilder: (BuildContext context, int index) {
                
                return 
                // Text(snapshot.data[index]["PlayListName"]);
                ElevatedButton(
                    style: ElevatedButton.styleFrom(textStyle: TextStyle(fontSize: 12)),
                    onPressed: () {
                      //add local storage as current playlist
                    },
                    child: Text(snapshot.data["playlistname"]),
                  );
                },
              );
            } else {
              return CircularProgressIndicator();
            }
          },
        ),
      ],
    ),
    actions: <Widget>[
      new FlatButton(
        onPressed: () {
          //Make post request to server to add song to selected playlist
          Navigator.of(context).pop();
        },
        textColor: Theme.of(context).primaryColor,
        child: const Text('Close'),
      ),
    ],
  );
}



        // //This needs to be a radio button list or check box list of playlists
        // Text("Playlist One", style: TextStyle(fontSize: 18)),
        // Text("Playlist Two", style: TextStyle(fontSize: 18)),
        // Text("Playlist Three", style: TextStyle(fontSize: 18)),