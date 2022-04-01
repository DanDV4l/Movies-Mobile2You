class Movie {
  String _title;
  String _posterPath;
  int _voteCount;
  double _poplarity;

  get title => _title;
  get posterPath => _posterPath;
  get voteCount => _voteCount;
  get popularity => _poplarity;

  set title(var value) {
    _title = value;
  }

  set posterPath(var value) {
    _posterPath = value;
  }

  set voteCount(var value) {
    _voteCount = value;
  }

  set popularity(var value) {
    _poplarity = value;
  }

  Movie(this._title, this._posterPath, this._voteCount, this._poplarity);
}
