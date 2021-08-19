import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class ArtistScreen extends StatelessWidget {

  final String apiUrl = "http://192.168.0.91:9090/InitArtistInfo";

  Future<List<dynamic>> fetchArtists() async {
    var result;
    try {
      var result = await http.get(Uri.parse(apiUrl));
      // print(json.decode(result.body));
      return json.decode(result.body);
    } catch (e) {
      print("OOOOOh Fuck");
    }
    return result;
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Scaffold(
        appBar: AppBar(
          title: Text("Artists"),
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
                future: fetchArtists(),
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
                            Navigator.of(context).pushNamed('/AlbumsForArtist', arguments: snapshot.data[index]["artistID"]);
                          },
                          child:
                          // Card(
                          //   child: ListTile(
                          //     title: Text('${snapshot.data[index]['artist']}'),
                          //     trailing: Icon(Icons.chevron_right),
                          //   ),
                          // ),
                          Card(
                            child: ListTile(
                              // leading: FlutterLogo(size: 56.0),
                              title: Text('${snapshot.data[index]['artist']}'),
                              subtitle: Text('${snapshot.data[index]['albcount']} albums'),
                              trailing: Icon(Icons.chevron_right),
                              tileColor: Colors.yellowAccent[200],
                            ),
                          ),
                          // Container(
                          //   height: 75,
                          //   color: Colors.purpleAccent[200],
                          //   child:Center(
                          //     child: Text(
                          //       '${snapshot.data[index]['artist']}',
                          //       style: TextStyle(fontSize: 26, color: Colors.black),
                          //     ),
                          //   ),
                          // ),
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