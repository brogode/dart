import 'package:http/http.dart' as http; 

  

void main() async { 

  Future<http.Response> fetchAlbum() { 

    return http.get(Uri.parse('https://jsonplaceholder.typicode.com/albums/1')); 

  } 

  var data = await fetchAlbum(); 

  print(data.body); 

} 