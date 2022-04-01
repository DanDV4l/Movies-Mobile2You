import 'package:http/http.dart' as http;
import 'dart:convert';

import 'package:mobile2you/models/genres.dart';
import 'package:mobile2you/models/similarmovies.dart';
import 'package:mobile2you/provider/movieprovider.dart';
import 'package:provider/provider.dart';

Future<Map<String, dynamic>> getMovieData({required id}) async {
  var _url = Uri.parse(
      'https://api.themoviedb.org/3/movie/$id?api_key=92b1aafffdc49b634f2d97a1e828d853&language=pt-BR');
  var _response = await http.get(_url);
  var _responseData = jsonDecode(_response.body);
  Map<String, dynamic> movieData = _responseData;

  return movieData;
}

Future<List<Genres>> getAllGenresData() async {
  List<Genres> genres = [];
  var _url = Uri.parse(
      'https://api.themoviedb.org/3/genre/movie/list?api_key=92b1aafffdc49b634f2d97a1e828d853&language=pt-BR');
  var _response = await http.get(_url);
  var _responseData = jsonDecode(_response.body);
  for (var genreData in _responseData['genres']) {
    Genres data = Genres(genreData['id'], genreData['name']);
    genres.add(data);
  }

  return genres;
}

Future<List<String>> findGenre(List input) async {
  List _getAllData = await getAllGenresData();
  List<String> _foundGenres = [];
  for (var genre in input) {
    for (var i in _getAllData) {
      if (genre == i.id) {
        _foundGenres.add(i.genre);
      }
    }
  }
  return _foundGenres;
}

Future<List<SimilarMovie>> getSimilarMovie({required id}) async {
  List<SimilarMovie> similarList = [];

  var _url = Uri.parse(
      'https://api.themoviedb.org/3/movie/$id/similar?api_key=92b1aafffdc49b634f2d97a1e828d853&language=pt-BR');
  var _response = await http.get(_url);
  var _responseData = jsonDecode(_response.body);
  for (var listItem in _responseData['results']) {
    SimilarMovie similar = SimilarMovie(
        listItem['id'],
        listItem['title'],
        "https://image.tmdb.org/t/p/w500${listItem['poster_path']}",
        listItem['release_date'],
        listItem['genre_ids']);
    similarList.add(similar);
  }

  return similarList;
}
