import 'package:flutter/material.dart';
import 'package:mobile2you/provider/movieprovider.dart';
import 'package:mobile2you/shared/themes/appcolors.dart';
import 'package:mobile2you/shared/themes/textstyles.dart';
import 'package:provider/provider.dart';

PreferredSize buildTitleImageBox(context,
    {required title, required posterURL, required likes, required popularity}) {
  var _size = MediaQuery.of(context).size;
  double _boxHeight = _size.height * 0.6;

  return PreferredSize(
    preferredSize: Size.fromHeight(_boxHeight),
    child: Container(
        padding: const EdgeInsets.only(top: 40),
        height: _boxHeight,
        decoration: BoxDecoration(
          image:
              DecorationImage(image: NetworkImage(posterURL), fit: BoxFit.fill),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            buildBackButton(onPressed: () => Navigator.pop(context)),
            buildBoxBottomBar(
                getSize: _size,
                title: title,
                likes: likes,
                popularity: popularity)
          ],
        )),
  );
}

Widget buildBackButton({required onPressed}) {
  return Container(
    width: 38,
    height: 38,
    margin: const EdgeInsets.all(20),
    decoration: BoxDecoration(
        color: AppColors.background.withOpacity(0.7),
        borderRadius: const BorderRadius.all(Radius.circular(100))),
    child: IconButton(
        icon: const Icon(Icons.arrow_back_ios_new,
            color: AppColors.icon, size: 19),
        onPressed: onPressed),
  );
}

Widget buildBoxBottomBar(
    {required getSize, required title, required likes, required popularity}) {
  return Container(
    padding: const EdgeInsets.only(bottom: 8, left: 10),
    color: Colors.black,
    child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          shadowEffect(),
          buildTitleBar(
              getSize: getSize,
              title: title,
              likes: likes,
              popularity: popularity),
        ]),
  );
}

Widget shadowEffect() {
  return Container(
    height: 1,
    width: double.infinity,
    padding: const EdgeInsets.all(10),
    decoration: const BoxDecoration(boxShadow: [
      BoxShadow(
          color: AppColors.background,
          spreadRadius: 35,
          blurRadius: 15,
          offset: Offset(0, 0))
    ]),
  );
}

Widget buildTitleBar(
    {required getSize, required title, required likes, required popularity}) {
  return SizedBox(
    child: Column(
      children: [
        //title - start
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            SizedBox(
              width: getSize.width * 0.7,
              child: Text(
                title,
                textAlign: TextAlign.start,
                style: Styles.title,
              ),
            ),
            favoriteButton()
          ],
        ),
        //title - end

        //subtitle - start
        Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            const Icon(
              Icons.favorite,
              size: 16,
              color: AppColors.icon,
            ),
            Padding(
              padding: const EdgeInsets.fromLTRB(5, 0, 20, 0),
              child: Text(
                "$likes Likes",
                textAlign: TextAlign.start,
                style: Styles.subtitle,
              ),
            ),
            Transform.rotate(
              angle: -190,
              child: const Icon(Icons.contrast_outlined,
                  color: AppColors.icon, size: 16),
            ),
            Padding(
              padding: const EdgeInsets.fromLTRB(5, 0, 20, 0),
              child: Text(
                "$popularity Views",
                textAlign: TextAlign.start,
                style: Styles.subtitle,
              ),
            ),
            //const VerticalDivider(),
          ],
        )
        //subtitle - end
      ],
    ),
  );
}

Widget favoriteButton() {
  return Consumer<MoviesProvider>(
      builder: (BuildContext context, MoviesProvider value, Widget? child) {
    var _moviesProvider = Provider.of<MoviesProvider>(context, listen: false);

    return IconButton(
      icon: Icon(
        _moviesProvider.favorites!.contains(_moviesProvider.movieID)
            ? Icons.favorite
            : Icons.favorite_outline_sharp,
        color: AppColors.icon,
        size: 30,
      ),
      onPressed: () {
        _moviesProvider.favoriteControl();
      },
    );
  });
}
