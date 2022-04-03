import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:movies/models/movie.dart';
import 'package:movies/providers/movieprovider.dart';
import 'package:movies/shared/getmovie.dart';
import 'package:provider/provider.dart';

class LoadingPage extends StatefulWidget {
  const LoadingPage({Key? key}) : super(key: key);

  @override
  State<LoadingPage> createState() => _LoadingPageState();
}

class _LoadingPageState extends State<LoadingPage> {
  @override
  Widget build(BuildContext context) {
    return FutureBuilder<Movie>(
      future: getMovieData(
          id: Provider.of<MovieProvider>(context, listen: true).id),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.none) {
          return const SizedBox();
        }
        if (snapshot.connectionState == ConnectionState.waiting) {
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
        }
        if (snapshot.connectionState == ConnectionState.active) {
          return const SizedBox();
        }
        if (snapshot.connectionState == ConnectionState.done) {
          var data = snapshot.data;

          var provider = Provider.of<MovieProvider>(context, listen: false);

          provider.movie = data;

          SchedulerBinding.instance?.addPostFrameCallback((_) {
            Navigator.pushReplacementNamed(context, "/details");
          });
        }
        return const SizedBox();
      },
    );
  }
}
