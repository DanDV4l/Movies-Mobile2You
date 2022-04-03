import 'package:flutter/cupertino.dart';
import 'package:movies/models/movie.dart';

class MovieProvider extends ChangeNotifier {
  Movie? movie;
  int? id;
  List _favoriteList = [];
  List? _similarMovies;

  dynamic genres;

  get similarMovies => _similarMovies;
  set similarMovies(var value) {
    _similarMovies = value;
  }

  get favoriteList => _favoriteList;
  set favoriteList(var value) {
    _favoriteList.contains(value)
        ? _favoriteList.remove(value)
        : _favoriteList.add(value);
    notifyListeners();
  }
}
