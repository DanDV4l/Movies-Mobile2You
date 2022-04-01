import 'package:http/http.dart' as http;
import 'dart:convert';

Future<Map<String, dynamic>> getMovieData({required id}) async {
  var _url = Uri.parse(
      'https://api.themoviedb.org/3/movie/$id?api_key=92b1aafffdc49b634f2d97a1e828d853&language=pt-BR');
  var _response = await http.get(_url);
  var _responseData = jsonDecode(_response.body);
  Map<String, dynamic> movieData = _responseData;
  return movieData;
}
