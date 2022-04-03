import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:movies/modules/detailspage/elements/imagebox.dart';
import 'package:movies/modules/detailspage/elements/similarlist.dart';
import 'package:movies/providers/movieprovider.dart';
import 'package:movies/providers/similarprovider.dart';
import 'package:movies/shared/themes/appcolors.dart';
import 'package:movies/shared/themes/textstyles.dart';
import 'package:provider/provider.dart';

class DetailsPage extends StatelessWidget {
  const DetailsPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Consumer<MovieProvider>(
      builder: (context, MovieProvider value, Widget? child) {
        var _dataProvider = Provider.of<MovieProvider>(context, listen: false);
        var _similarMovie =
            Provider.of<SimilarMovieProvider>(context, listen: false)
                .similarMovies;
        return Scaffold(
          backgroundColor: AppColors.background,
          appBar: buildImageBox(context,
              screenSize: MediaQuery.of(context).size,
              dataProvider: _dataProvider, backFunction: () {
            Navigator.pop(context);
          }),
          body: buildSimilarList(context, providerData: _similarMovie),
        );
      },
    );
  }
}
