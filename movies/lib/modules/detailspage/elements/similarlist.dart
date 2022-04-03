import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:movies/models/movie.dart';
import 'package:movies/providers/movieprovider.dart';
import 'package:movies/shared/getsimilar.dart';
import 'package:movies/shared/themes/textstyles.dart';
import 'package:provider/provider.dart';

Widget buildSimilarList(context, {id}) {
  return FutureBuilder<List<Movie>>(
      future: getSimilarMovie(context, id: id),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.done) {
          var similar = snapshot.data;
          return ListView.builder(
              physics: const BouncingScrollPhysics(
                  parent: AlwaysScrollableScrollPhysics()),
              itemCount: similar!.length,
              itemBuilder: (context, index) {
                return ListTile(
                  leading: Image.network(similar[index].posterPath),
                  title: Text(
                    similar[index].title,
                    style: Styles.listTitle,
                  ),
                  subtitle: Text(
                    "${similar[index].releaseDate.toString().split('-')[0]}  ${similar[index].genreList.toString().replaceFirst('[', '').replaceFirst(']', '')}",
                    style: Styles.subtitle,
                  ),
                  trailing: Provider.of<MovieProvider>(context, listen: false)
                          .favoriteList
                          .contains(similar[index].id)
                      ? const Icon(CupertinoIcons.checkmark_circle_fill,
                          color: Colors.white, size: 15)
                      : null,
                  onTap: () {
                    Provider.of<MovieProvider>(context, listen: false).id =
                        similar[index].id;
                    Navigator.pushReplacementNamed(context, "/load");
                  },
                );
              });
        }

        return const SizedBox();
      });
}
