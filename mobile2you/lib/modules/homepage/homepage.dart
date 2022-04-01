import 'package:flutter/material.dart';
import 'package:mobile2you/modules/homepage/buildfavorite.dart';
import 'package:mobile2you/provider/movieprovider.dart';
import 'package:mobile2you/shared/elements/homethumbnails.dart';
import 'package:mobile2you/shared/elements/textfield.dart';
import 'package:mobile2you/shared/themes/appcolors.dart';
import 'package:mobile2you/shared/themes/textstyles.dart';
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
        backgroundColor: AppColors.background,
        appBar: AppBar(
          toolbarHeight: 80,
          backgroundColor: AppColors.primary.withOpacity(0.8),
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
                  style: Styles.buttons,
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
                moviesProvider.favorites!.isNotEmpty
                    ? Container(
                        margin: const EdgeInsets.only(bottom: 20),
                        padding: const EdgeInsets.all(10),
                        decoration: BoxDecoration(
                            color: Colors.grey.shade900,
                            borderRadius:
                                const BorderRadius.all(Radius.circular(8)),
                            border: Border.all(color: Colors.black, width: 1)),
                        child: Column(children: [
                          Text(
                            "FAVORITOS",
                            style: Styles.title,
                          ),
                          buildFavorite(context,
                              getScreenSize: _getScreenSize,
                              itemProvider: moviesProvider.favorites)
                        ]),
                      )
                    : const SizedBox(),
                Text(
                  "FIXADOS PELO DESENVOLVEDOR",
                  style: Styles.title,
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 20, bottom: 20),
                  child: Wrap(
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
                  ),
                ),
              ],
            ),
          )),
        ),
      );
    });
  }
}
