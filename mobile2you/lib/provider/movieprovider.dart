// ignore_for_file: prefer_final_fields, duplicate_ignore

import 'package:flutter/cupertino.dart';

class MoviesProvider extends ChangeNotifier {
  // ignore: prefer_final_fields
  List _favorites = [];
  List _watched = [];
  String? _movieID;
  String? _similarID;

  get favorites => _favorites;
  get watched => _watched;
  get movieID => _movieID;
  get similarID => _similarID;

  set favorites(var value) {
    _favorites.contains(value)
        ? _favorites.remove(value)
        : _favorites.add(value);
    notifyListeners();
  }

  set watched(var value) {
    _watched.contains(value) ? _watched.remove(value) : _watched.add(value);
    notifyListeners();
  }

  set movieID(var value) {
    _movieID = value;
    notifyListeners();
  }

  set similarID(var value) {
    _similarID = value;
    notifyListeners();
  }

  favoriteControl() {
    favorites = movieID;
  }

  watchedControl() {
    watched = similarID;
    notifyListeners();
  }
}
