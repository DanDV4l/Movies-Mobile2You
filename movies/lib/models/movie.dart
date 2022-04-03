class Movie {
  int _id;
  String _title;
  String _posterPath;
  int _voteCount;
  double _popularity;
  String _releaseDate;
  List? _genreList;
  List<Movie>? _similarMovies;

  get id => _id;
  get title => _title;
  get posterPath => _posterPath;
  get voteCount => _voteCount;
  get popularity => _popularity;
  get releaseDate => _releaseDate;
  get genreList => _genreList;
  get similarMovies => _similarMovies;

  set id(var value) {
    _id = value;
  }

  set title(var value) {
    _title = value;
  }

  set posterPath(var value) {
    _posterPath = "https://image.tmdb.org/t/p/w500$value";
  }

  set voteCount(var value) {
    _voteCount = value;
  }

  set popularity(var value) {
    _popularity = value;
  }

  set releaseDate(var value) {
    _releaseDate = value;
  }

  set genreList(var value) {
    _genreList = value;
  }

  set similarMovies(var value) {
    _similarMovies = value;
  }

  Movie(this._id, this._title, this._posterPath, this._voteCount,
      this._popularity, this._releaseDate, this._genreList);
}
