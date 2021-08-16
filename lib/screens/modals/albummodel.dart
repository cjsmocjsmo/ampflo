class AlbumView{
  // final int _id;
  final String Artist;
  final String ArtistID;
  final String Album;
  final String AlbumID;
  final List<dynamic> Songs;
  final String AlbumPage;
  final String NumSongs;
  final String PicPath;
  final String Idx;

  AlbumView({this.Artist, this.AritstID, this.Album, this.AlbumID, this.Songs, this.AlbumPage, this.NumSongs, this.PicPath, this.Idx});
  
  factory ArtistView.fromJson(Map<String, dynamic> parsedJson) {
    return ArtistView(
      // _id:parsedJson['_id'],
      Artist:parsedJson['Artist'],
      ArtistID:parsedJson['ArtistID'],
      Album:parsedJson['Album'],
      AlbumID:parsedJson['AlbumID'],
      AlbumPage:parsedJson['AlbumPage'],
      Songs:Songs.fromJson['Songs']
      NumSongs:parsedJson['NumSongs'],
      PicPath:parsedJson['PicPath'],
      Idx:parsedJson['Idx'],
    );
  }
}

class Songs{
  // final int _id;
  final String DirPath;
  final String Filename;
  final String Extension;
  final String FileID;
  final String Artist;
  final String ArtistID;
  final String Album;
  final String AlbumID;
  final String Title;
  final String Genre;
  final String TitlePage;
  final String PicID;
  final String PicPath;
  final String PicHttpAddr;
  final String Idx;

  Songs({this.DirPath, this.Filename, this.Extension, this.FileID, this.Artist, this.ArtistID, this.Album, this.AlbumID, this.Tittle, this.Genre, this.TitlePage, this.PicID, this.PicPath, this.PicHttpAddr, this.Idx});

  factory Albums.fromJson(Map<String, dynamic> parsedJson) {
    return Albums(
    // _id:parsedJson['_id'],
    DirPath:parsedJson['DirPath'],
    Filename:parsedJson['Filename'],
    Extension:parsedJson['Filename'],
    FileID:parsedJson['FileID'],
    Artist:parsedJson['Artist'],
    ArtistID:parsedJson['ArtistID'],
    Album:parsedJson['Album'],
    AlbumID:parsedJson['AlbumID'],
    Title:parsedJson['Title'],
    Genre:parsedJson['Genre'],
    TitlePage:parsedJson['TitlePage'],
    PicID:parsedJson['PicID'],
    PicPath:parsedJson['PicPath'],
    PicHttpAddr:parsedJson['PicHttpAddr'],
    Idx:parsedJson['Idx'],
    );
  }

  
}