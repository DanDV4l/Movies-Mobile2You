import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:mobile2you/models/similarmovies.dart';
import 'package:mobile2you/provider/movieprovider.dart';
import 'package:mobile2you/shared/getdata.dart';
import 'package:mobile2you/shared/themes/appcolors.dart';
import 'package:provider/provider.dart';

Widget similarContent({providerID}) {
  return Padding(
    padding: const EdgeInsets.all(12.0),
    child: FutureBuilder<List<SimilarMovie>>(
        future: getSimilarMovie(id: providerID),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return Center(
              child: SizedBox(
                height: 35,
                width: 35,
                child: CircularProgressIndicator(
                  color: AppColors.primary,
                  backgroundColor: Colors.black,
                ),
              ),
            );
          }
          if (snapshot.connectionState == ConnectionState.done) {
            var _similarData = snapshot.data;

            return ListView.builder(
                itemCount: _similarData!.length,
                itemBuilder: (context, index) {
                  return ListTile(
                    leading: ClipRRect(
                      child: Image.network(
                        _similarData[index].posterPath,
                      ),
                    ),
                    trailing: IconButton(
                      icon: Icon(
                          Provider.of<MoviesProvider>(context, listen: false)
                                  .favorites
                                  .contains(_similarData[index].id.toString())
                              ? CupertinoIcons.checkmark_alt_circle_fill
                              : CupertinoIcons.checkmark_alt_circle,
                          color: AppColors.icon,
                          size: 16),
                      onPressed: () {
                        Provider.of<MoviesProvider>(context, listen: false)
                            .similarID = _similarData[index].id.toString();
                        Provider.of<MoviesProvider>(context, listen: false)
                            .favoriteControlSimilar();
                      },
                    ),
                    title: Text(
                      _similarData[index].title,
                      style: const TextStyle(
                          color: AppColors.text,
                          fontSize: 25,
                          fontWeight: FontWeight.bold),
                    ),
                    subtitle: Text(
                      _similarData[index].genreList.toString(),
                      style: const TextStyle(color: AppColors.text),
                    ),
                    onTap: () {
                      Provider.of<MoviesProvider>(context, listen: false)
                          .movieID = _similarData[index].id.toString();
                      Navigator.pushReplacementNamed(context, "/details");
                    },
                  );
                });
          }
          return const SizedBox();
        }),
  );
}
