import 'package:flutter/material.dart';
import 'package:mobile2you/provider/movieprovider.dart';
import 'package:mobile2you/shared/elements/homethumbnails.dart';
import 'package:mobile2you/shared/elements/textfield.dart';
import 'package:provider/provider.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  TextEditingController cMovieID = TextEditingController();

  @override
  Widget build(BuildContext context) {
    var _getScreenSize = MediaQuery.of(context).size;
    return Consumer<MoviesProvider>(
        builder: (BuildContext context, MoviesProvider value, Widget? child) {
      var moviesProvider = Provider.of<MoviesProvider>(context, listen: false);
      return Scaffold(
        backgroundColor: Colors.black,
        appBar: AppBar(
          toolbarHeight: 80,
          backgroundColor: Colors.red.shade900.withOpacity(0.8),
          centerTitle: true,
          actions: [
            TextButton(
                onPressed: () {
                  moviesProvider.movieID = cMovieID.text.toString();
                  cMovieID.clear();
                  Navigator.pushNamed(context, "/details");
                },
                child: const Text(
                  "OK",
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: 19,
                      fontWeight: FontWeight.bold),
                ))
          ],
          title: buildTextField(
              size: _getScreenSize,
              label: "ID do filme",
              controller: cMovieID,
              width: _getScreenSize.width * 0.80,
              numberOnly: true),
        ),
        body: Padding(
          padding: const EdgeInsets.all(12.0),
          child: SingleChildScrollView(
              child: SizedBox(
            width: _getScreenSize.width,
            child: Column(
              children: [
                const Text(
                  "FIXADOS PELO DESENVOLVEDOR",
                  style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                      fontSize: 17),
                ),
                Wrap(
                  children: [
                    homeThumbnailMovie(context, id: '2911', setID: () {
                      moviesProvider.movieID = '2911';
                      Navigator.pushNamed(context, '/details');
                    }),
                    homeThumbnailMovie(context, id: '888', setID: () {
                      moviesProvider.movieID = '888';
                      Navigator.pushNamed(context, '/details');
                    }),
                    homeThumbnailMovie(context, id: '440', setID: () {
                      moviesProvider.movieID = '440';
                      Navigator.pushNamed(context, '/details');
                    }),
                    homeThumbnailMovie(context, id: '2675', setID: () {
                      moviesProvider.movieID = '2675';
                      Navigator.pushNamed(context, '/details');
                    }),
                    homeThumbnailMovie(context, id: '4547', setID: () {
                      moviesProvider.movieID = '4547';
                      Navigator.pushNamed(context, '/details');
                    }),
                    homeThumbnailMovie(context, id: '772', setID: () {
                      moviesProvider.movieID = '772';
                      Navigator.pushNamed(context, '/details');
                    })
                  ],
                )
              ],
            ),
          )),
        ),
      );
    });
  }
}
