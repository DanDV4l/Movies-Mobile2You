import 'package:flutter/material.dart';
import 'package:movies/shared/themes/appcolors.dart';
import 'package:movies/shared/themes/textstyles.dart';

PreferredSize buildImageBox(context,
    {required screenSize, required dataProvider, required backFunction}) {
  double _boxSize = screenSize.height * 0.50;

  return PreferredSize(
      child: Stack(children: [
        ClipRect(
          child: Image.network(
            dataProvider.movie.posterPath,
            fit: BoxFit.cover,
            width: screenSize.width,
          ),
        ),
        Column(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            buildShadow(),
            Container(
              padding: const EdgeInsets.only(left: 12, right: 12),
              width: screenSize.width,
              color: AppColors.background,
              child: Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      SizedBox(
                        width: screenSize.width * 0.7,
                        child: Text(
                          dataProvider.movie.title,
                          textAlign: TextAlign.start,
                          style: Styles.title,
                        ),
                      ),
                      IconButton(
                        icon: Icon(
                            dataProvider.favoriteList.contains(dataProvider.id)
                                ? Icons.favorite
                                : Icons.favorite_border_rounded,
                            color: Colors.white,
                            size: 30),
                        onPressed: () {
                          dataProvider.favoriteList = dataProvider.id;
                        },
                      )
                    ],
                  ),
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
                          "${dataProvider.movie.voteCount} Likes",
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
                          "${dataProvider.movie.popularity} Views",
                          textAlign: TextAlign.start,
                          style: Styles.subtitle,
                        ),
                      ),
                      //const VerticalDivider(),
                    ],
                  )
                ],
              ),
            )
          ],
        ),
        Positioned(
            top: 50,
            left: 5,
            child: buildBackButton(backFunction: backFunction))
      ]),
      preferredSize: Size.fromHeight(_boxSize));
}

Widget buildShadow() {
  return Container(
      height: 1,
      width: double.infinity,
      padding: const EdgeInsets.all(10),
      decoration: const BoxDecoration(boxShadow: [
        BoxShadow(
            color: AppColors.background,
            spreadRadius: 50,
            blurRadius: 20,
            offset: Offset(0, 25))
      ]));
}

Widget buildBackButton({required backFunction}) {
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
        onPressed: backFunction),
  );
}
