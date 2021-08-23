import 'package:flutter/material.dart';
import 'songsforalbumscreen.dart';


class AddRandomForm extends StatefulWidget {
  @override
  _AddRandomFormState createState() => _AddRandomFormState();
}

class _AddRandomFormState extends State<AddRandomForm> {
//   Future<RandomPlaylist> createRandomPlaylist(String name, String songcount) async {
//     final http.Response response = await http.post(
//       'http://192.168.0.91:9090/CreateRandomPlaylist',
//       headers: <String, String>{
//         'Content-Type': 'application/json; charset=UTF-8',
//       },
//       body: jsonEncode(Map<String, String>{
//         'name': name,
//         'songcount': songcount,
//       }),
//     );

//     if (response.statusCode == 201) {
//       return RandomPlaylist.fromJson(jsonDecode(response.body));
//     } else {
//       throw Exception('Failed to create RandomPlaylist.');
//     }
// }


// class RandomPlaylist {
//   final String isCreated;

//   RandomPlaylist({required this.isCreated});

//   factory RandomPlaylist.fromJson(Map<String, dynamic> json) {
//     return RandomPlaylist(
//       isCreated: json['isCreated'],
//     );
//   }
// }




  final myController = TextEditingController();
  var playlistname = false;
  var songcount = false;

  var pln = "None";
  var sc = "None";

  @override
  void initState() {
    super.initState();

    // Start listening to changes.
    myController.addListener(_printLatestValue);
  }

  @override
  void dispose() {
    myController.dispose();
    super.dispose();
  }

  void _printLatestValue() {
    if (myController.text.length != 0) {
      songcount = true;
    }
    sc = myController.text;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Create Playlist'),
      ),
      drawer: MyDrawer(),
      body: Container(
        decoration: BoxDecoration(
          // color: Colors.lightGreenAccent.shade400,
          color: Colors.purpleAccent[200],
        ),
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            children: <Widget>[
              TextField(
                decoration: InputDecoration(
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.all(Radius.circular(20)),
                  ),
                  filled: true,
                  fillColor: Colors.white,
                  labelText: 'Playlist Name',
                ),
                onChanged: (text) {
                  if (text.length != 0) {
                    playlistname = true;
                    pln = text;
                  }
                },
              ),
              TextField(
                decoration: InputDecoration(
                  border: OutlineInputBorder(
                     borderRadius: BorderRadius.all(Radius.circular(20)),
                  ),
                  filled: true,
                  fillColor: Colors.white,
                  labelText: 'Song Count',
                ),
                controller: myController,
              ),
              //button goes here
              const SizedBox(height: 30),
            TextButton(
              style: TextButton.styleFrom(
                textStyle: const TextStyle(fontSize: 35),
                primary: Colors.black,
              ),
              onPressed: () {
                if (playlistname != false && songcount != false) {
                  // print(pln);
                  // print(sc);
                  Navigator.of(context).pop();
                }
                
              },
              child: const Text('Create'),
            ),
            ],
          ),
        ),
      ),
    );
  }
}

