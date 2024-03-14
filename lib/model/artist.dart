class Artist {
  final String id;
  final String name;
  final String imageURL;
  final List<String> genre;

  Artist({
    required this.id,
    required this.name,
    required this.imageURL,
    required this.genre,
  });

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'name': name,
      'imageURL': imageURL,
      'genre': genre,
    };
  }

  factory Artist.fromJson(Map<String, dynamic> map) {
    return Artist(
      id: map['id'],
      name: map['name'],
      imageURL: map['imageURL'],
      genre: List<String>.from(map['genre']),
    );
  }
}
