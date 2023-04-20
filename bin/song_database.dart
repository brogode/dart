class SongDatabase {
  List<Map<String, dynamic>> songs = [
    {
      'index': 1,
      'title': 'Billie Eilish',
      'artist': 'when the party is over'
    },
    {
      'index': 2,
      'title': 'Iniko',
      'artist': 'jericho'
      
    },
    {
      'index': 3,
      'title': 'Bonnie Tyler',
      'artist': 'I need a hero'
      
    },
  ];

 
 findByIndex(int index) {
    var s = 'no song found';
    for (var song in songs) {
    if (song['index'] == index) {
      return song;
    }
  }
  return s ;
  }

  findByTitle(String title) {
    var s = 'no song found';
    for (var song in songs) {
    if (song['title'] == title) {
      return song;
    }
  }
  return s ;
  }
  

  findByArtist(String artist) {
    var s = 'no song found';
    for (var song in songs) {
    if (song['artist'] == artist) {
      return song;
    }
  }
  return s ;
  }

  
  void removeSong(int index) {
    songs.removeWhere((song) => song['index'] == index);
  }


  void addSong(String title, String artist) {
    int newIndex = songs.length + 1;
    songs.add({
      'index': newIndex,
      'title': title,
      'artist': artist,
      
    });
  }
}

void main(List<String> args) {
  var s = SongDatabase();
  print(s.findByIndex(1));  
  print(s.findByArtist('gdgash'));
}
