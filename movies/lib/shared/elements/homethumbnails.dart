import 'package:flutter/material.dart';
import 'package:movies/models/movie.dart';
import 'package:movies/shared/getmovie.dart';

Widget homeThumbnailMovie(context, {id, setID}) {
  return Padding(
    padding: const EdgeInsets.all(5.0),
    child: SizedBox(
        child: FutureBuilder<Movie>(
      future: getMovieData(id: id),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return const SizedBox();
        }
        if (snapshot.connectionState == ConnectionState.done) {
          var _movieData = snapshot.data;
          return buildHomeThumbnail(
              image: _movieData!.posterPath, onTap: setID);
        }
        return Container(
          color: Colors.amber,
        );
      },
    )),
  );
}

Widget buildHomeThumbnail({image, onTap}) {
  return InkWell(
    child: ClipRRect(
      borderRadius: BorderRadius.all(Radius.circular(5)),
      child: Image.network(
        image,
        fit: BoxFit.fill,
        width: 125,
        height: 160,
      ),
    ),
    onTap: onTap,
  );
}
