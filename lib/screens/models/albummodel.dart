'package:flutter/material.dart';

Future<Album> fetchAlbum() async {
  final response = await http
      .get(Uri.parse('http://192.168.0.91:9090/InitAlbumInfo'));

  if (response.statusCode == 200) {
    // If the server did return a 200 OK response,
    // then parse the JSON.
    return Album.fromJson(jsonDecode(response.body));
  } else {
    // If the server did not return a 200 OK response,
    // then throw an exception.
    throw Exception('Failed to load Album');
  }
}

class Album {
  final string Album;
  final string Albumid;

  Album({
    required this.Album,
    required this.Albumid,
  });

  factory Album.fromJson(Map<String, dynamic> json) {
    return Album(
      Album: json['Album'],
      Albumid: json['AlbumID'],
    );
  }
}