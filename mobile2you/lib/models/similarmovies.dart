class SimilarMovie {
  int _id;
  String _title;
  String _releaseDate;
  String _posterPath;
  List _genreList;

  get id => _id;
  get title => _title;
  get releaseDate => _releaseDate;
  get posterPath => _posterPath;
  get genreList => _genreList;

  set id(var value) {
    _id = value;
  }

  set title(var value) {
    _title = title;
  }

  set releaseDate(var value) {
    _releaseDate = value;
  }

  set posterPath(var value) {
    _posterPath = value;
  }

  set genreList(var value) {
    _genreList = value;
  }

  SimilarMovie(this._id, this._title, this._posterPath, this._releaseDate,
      this._genreList);
}
