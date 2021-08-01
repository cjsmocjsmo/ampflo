import 'package:flutter/material.dart';
import 'screens/introscreen.dart';
import 'screens/artistscreen.dart';
import 'screens/albumsforartist.dart';
import 'screens/albumscreen.dart';
import 'screens/playerscreen.dart';
import 'screens/playlistsscreen.dart';

// import "screens/albumscreen.dart";
// import "screens/playlistscreen.dart";

void main() => runApp(AmpFlo());

class AmpFlo extends StatelessWidget {
  const AmpFlo({Key? key}) : super(key: key);

  static const String _title = "AmpFlo";

  Widget build(BuildContext context) {
    return MaterialApp(title: _title, initialRoute: '/', routes: {
      '/': (context) => IntroScreen(),
      '/Artists': (context) => ArtistScreen(),
      '/AlbumsForArtist': (context) => AlbumForArtistScreen(),
      '/Albums': (context) => AlbumScreen(),
      '/PlayLists': (context) => PlayListScreen(),
      '/Player': (context) => PlayerScreen(),
 
    },
    debugShowCheckedModeBanner: false,
    theme: ThemeData(
      primarySwatch: Colors.purple,
    ));
  }
}