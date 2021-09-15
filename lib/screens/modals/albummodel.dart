import 'modals/songsmodel.dart';

class AlbumView {

  const AlbumView({
    this.Artist, 
    this.AritstID, 
    this.Album, 
    this.AlbumID, 
    this.Songs, 
    this.AlbumPage, 
    this.NumSongs, 
    this.PicPath, 
    this.Idx,
  });

  // final int _id;
  final String? Artist;
  final String? ArtistID;
  final String? Album;
  final String? AlbumID;
  final List<Songs>? Songs;
  final String? AlbumPage;
  final String? NumSongs;
  final String? PicPath;
  final String? Idx;

  
  
  factory AlbumView.fromJson(Map<String, dynamic> json) {
    return AlbumView(
      // _id: json['_id'],
      Artist: json['Artist'] as String?,
      ArtistID: json['ArtistID'] as String?,
      Album: json['Album'] as String?,
      AlbumID: json['AlbumID'] as String?,
      AlbumPage: json['AlbumPage'] as String?,

      Songs: json['Songs'] != null
        ? Songs.fromJson(
          json["Songs"] as Map<String, dynamic>)
        :
          null,

      NumSongs: json['NumSongs'] as String?,
      PicPath: json['PicPath'] as String?,
      Idx: json['Idx'] as String?,
    );
  }
}

