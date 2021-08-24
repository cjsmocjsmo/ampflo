import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:fluttertoast/fluttertoast.dart';

class SongsForAlbumScreen extends StatefulWidget {
  @override
  _SongsForAlbumScreenState createState() => _SongsForAlbumScreenState();
}

class _SongsForAlbumScreenState extends State<_SongsForAlbumScreenState> {
  FToast fToast;

  @override
  void initState() {
    super.initState();
    fToast = FToast();
    fToast.init(context);
  }

  _showToast() {
    Widget toast = Container(
        padding: const EdgeInsets.symmetric(horizontal: 24.0, vertical: 12.0),
        decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(25.0),
        color: Colors.greenAccent,
        ),
        child: Row(
            mainAxisSize: MainAxisSize.min,
            children: [
                Icon(Icons.check),
                SizedBox(
                width: 12.0,
                ),
                Text("This is a Custom Toast"),
            ],
        ),
    );

    fToast.showToast(
        child: toast,
        gravity: ToastGravity.BOTTOM,
        toastDuration: Duration(seconds: 2),
    );
  }

// class SongsForAlbumScreen extends StatelessWidget {

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
                _showToast();
                // // var dbs = fetchDBS();
                // showDialog(
                //   context: context,
                //   // builder: (BuildContext context) => _buildPopupDialog(context),
                //   builder: _buildPopupDialog(),

                // );
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

// Future<List<dynamic>> fetchDBS() async {
//   final String apiUrl = "http://192.168.0.91:9090/AllPlaylists";
//   var result = await http.get(Uri.parse(apiUrl));
//   print(json.decode(result.body));
//   return json.decode(result.body);
  
// }


// class SongsForAlbumScreen extends StatefulWidget {
//   @override
//   _SongsForAlbumScreenState createState() => _SongsForAlbumScreenState();
// }

// class _SongsForAlbumScreenState extends State<_SongsForAlbumScreenState> {
//   FToast fToast;

//   @override
//   void initState() {
//     super.initState();
//     fToast = FToast();
//     fToast.init(context);
//   }

//   _showToast() {
//     Widget toast = Container(
//         padding: const EdgeInsets.symmetric(horizontal: 24.0, vertical: 12.0),
//         decoration: BoxDecoration(
//         borderRadius: BorderRadius.circular(25.0),
//         color: Colors.greenAccent,
//         ),
//         child: Row(
//             mainAxisSize: MainAxisSize.min,
//             children: [
//                 Icon(Icons.check),
//                 SizedBox(
//                 width: 12.0,
//                 ),
//                 Text("This is a Custom Toast"),
//             ],
//         ),
//     );

//     fToast.showToast(
//         child: toast,
//         gravity: ToastGravity.BOTTOM,
//         toastDuration: Duration(seconds: 2),
//     );
//   }
// }




// // class MyPlayListDrawer extends StatelessWidget {
// // // Widget _buildPopupDialog(BuildContext context) {

// //   @override
// //   Widget build(BuildContext context) {
// //     return AlertDialog(
// //       child: Container(
// //         child: FutureBuilder<List<dynamic>>(
// //           future: fetchDBS(),
// //           builder: (BuildContext context, AsyncSnapshot snapshot) {
// //               // print("this is playlistname");
// //               // print(snapshot.data[0]["PlayListName"]);
// //               if (snapshot.hasData) {
// //                 print(snapshot.data[0]["PlayListName"]);
// //                 print(snapshot.data.length);
// //                 // return 
// //                 Text(snapshot.data[0]["PlayListName"]);
// //               } else {
// //                 return CircularProgressIndicator();
// //               }
// //           },
// //         ),
// //       ),
// //     );
// //     actions: <Widget>[
// //       new FlatButton(
// //         onPressed: () {
// //           //Make post request to server to add song to selected playlist
// //           Navigator.of(context).pop();
// //         },
// //         textColor: Theme.of(context).primaryColor,
// //         child: const Text('Close'),
// //       ),
// //     ];

// //   }
// // }

//         // FutureBuilder<List<dynamic>>(
//         //   future: fetchDBS(),
//         //   builder: (BuildContext context, AsyncSnapshot snapshot) {
//         //     print("this is playlistname");
//         //     print(snapshot.data[0]["PlayListName"]);
//         //     if (snapshot.hasData) {
//         //       print(snapshot.data[0]["PlayListName"]);
//         //       print(snapshot.data.length);
//         //       return ListView.builder(
//         //         padding: const EdgeInsets.all(2),
//         //         itemCount: snapshot.data.length,
//         //         itemBuilder: (BuildContext context, int index) {
                
//         //         return 
//         //         // Text(snapshot.data[index]["PlayListName"]);
//         //         ElevatedButton(
//         //             style: ElevatedButton.styleFrom(textStyle: TextStyle(fontSize: 12)),
//         //             onPressed: () {
//         //               //add local storage as current playlist
//         //             },
//         //             child: Text(snapshot.data[index]["playlistname"]),
//         //           );
//         //         },
//         //       );
//         //     } else {
//         //       return CircularProgressIndicator();
//         //     }
//         //   },
//         // ),