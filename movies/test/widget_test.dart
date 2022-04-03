import 'package:movies/shared/getgenres.dart';
import 'package:movies/shared/getmovie.dart';

void main() async {
  var generos = await getGenres();
  var movieData = await getMovieData(id: 2911);

  print(generos);
  print(movieData);
  print(movieData.similarMovies);
}
