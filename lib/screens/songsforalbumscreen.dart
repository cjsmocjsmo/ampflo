import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class SongsForAlbumScreen extends StatelessWidget {

  Future<List<dynamic>> fetchSongs(apiUrl) async {

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
        ),
        drawer: Theme(
          data: Theme.of(context).copyWith(
            canvasColor: Colors.purple, //desired color
          ),
          child: MyDrawer(),
        ),
        // drawer: MyDrawer(),
        body: Container(
          decoration: BoxDecoration(
            // color: Colors.lightGreenAccent.shade400,
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
                            Navigator.of(context).pushNamed('/Player2', arguments: snapshot.data[index]["fileID"]);
                          },
                          child: 
                          Container(
                            height: 75,
                            color: Colors.purpleAccent[200],
                            child:Center(
                              child: Text(
                                '${snapshot.data[index]['title']}',
                                style: TextStyle(fontSize: 26, color: Colors.black),
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
            Navigator.pushNamed(context, '/Player');
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