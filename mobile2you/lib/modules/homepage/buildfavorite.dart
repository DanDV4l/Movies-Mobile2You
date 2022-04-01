import 'package:flutter/material.dart';
import 'package:mobile2you/provider/movieprovider.dart';
import 'package:mobile2you/shared/elements/homethumbnails.dart';
import 'package:provider/provider.dart';

Widget buildFavorite(context, {getScreenSize, itemProvider}) {
  return SizedBox(
    width: getScreenSize.width,
    height: getScreenSize.height * 0.25,
    child: GridView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: itemProvider!.length,
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 1, childAspectRatio: 16 / 12),
        itemBuilder: (context, index) {
          return Padding(
            padding: const EdgeInsets.all(8.0),
            child: homeThumbnailMovie(context,
                id: itemProvider[index].toString(), setID: () {
              Provider.of<MoviesProvider>(context, listen: false).movieID =
                  itemProvider[index].toString();
              Navigator.pushNamed(context, '/details');
            }),
          );
        }),
  );
}
