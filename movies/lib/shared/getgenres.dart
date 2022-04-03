import 'dart:convert';
import 'package:http/http.dart' as http;

Future<List<Map>> getGenres() async {
  List<Map> genres = [];

  var _url = Uri.parse(
      'https://api.themoviedb.org/3/genre/movie/list?api_key=92b1aafffdc49b634f2d97a1e828d853&language=pt-BR');
  var _response = await http.get(_url);
  var _responseData = json.decode(_response.body);
  for (var genreData in _responseData['genres']) {
    genres.add(genreData);
  }

  return genres;
}

findGenre({required alldata, required input}) {
  // List _getAllData = [
  //   {"id": 28, "name": "Ação"},
  //   {"id": 12, "name": "Aventura"},
  //   {"id": 16, "name": "Animação"},
  //   {"id": 35, "name": "Comédia"},
  //   {"id": 80, "name": "Crime"},
  //   {"id": 99, "name": "Documentário"},
  //   {"id": 18, "name": "Drama"},
  //   {"id": 10751, "name": "Família"},
  //   {"id": 14, "name": "Fantasia"},
  //   {"id": 36, "name": "História"},
  //   {"id": 27, "name": "Terror"},
  //   {"id": 10402, "name": "Música"},
  //   {"id": 9648, "name": "Mistério"},
  //   {"id": 10749, "name": "Romance"},
  //   {"id": 878, "name": "Ficção científica"},
  //   {"id": 10770, "name": "Cinema TV"},
  //   {"id": 53, "name": "Thriller"},
  //   {"id": 10752, "name": "Guerra"},
  //   {"id": 37, "name": "Faroeste"}
  // ];
  List _getAllData = alldata;
  List<String> _foundGenres = [];
  for (var genreID in input) {
    for (var genreData in _getAllData) {
      if (genreID == genreData['id']) {
        _foundGenres.add(genreData['name']);
      }
    }
  }
  return _foundGenres;
}
