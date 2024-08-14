class Music {
  final String id;
  final String name;
  final int duration;
  final String artistName;
  final String albumName;
  final String releaseDate;
  final String albumImage;
  final String audio;
  final String audioDownload;

  Music({
    required this.id,
    required this.name,
    required this.duration,
    required this.artistName,
    required this.albumName,
    required this.releaseDate,
    required this.albumImage,
    required this.audio,
    required this.audioDownload,
  });

  factory Music.fromJson(Map<String, dynamic> json) {
    return Music(
      id: json['id'],
      name: json['name'],
      duration: json['duration'],
      artistName: json['artist_name'],
      albumName: json['album_name'],
      releaseDate: json['releasedate'],
      albumImage: json['album_image'],
      audio: json['audio'],
      audioDownload: json['audiodownload'],
    );
  }
}

