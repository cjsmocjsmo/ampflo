import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'artistscreen.dart';
import 'modals/albummodel.dart';

class AlbumScreen extends StatelessWidget {

  final String apiUrl = "http://192.168.0.91:9090/InitAlbumInfo";

  Future<List<dynamic>> fetchAlbums() async {
  // Future<AlbumView> fetchAlbums() async {
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
              // FutureBuilder<AlbumView>(
                future: fetchAlbums(),
                builder: (BuildContext context, AsyncSnapshot snapshot) {
                  if (snapshot.hasData) {
                    print(snapshot.data);
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
                            Navigator.of(context).pushNamed('/Songs', arguments: snapshot.data[index]["albumID"]);
                            
                          },
                          child: Card(
                            child: ListTile(
                              leading: Image.network(snapshot.data[index]["picHttpAddr"]),
                              title: Text(snapshot.data[index]["album"]),
                              tileColor: Colors.yellowAccent[200],
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