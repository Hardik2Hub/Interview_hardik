class Model {
  String? id;
  String? title;
  String? album;
  String? artist;
  String? genre;
  String? source;
  String? image;
  int? trackNumber;
  int? totalTrackCount;
  int? duration;
  String? site;

  Model(
      {this.id,
      this.title,
      this.album,
      this.artist,
      this.genre,
      this.source,
      this.image,
      this.trackNumber,
      this.totalTrackCount,
      this.duration,
      this.site});

  Model.fromJson(json) {
    id = json['id'];
    title = json['title'];
    album = json['album'];
    artist = json['artist'];
    genre = json['genre'];
    source = json['source'];
    image = json['image'];
    trackNumber = json['trackNumber'];
    totalTrackCount = json['totalTrackCount'];
    duration = json['duration'];
    site = json['site'];
  }
}
