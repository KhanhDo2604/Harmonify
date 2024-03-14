class Song {
  final String title;
  final String artistId;
  final String artist;
  final String url;
  final String songImage;

  Song({
    required this.title,
    required this.artist,
    required this.artistId,
    required this.url,
    required this.songImage,
  });

  factory Song.fromJson(Map<String, dynamic> json) {
    return Song(
      title: json['title'],
      artist: json['artist'],
      artistId: json['artistId'],
      url: json['url'],
      songImage: json['songImage'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'title': title,
      'artist': artist,
      'artistId': artistId,
      'url': url,
      'songImage': songImage,
    };
  }
}
