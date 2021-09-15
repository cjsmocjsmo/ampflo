class Songz {
  const Songz ({
    this.dirpath,
    this.filename,
    this.extension,
    this.fileID,
    this.filesize,
    this.artist,
    this.artistID,
    this.album,
    this.albumID,
    this.title,
    this.genre,
    this.titlepage,
    this.picID,
    this.picDB,
    this.picPath,
    this.picHttpAddr,
    this.idx,
    this.httpaddr,
  });

  final String? dirpath;
  final String? filename;
  final String? extension;
  final String? fileID;
  final String? filesize;
  final String? artist;
  final String? artistID;
  final String? album;
  final String? albumID;
  final String? title;
  final String? genre;
  final String? titlepage;
  final String? picID;
  final String? picDB;
  final String? picPath;
  final String? picHttpAddr;
  final String? idx;
  final String? httpaddr;

  factory Songz.fromJson(Map<String, dynamic> json) {
    return Songz(
      dirpath: json["dirpath"] as String?,
      filename: json["filename"] as String?,
      extension: json['extension'] as String?,
      fileID: json['fileID'] as String?,
      filesize: json['filesize'] as String?,
      artist: json['artist'] as String?,
      artistID: json['artistID'] as String?,
      album: json['album'] as String?,
      albumID: json['albumID'] as String?,
      title: json['title'] as String?,
      genre: json['genre'] as String?,
      titlepage: json['titlepage'] as String?,
      picID: json['picID'] as String?,
      picDB: json['picDB'] as String?,
      picPath: json['picPath'] as String?,
      picHttpAddr: json['picHttpAddr'] as String?,
      idx: json['idx'] as String?,
      httpaddr: json['httpaddr'] as String?,
    );
  }
}