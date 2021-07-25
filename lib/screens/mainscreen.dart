import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

// class MainContentScreen extends StatelessWidget {
//   @override 
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text(
//           "Ampflo",
//           style: TextStyle(color: Colors.white),
//         ),
//         backgroundColor: Colors.lightGreen.shade900,
//       ),
//       body: Container(
//         decoration: BoxDecoration(
//           color: Colors.lightGreenAccent.shade400,
//         ),
//         child: Column(
//           children: <Widget>
//           [
//             Container(
//               padding: const EdgeInsets.all(25.0),
//               alignment: Alignment.center,
//               child: Image.asset('images/two.jpg'),
//             ),
//             Container(
//               padding: const EdgeInsets.all(25.0),
//               alignment: Alignment.center,
//               child: ElevatedButton(
//                   style: ElevatedButton.styleFrom(
//                     onPrimary: Colors.white,
//                     primary: Colors.lightGreen.shade900,
//                     side: BorderSide(color: Colors.black, width: 2),
//                     elevation: 20,
//                     minimumSize: Size(150, 50)
//                   ),
//                   child: Text(
//                     'Enter At Your Own Risk',
//                     style: TextStyle(
//                       color: Colors.white,
//                       fontSize: 18.0,
//                     )
//                   ),
//                   onPressed: () {
//                     Navigator.pushNamed(
//                       context,
//                       '/Home'
//                     );
//                   },
//                 ),
//             ),
//             Container(
//               child: Text(
//                     'This is main screen',
//                     style: TextStyle(
//                       color: Colors.white,
//                       fontSize: 18.0,
//                     )
//                   ),
//             )
//           ]
//         )
//       )
//     );
//   }
// }








// import 'tvshows/alienworldscard.dart';
// import 'tvshows/alteredcarboncard.dart';
// import 'tvshows/badbatchcard.dart';
// import 'tvshows/discoverycard.dart';
// import 'tvshows/enterprisecard.dart';
// import 'tvshows/falconwintersoldiercard.dart';
// import 'tvshows/forallmankindcard.dart';
// import 'tvshows/lostinspacecard.dart';
// import 'tvshows/lowerdeckscard.dart';
// import 'tvshows/mandaloriancard.dart';
// import 'tvshows/nextgencard.dart';
// import 'tvshows/orvillecard.dart';
// import 'tvshows/picardcard.dart';
// import 'tvshows/raisedbywolvescard.dart';
// import 'tvshows/voyagercard.dart';
// import 'tvshows/startrektvcard.dart';
// import 'tvshows/wandavisioncard.dart';
// import 'tvshows/lokicard.dart';


final List<String> movies = <String>[
  'Action',
  'Bruce Willis',
  'Cartoons',
  'Comedy',
  'Drama',
  'Documentary',
  'Fantasy',
  'Godzilla',
  'Harry Potter',
  'Indiana Jones',
  'Jurassic Park',
  'John Wick',
  'John Wayne',
  'Kings Men',
  'Men In Black',
  'Misc',
  'Pirates',
  'Riddick',
  'Star Wars',
  'Star Trek',
  'Super Heros',
  'SciFi',
  'Tom Cruize',
  'Tremors',
  'The Rock',
  'X-Men',
];

// final List<String> tvShows = <String>[
//   'Altered Carbon',
//   'Alien Worlds',
//   'Discovery',
//   'Enterprise',
//   'For All Man Kind',
//   'Last Ship',
//   'Lost In Space',
//   'Lower Decks',
//   'Mandalorian',
//   'Next Generation',
//   'Orville',
//   'Picard',
//   'Raised By Wolves',
//   'Sean Carroll',
//   'SpaceTime',
//   'Star Trek TV',
//   'Falcon Winter Soldier',
//   'Voyager',
//   'WandaVision',
//   'Invincible',
//   'The Bad Batch',
//   'Loki'
// ];

class MainScreen extends StatelessWidget {

  Future<void> stopMov(stopURL) async {
    
    var resultStop = await http.get(Uri.parse(stopURL));
    return json.decode(resultStop.body);

  }

  Future<void> nextMov(nextURL) async {
    
    var resultNext = await http.get(Uri.parse(nextURL));
    return json.decode(resultNext.body);

  }

  Future<void> previousMov(previousURL) async {
    
    var resultPrevious = await http.get(Uri.parse(previousURL));
    return json.decode(resultPrevious.body);

  }

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 3,
      child: Scaffold(
        appBar: AppBar(
          title: Text("AmpFlo"),
          // backgroundColor: Colors.lightGreen[900],
          bottom: TabBar(
            tabs: [
              Tab(text: "Artists"),
              Tab(text: "Albums"),
              Tab(text: "Playlists")
              
            ],
          ),
        ),
        bottomNavigationBar: BottomAppBar(
          color: Colors.lightGreen[900],
          child: Row(
            children: [
              Spacer(),
              TextButton(
                style: TextButton.styleFrom(
                  textStyle: const TextStyle(fontSize: 20),
                ),
                onPressed: () {
                  Navigator.pushNamed(
                    context,
                    '/Player'
                  );
                },
                child: Text(
                    'Player',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 22.0,
                    )
                  ),
              ),
              Spacer(),
              // IconButton(
              //   icon: Icon(Icons.skip_previous, color: Colors.white), 
              //   onPressed: () {
              //     // final String apiPrevious = "http://192.168.0.42:8181/Previous";
              //     // previousMov(apiPrevious);
              //   },
              // ),
              // Spacer(),
              // IconButton(
              //   icon: Icon(Icons.skip_next, color: Colors.white), 
              //   onPressed: () {
              //     // final String apiNext = "http://192.168.0.42:8181/Next";
              //     // nextMov(apiNext);
              //   },
              // ),
              // Spacer(),
            ],
          ),
        ),
        floatingActionButton:
          FloatingActionButton(
          child: Icon(Icons.close_sharp), 
          onPressed: () { 
            // final String apiStop = "http://192.168.0.42:8181/Stop";
            // stopMov(apiStop); 
          }
        ),
        floatingActionButtonLocation:
            FloatingActionButtonLocation.endFloat,
        body: Container(
          decoration: BoxDecoration(
            color: Colors.lightGreenAccent.shade400,
          ),
          child: TabBarView(
            children: [
              Container(
              child: Text(
                    'This is Intro screen',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 18.0,
                    )
                  ),
            ),
            Container(
              child: Text(
                    'This is Intro screen',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 18.0,
                    )
                  ),
            ),
             Container(
              child: Text(
                    'This is Intro screen',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 18.0,
                    )
                  ),
            ), // moviesListView,
              // tvShowsListView(context),
            ],
          ),
        ),
      )
    );
  }
  void stop(apath) async{
    final stop = await stopMov(apath);
    return stop;
  }
}

Widget moviesListView = ListView.builder(
  padding: const EdgeInsets.all(10.0),
  itemCount: movies.length,
  itemBuilder: (BuildContext context, int index) {
    return 
    InkWell(
      splashColor: Colors.red,
      // onTap: () {}, // button pressed
      child: Container(
        height: 50,
        color: Colors.amber[400],
        child: Center(
            child: Text('${movies[index]}',
            style: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 28.0,
            )
          )
        ),
      ),
      onTap: () {
        // Navigator.pushNamed(context, '/${movies[index]}');
      },
    );
  }
);

Widget tvShowsListView(BuildContext context) {
  return ListView(
  shrinkWrap: true,
  padding: const EdgeInsets.all(10.0),
  children: <Widget>[
    // AlienWorldsCard(),
    // AlteredCarbonCard(),
    // BadBatchCard(),
    // DiscoveryCard(),
    // EnterpriseCard(),
    // FalconWinterSoldierCard(),
    // ForAllManKindCard(),
    // LostInSpaceCard(),
    // LokiCard(),
    // LowerDecksCard(),
    // MandalorianCard(),
    // NextGenCard(),
    // OrvilleCard(),
    // PicardCard(),
    // RaisedByWolvesCard(),
    // StarTrekTVCard(),
    // VoyagerCard(),
    // WandaVisionCard(),
  ]);
}


// This works DONT DELETE
// Widget tvShowsListView = ListView.builder(
//   padding: const EdgeInsets.all(10.0),
//   itemCount: tvShows.length,
//   itemBuilder: (BuildContext context, int index) {
//     return InkWell(
//       child: Container(
//         height: 50,
//         color: Colors.amber[400],
//         child: Center(
//             child: Text('${tvShows[index]}',
//             style: TextStyle(
//               fontWeight: FontWeight.bold,
//               fontSize: 22.0,
//             )
//           )
//         ),
//       ),
//       onTap: () {
//         Navigator.pushNamed(
//           context,
//           '/${tvShows[index]}',
//         );
//       },
//     );
//   }
// );




