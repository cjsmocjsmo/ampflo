import 'package:flutter/material.dart';
import 'screens/introscreen.dart';
import 'screens/artistscreen.dart';
import 'screens/albumsforartist.dart';
import 'screens/albumscreen.dart';
// import 'screens/albumscreen2.dart';

import 'screens/songsscreen.dart';

import 'screens/playerscreen.dart';
import 'screens/playlistsscreen.dart';
import 'screens/songsforalbumscreen.dart';

import 'screens/player2screen.dart';

import 'screens/addrandomplaylistform.dart';

import 'package:audio_service/audio_service.dart';
import 'package:audio_session/audio_session.dart';

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
      '/SongsForAlbum': (context) => SongsForAlbumScreen(),
      '/Albums': (context) => AlbumScreen(),
      '/Songs': (context) => SongsScreen(),
      '/PlayLists': (context) => PlayListScreen(),
      '/Player': (context) => PlayerScreen(),
      '/Player2': (context) => AudioServiceWidget(child: Player2Screen()),
      '/AddRandomForm': (context) => AddRandomForm(),
 
    },
    debugShowCheckedModeBanner: false,
    theme: ThemeData(
      primarySwatch: Colors.purple,
    ));
  }
}