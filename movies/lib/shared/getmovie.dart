import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:movies/models/movie.dart';

Future<Movie> getMovieData({required id}) async {
  var _url = Uri.parse(
      'https://api.themoviedb.org/3/movie/$id?api_key=92b1aafffdc49b634f2d97a1e828d853&language=pt-BR');
  var _response = await http.get(_url);
  var _responseData = jsonDecode(_response.body);

  Movie movieData = Movie(
      _responseData['id'],
      _responseData['title'],
      "https://image.tmdb.org/t/p/w500${_responseData['poster_path']}",
      _responseData['vote_count'],
      _responseData['popularity'],
      _responseData['release_date'],
      _responseData['genre_ids']);

  return movieData;
}
