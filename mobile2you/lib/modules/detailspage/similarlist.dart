import 'package:flutter/material.dart';
import 'package:mobile2you/models/similarmovies.dart';
import 'package:mobile2you/provider/movieprovider.dart';
import 'package:mobile2you/shared/getdata.dart';
import 'package:provider/provider.dart';

Widget bodyContent({providerID}) {
  return Padding(
    padding: const EdgeInsets.all(12.0),
    child: FutureBuilder<List<SimilarMovie>>(
        future: getSimilarMovie(id: providerID),
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
            var _similarData = snapshot.data;

            return ListView.builder(
                itemCount: _similarData!.length,
                itemBuilder: (context, index) {
                  return ListTile(
                    leading: Image.network(
                      _similarData[index].posterPath,
                      height: 200,
                    ),
                    trailing: IconButton(
                      icon: const Icon(
                        Icons.check_box_rounded,
                        color: Colors.white,
                      ),
                      onPressed: () {},
                    ),
                    title: Text(
                      _similarData[index].title,
                      style: const TextStyle(
                          color: Colors.white,
                          fontSize: 25,
                          fontWeight: FontWeight.bold),
                    ),
                    subtitle: Text(
                      _similarData[index].genreList.toString(),
                      style: const TextStyle(color: Colors.white),
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
