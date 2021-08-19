import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'artistscreen.dart';

class AlbumForArtistScreen extends StatelessWidget {

  Future<List<dynamic>> fetchAlbums(apiUrl) async {
    final result = await http.get(Uri.parse(apiUrl));
    // print(json.decode(result.body));
    return json.decode(result.body);
  }

  @override
  Widget build(BuildContext context) {
    final artistID = ModalRoute.of(context)?.settings.arguments;
    final String apiUrl = "http://192.168.0.91:9090/AlbumsForArtist?selected=$artistID";
    print(apiUrl);

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
                future: fetchAlbums(apiUrl),
                builder: (BuildContext context, AsyncSnapshot snapshot) {
                  
                  if (snapshot.hasData) {
                    print(snapshot.data);
                    print(snapshot.data[0]["numsongs"]);
                    print(snapshot.data[0]["picHttpAddr"]);
                    print(snapshot.data.length);
                    return ListView.builder(
                      padding: const EdgeInsets.all(8),
                      itemCount: snapshot.data.length,
                      itemBuilder: (BuildContext context, int index) {
                        return GestureDetector(
                          onTap: () {
                            
                            // String dirp = "/media/pi/PiTB/media/TVShows";
                            // String ap = dirp + snapshot.data[index]["tvfspath"];
                            // final String apiPU = "http://192.168.0.42:8181/OmxplayerPlayMediaReact?medPath=" + ap;
                            // playEpi(apiPU);
                            // Navigator.of(context).pop();
                            Navigator.of(context).pushNamed('/SongsForAlbum', arguments: snapshot.data[index]["albumID"]);
                          },
                          child: Card(
                            child: ListTile(
                              leading: Image.network(snapshot.data[index]["picHttpAddr"]),
                              title: Text(snapshot.data[index]["album"]),
                              subtitle: Text('${snapshot.data[index]['numsongs']} songs'),
                              trailing: Icon(Icons.chevron_right),
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