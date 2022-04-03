import 'package:flutter/material.dart';
import 'package:movies/modules/homepage/buildfavorite.dart';
import 'package:movies/providers/movieprovider.dart';
import 'package:movies/shared/elements/homethumbnails.dart';
import 'package:movies/shared/elements/textfield.dart';
import 'package:movies/shared/getgenres.dart';
import 'package:movies/shared/getmovie.dart';
import 'package:movies/shared/themes/appcolors.dart';
import 'package:movies/shared/themes/textstyles.dart';
import 'package:provider/provider.dart';

TextEditingController cMovieID = TextEditingController();

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Consumer(
      builder: (BuildContext context, MovieProvider value, Widget? child) {
        return FutureBuilder(
          future: getGenres(),
          builder: (context, snapshot) {
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
            if (snapshot.connectionState == ConnectionState.done) {
              final fixGenres = snapshot.data;

              Provider.of<MovieProvider>(context, listen: false).genres =
                  fixGenres;
              var movieProvider =
                  Provider.of<MovieProvider>(context, listen: false);

              return Scaffold(
                  backgroundColor: AppColors.background,
                  appBar: AppBar(
                    toolbarHeight: 80,
                    backgroundColor: AppColors.background,
                    centerTitle: true,
                    actions: [
                      TextButton(
                          onPressed: () async {
                            movieProvider.id = int.parse(cMovieID.text);
                            try {
                              movieProvider.movie = await getMovieData(
                                  id: int.parse(cMovieID.text));
                              Navigator.pushNamed(context, "/details");
                            } catch (err) {
                              Navigator.pushNamed(context, "/error");
                            }

                            cMovieID.clear();
                          },
                          child: const Text(
                            "OK",
                            style: Styles.buttons,
                          ))
                    ],
                    title: buildTextField(
                        size: MediaQuery.of(context).size,
                        label: "Buscar filme por ID",
                        controller: cMovieID,
                        width: MediaQuery.of(context).size.width * 0.80,
                        numberOnly: true),
                  ),
                  body: Padding(
                    padding: const EdgeInsets.all(0),
                    child: SingleChildScrollView(
                        physics: const BouncingScrollPhysics(
                            parent: AlwaysScrollableScrollPhysics()),
                        child: Column(children: [
                          buildFavorite(context,
                              getScreenSize: MediaQuery.of(context).size,
                              itemProvider: movieProvider.favoriteList),
                          Padding(
                            padding:
                                const EdgeInsets.only(top: 20.0, bottom: 10),
                            child: Row(
                              children: [
                                const Icon(Icons.push_pin_outlined,
                                    color: Colors.red, size: 30),
                                const VerticalDivider(),
                                Text("Fixados pelo desenvolvedor",
                                    style: Styles.homeTitle,
                                    textAlign: TextAlign.start),
                              ],
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(top: 0, bottom: 20),
                            child: Wrap(
                              children: [
                                homeThumbnailMovie(context, id: 2911,
                                    setID: () {
                                  movieProvider.id = 2911;
                                  Navigator.pushNamed(context, '/load');
                                }),
                                homeThumbnailMovie(context, id: 888, setID: () {
                                  movieProvider.id = 888;
                                  Navigator.pushNamed(context, '/load');
                                }),
                                homeThumbnailMovie(context, id: 372058,
                                    setID: () {
                                  movieProvider.id = 372058;
                                  Navigator.pushNamed(context, '/load');
                                }),
                                homeThumbnailMovie(context, id: 2675,
                                    setID: () {
                                  movieProvider.id = 2675;
                                  Navigator.pushNamed(context, '/load');
                                }),
                                homeThumbnailMovie(context, id: 496243,
                                    setID: () {
                                  movieProvider.id = 496243;
                                  Navigator.pushNamed(context, '/load');
                                }),
                                homeThumbnailMovie(context, id: 772, setID: () {
                                  movieProvider.id = 772;
                                  Navigator.pushNamed(context, '/load');
                                })
                              ],
                            ),
                          ),
                        ])),
                  ));
            }
            return const SizedBox();
          },
        );
      },
    );
  }
}
