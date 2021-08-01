class ArtistView {
  final int _id;
  final string Artist;
  final string ArtistID;
  final List<dynamic> Albums;
  final string Page;
  final string Idx;

  ArtistView({this._id, this.Artist, this.ArtistID, this.Albums, this.Page, this.Idx});
}

class Albums {
  final int _id;
  final string DirPath;
  final string Filename;
  final string Extension;
  final string FileID;
  final string Artist;
  final string ArtistID;
  final string Album;
  final string AlbumID;
  final string Title;
  final string Genre;
  final string TitlePage;
  final string PicID;
  final string PicPath;
  final string PicHttpAddr;
  final string Idx;

  Albums({this._id, this.DirPath, this.Filename, this.Extension, this.FileID, this.Artist, this.ArtistID, this.Album, this.AlbumID, this.Tittle, this.Genre, this.TitlePage, this.PicID, this.PicPath, this.PicHttpAddr, this.Idx})

  factory Albums.fromJson(Map<String, dynamic> parsedJson) {
    return Albums(
    _id:parsedJson['_id'],
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

  factory ArtistView.fromJson(Map<String, dynamic> parsedJson) {
    return ArtistView(
      _id:parsedJson['_id'],
      Artist:parsedJson['Artist'],
      ArtistID:parsedJson['ArtistID'],
      Albums:parsedJson['Albums'],
      Page:parsedJson['Page'],
      Idx:parsedJson['Idx'],
    );
  }
}