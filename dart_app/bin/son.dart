class Song {
  int _id;
  String _title;
  String _artist;

  Song({required int id, required String title, required String artist})
      : this._id = id,
        this._title = title,
        this._artist = artist;

  int get id => this._id;
  set id(int value) => this._id = value;

  String get title => this._title;
  set title(String value) => this._title = value;

  String get artist => this._artist;
  set artist(String value) => this._artist = value;

  void play() {
    print("Playing ${this._title} by ${this._artist}");
  }
}

class Album {
  List<Song> _songs = [];

  List<Song> get songs => this._songs;

  void addSong(Song song) {
    this._songs.add(song);
  }

  void removeSong(Song song) {
    this._songs.remove(song);
  }

  Song? findByTitle(String title) {
    var song = this._songs.firstWhere((song) => song.title == title);//, orElse: () => null);
    return song;
  }

  @override
  String toString() {
    return "Album with ${this._songs.length} songs";
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
  } else {
    print("Song not found");
  }

  print(album.toString());
}
