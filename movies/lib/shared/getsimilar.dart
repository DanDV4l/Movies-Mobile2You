import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:movies/models/movie.dart';
import 'package:movies/providers/movieprovider.dart';
import 'package:movies/shared/getgenres.dart';
import 'package:provider/provider.dart';

Future<List<Movie>> getSimilarMovie(context, {required id}) async {
  List<Movie> similarList = [];

  var _url = Uri.parse(
      'https://api.themoviedb.org/3/movie/$id/similar?api_key=92b1aafffdc49b634f2d97a1e828d853&language=pt-BR');
  var _response = await http.get(_url);
  var _responseData = jsonDecode(_response.body);
  for (var listItem in _responseData['results']) {
    Movie similar = Movie(
        listItem['id'],
        listItem['title'],
        'https://image.tmdb.org/t/p/h50${listItem['poster_path']}',
        listItem['vote_count'],
        listItem['popularity'],
        listItem['release_date'],
        findGenre(
            input: listItem['genre_ids'],
            alldata:
                Provider.of<MovieProvider>(context, listen: false).genres));

    similarList.add(similar);
  }

  return similarList;
}
