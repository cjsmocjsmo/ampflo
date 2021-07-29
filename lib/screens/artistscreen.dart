import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class ArtistScreen extends StatelessWidget {

  final String apiUrl = "http://192.168.0.91:9090/InitArtistInfo";

  Future<List<dynamic>> fetchArtists() async {
    var result;
    try {
      var result = await http.get(Uri.parse(apiUrl));
      return json.decode(result.body);
    } catch (e) {
      print("OOOOOh Fuck");
    }
    return result;
  }

  // Future<void> playEpi(playURL) async {
  //   var resultPlay;
  //   try {
  //     var resultPlay = await http.get(Uri.parse(playURL));
  //     return json.decode(resultPlay.body);
  //   } catch (e) {
  //     print("OOOOOH FUUUUCK 2");
  //   }
  //   return resultPlay;
  // }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Scaffold(
        appBar: AppBar(
          // leading: new Icon(Icons.menu),
          // iconTheme: IconThemeData(color: Colors.white),
          title: Text("Artists"),
          // backgroundColor: Colors.lightGreen[900],
          actions: <Widget>[
            IconButton(
              onPressed: () {
                Navigator.pushNamed(
                  context,
                  '/PlayLists'
                );
              },
              icon: Icon(Icons.queue_music),
              tooltip: "Go to Playlists Page"
            ),
            IconButton(
              onPressed: () {
                Navigator.pushNamed(
                  context,
                  '/Player'
                );
              },
              icon: Icon(Icons.speaker),
              tooltip: "Go to Player Page"
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
          ],
        ),
        drawer: MyDrawer(),
        




        body: Container(
          decoration: BoxDecoration(
            color: Colors.lightGreenAccent.shade400,
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
                            print(snapshot.data[index]["artistID"]);
                            // String dirp = "/media/pi/PiTB/media/TVShows";
                            // String ap = dirp + snapshot.data[index]["tvfspath"];
                            // final String apiPU = "http://192.168.0.42:8181/OmxplayerPlayMediaReact?medPath=" + ap;
                            // playEpi(apiPU);
                            // Navigator.pop(context);
                          },
                          child: 

                          Container(
                            height: 75,
                            color: Colors.green[600],
                            child:Center(
                              child: Text(
                                '${snapshot.data[index]['artist']}',
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
                                
                                  
                                  
                      
                                //  // button pressed
                                // child: Column(
                                //   mainAxisAlignment: MainAxisAlignment.center,
                                //   children: <Widget>[
                                //     // Icon(Icons.call), // icon
                                //     Text(
                                //       "1",
                                //       style: TextStyle(
                                //         fontFamily: "Gothic",
                                //         fontWeight: FontWeight.bold,
                                //         fontSize: 22, 
                                //         color: Colors.black),
                                //     ), // text
                                //   ],
                                // ),
                            //   ),
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
          title: Text("Artists"),
          trailing: Icon(Icons.arrow_forward),
          onTap: () {
            Navigator.of(context).pop();
            Navigator.pushNamed(context, '/Artists');
          },
        ),
        ListTile(
          title: Text("Albums"),
          trailing: Icon(Icons.arrow_forward),
          onTap: () {
            Navigator.of(context).pop();
            Navigator.pushNamed(context, '/Albums');
          },
        ),
        ListTile(
          title: Text("PlayLists"),
          trailing: Icon(Icons.arrow_forward),
          onTap: () {
            Navigator.of(context).pop();
            Navigator.pushNamed(context, '/PlayLists');
          },
        ),
        ListTile(
          title: Text("Player"),
          trailing: Icon(Icons.arrow_forward),
          onTap: () {
            Navigator.of(context).pop();
            Navigator.pushNamed(context, '/Player');
          },
        ),
      ]
      ),
    );
  }
}