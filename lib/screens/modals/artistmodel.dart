class ArtistView {
  String? artist;
  String? artistID;
  List<Album>? albums;
  String? page;
  String? idx;

  ArtistView({this.artist, this.artistID, this.albums, this.page, this.idx});
  
  factory ArtistView.fromJson(Map<String, dynamic> parsedJson) {
    var list = parsedJson['Albums'] as List;
    // print(list.runtimeType); //returns List<dynamic>
    List<Album> albumsList = list.map((i) => Album.fromJson(i)).toList();
    print("artistview complete");
    return ArtistView(
      artist:parsedJson['Artist'],
      artistID:parsedJson['ArtistID'],
      albums: albumsList,
      page:parsedJson['Page'],
      idx:parsedJson['Idx'],
    );
  }
}

class Album {
  String? id;
  String? dirPath;
  String? filename;
  String? ext;
  String? fileID;
  String? artist;
  String? artistID;
  String? album;
  String? albumID;
  String? title;
  String? genre;
  String? titlePage;
  String? picID;
  String? picPath;
  String? picHttpAddr;
  String? idx;

  Album({this.id, this.dirPath, this.filename, this.ext, this.fileID, this.artist, this.artistID, 
    this.album, this.albumID, this.title, this.genre, this.titlePage, this.picID, 
    this.picPath, this.picHttpAddr, this.idx});

  factory Album.fromJson(Map<String, dynamic> parsedJson) {
    return Album(
    id:parsedJson['_id'],
    dirPath:parsedJson['dirPath'],
    filename:parsedJson['filename'],
    ext:parsedJson['ext'],
    fileID:parsedJson['fileID'],
    artist:parsedJson['artist'],
    artistID:parsedJson['artistID'],
    album:parsedJson['album'],
    albumID:parsedJson['albumID'],
    title:parsedJson['title'],
    genre:parsedJson['genre'],
    titlePage:parsedJson['titlePage'],
    picID:parsedJson['picID'],
    picPath:parsedJson['picPath'],
    picHttpAddr:parsedJson['picHttpAddr'],
    idx:parsedJson['idx'],
    );
  }
}