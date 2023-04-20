class Song {
  int _id;
  String _title;
  String _artist;

  Song({required int id, required String title, required String artist})
      : _id = id,
        _title = title,
        _artist = artist;

  int get id => _id;
  set id(int value) => _id = value;

  String get title => _title;
  set title(String value) => _title = value;

  String get artist => _artist;
  set artist(String value) => _artist = value;

  void play() {
    print("Playing $title by $artist");
  }
}

class Album {
  List<Song> _songs = [];

  List<Song> get songs => _songs;

  void addSong(Song song) {
    _songs.add(song);
  }

  void removeSong(Song song) {
    _songs.remove(song);
  }

  //Song? 
  findByTitle(var title) {
   var song = _songs.firstWhere((song) => song.title == title);// ,orElse: () => null);
   if (song != null) {
    return song;

  }else
    return 'song not found';
  }
}
void main() {
  Song song1 = Song(id: 1, title: "Shape of You", artist: "Ed Sheeran");
  Song song2 = Song(id: 2, title: "Despacito", artist: "Luis Fonsi");
  Song song3 = Song(id: 3, title: "when the party is over", artist: "Billie Eilish");

  Album album = Album();
  album.addSong(song1);
  album.addSong(song2);
  album.addSong(song3);

  Song? foundSong = album.findByTitle("Shape of You");
  if (foundSong != null) {
    foundSong.play();
  }

  print(Album);
}

