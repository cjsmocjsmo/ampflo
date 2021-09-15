import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'artistscreen.dart';
import 'modals/albummodel.dart';

class AlbumScreen extends StatelessWidget {

  final String apiUrl = "http://192.168.0.91:9090/InitAlbum2Info";

  // Future<List<dynamic>> fetchAlbums() async {
  Future<AlbumView> fetchAlbums() async {
    var result;
    try {
      var result = await http.get(Uri.parse(apiUrl));
      print(json.decode(result.body));
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
          title: Text("Albums"),
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
                future: fetchAlbums(),
                builder: (BuildContext context, AsyncSnapshot snapshot) {
                  if (snapshot.hasData) {
                    return ListView.builder(
                      padding: const EdgeInsets.all(8),
                      itemCount: snapshot.data.length,
                      itemBuilder: (BuildContext context, int index) {
                        return GestureDetector(
                          onTap: () {
                            // print(snapshot.data[index]["albumID"]);
                            // String dirp = "/media/pi/PiTB/media/TVShows";
                            // String ap = dirp + snapshot.data[index]["tvfspath"];
                            // final String apiPU = "http://192.168.0.42:8181/OmxplayerPlayMediaReact?medPath=" + ap;
                            // playEpi(apiPU);;
                            // Navigator.of(context).pop();
                            
                          },
                          child: Card(
                            child: ListTile(
                              leading: Image.network(snapshot.data[index]["PicPath"]),
                              title: Text(snapshot.data[index]["Album"]),
                            ),
                          ),


                          // Container(
                          //   height: 75,
                          //   color: Colors.purpleAccent[200],
                          //   child:Center(
                          //     child: Text(
                          //       '${snapshot.data[index]['Album']}',
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