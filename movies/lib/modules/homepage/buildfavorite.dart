import 'package:flutter/material.dart';
import 'package:movies/providers/movieprovider.dart';
import 'package:movies/shared/elements/homethumbnails.dart';
import 'package:movies/shared/themes/textstyles.dart';

import 'package:provider/provider.dart';

Widget buildFavorite(context, {getScreenSize, itemProvider}) {
  return itemProvider!.length > 0
      ? Column(
          children: [
            Padding(
              padding: const EdgeInsets.fromLTRB(0, 10, 0, 0),
              child: Row(
                children: [
                  const Icon(Icons.star_outline_rounded,
                      color: Colors.red, size: 35),
                  const VerticalDivider(),
                  Text(
                    "Seus favoritos",
                    style: Styles.homeTitle,
                    textAlign: TextAlign.start,
                  )
                ],
              ),
            ),
            Container(
              margin: const EdgeInsets.fromLTRB(20, 10, 20, 0),
              width: getScreenSize.width,
              height: getScreenSize.height * 0.35,
              child: GridView.builder(
                  scrollDirection: Axis.horizontal,
                  itemCount: itemProvider!.length,
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: itemProvider!.length > 2 ? 2 : 1,
                      childAspectRatio:
                          itemProvider!.length <= 2 ? 16 / 11 : 16 / 12),
                  itemBuilder: (context, index) {
                    return Padding(
                      padding: const EdgeInsets.all(0),
                      child: homeThumbnailMovie(context,
                          id: itemProvider[index], setID: () {
                        Provider.of<MovieProvider>(context, listen: false).id =
                            itemProvider[index];
                        Navigator.pushNamed(context, '/load');
                      }),
                    );
                  }),
            ),
          ],
        )
      : const SizedBox();
}
