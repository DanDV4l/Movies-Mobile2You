import 'package:flutter/cupertino.dart';

class MoviesProvider extends ChangeNotifier {
  List _favorites = [];
  List _watched = [];
  String? _movieID;

  get favorites => _favorites;
  get watched => _watched;
  get movieID => _movieID;

  set favorites(var value) {
    _favorites.add(value);
    notifyListeners();
  }

  set watched(var value) {
    _watched.add(value);
    notifyListeners();
  }

  set movieID(var value) {
    _movieID = value;
    notifyListeners();
  }
}
