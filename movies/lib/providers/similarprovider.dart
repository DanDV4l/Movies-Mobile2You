import 'package:flutter/cupertino.dart';

class SimilarMovieProvider extends ChangeNotifier {
  List _similarMovies = [];

  get similarMovies => _similarMovies;
  set similarMovies(var value) {
    _similarMovies = value;
  }
}
