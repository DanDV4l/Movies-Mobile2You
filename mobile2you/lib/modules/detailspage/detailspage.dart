import 'package:flutter/material.dart';
import 'package:mobile2you/modules/detailspage/titleimagebox.dart';
import 'package:mobile2you/shared/getdata.dart';
import 'package:mobile2you/modules/detailspage/similarlist.dart';
import 'package:mobile2you/shared/elements/errorpage.dart';

class DetailsPage extends StatefulWidget {
  const DetailsPage({Key? key, required this.id}) : super(key: key);
  final String id;

  @override
  State<DetailsPage> createState() => _DetailsPageState();
}

class _DetailsPageState extends State<DetailsPage> {
  @override
  Widget build(BuildContext context) {
    return moviesLoadData(context, id: widget.id);
  }
}

Widget moviesLoadData(context, {required id}) {
  return FutureBuilder<Map<String, dynamic>>(
      future: getMovieData(id: id),
      builder: (context, snapshot) {
        switch (snapshot.connectionState) {
          case ConnectionState.none:
            return Container();
          case ConnectionState.waiting:
            return const Center(
              child: SizedBox(
                height: 35,
                width: 35,
                child: CircularProgressIndicator(
                  color: Colors.red,
                  backgroundColor: Colors.black,
                ),
              ),
            );
          case ConnectionState.active:
            return Container();
          case ConnectionState.done:
            var _movieData = snapshot.data!;
            if (_movieData['title'] == null) {
              return const ErrorPage();
            } else {
              return Scaffold(
                  backgroundColor: Colors.black,
                  appBar: buildTitleImageBox(context,
                      title: _movieData['title'],
                      posterURL:
                          'https://image.tmdb.org/t/p/w500${_movieData['poster_path']}',
                      likes: _movieData['vote_count'],
                      popularity: _movieData['popularity']),
                  body: similarContent(providerID: id));
            }
        }
      });
}
