import 'package:flutter/material.dart';

Future<Artist> fetchArtist() async {
  final response = await http
      .get(Uri.parse('http://192.168.0.91:9090/InitArtistInfo'));

  if (response.statusCode == 200) {
    // If the server did return a 200 OK response,
    // then parse the JSON.
    return Artist.fromJson(jsonDecode(response.body));
  } else {
    // If the server did not return a 200 OK response,
    // then throw an exception.
    throw Exception('Failed to load Artist');
  }
}

class Artist {
  final String artist;
  final String artistid;

  Artist({
    required this.artist,
    required this.artistid,
  });

  factory Artist.fromJson(Map<String, dynamic> json) {
    return Artist(
      artist: json['artist'],
      artistid: json['artistID'],
    );
  }
}