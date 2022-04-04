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
