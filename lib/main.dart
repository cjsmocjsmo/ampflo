import 'package:flutter/material.dart';
import 'screens/mainscreen.dart';

import "screens/albumscreen.dart";
import "screens/artistscreen.dart";
import "screens/playlistscreen.dart";

void main() => runApp(AmpFlo());

class AmpFlo extends StatelessWidget {
  const AmpFlo({Key? key}) : super(key: key);

  static const String _title = "AmpFlo";

  Widget build(BuildContext context) {
    return MaterialApp(title: _title, initialRoute: '/', routes: {
      '/': (context) => MainScreen(),
      '/Albums': (context) => AlbumScreen(),
      '/Artists': (context) => ArtistScreen(),
      '/Playlists': (context) => PlaylistScreen(),
      
 
    });
  }
}