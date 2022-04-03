class Genres {
  int _id;
  String _genre;

  get id => _id;
  get genre => _genre;

  set id(var value) {
    _id = value;
  }

  set genre(var value) {
    _genre = value;
  }

  Genres(this._id, this._genre);
}
