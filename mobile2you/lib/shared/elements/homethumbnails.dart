import 'package:flutter/material.dart';
import 'package:mobile2you/shared/getdata.dart';

Widget homeThumbnailMovie(context, {id, setID}) {
  return SizedBox(
      child: FutureBuilder<Map<String, dynamic>>(
    future: getMovieData(id: id),
    builder: (context, snapshot) {
      if (snapshot.connectionState == ConnectionState.waiting) {
        return const SizedBox();
      }
      if (snapshot.connectionState == ConnectionState.done) {
        var _movieData = snapshot.data;
        return buildHomeThumbnail(
            image:
                'https://image.tmdb.org/t/p/w500${_movieData!['poster_path']}',
            onTap: setID);
      }
      return Container(
        color: Colors.amber,
      );
    },
  ));
}

Widget buildHomeThumbnail({image, onTap}) {
  return InkWell(
    child: ClipRRect(
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
