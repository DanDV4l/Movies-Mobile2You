import 'package:flutter/material.dart';

import 'package:mobile2you/provider/movieprovider.dart';
import 'package:provider/provider.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Consumer<MoviesProvider>(
        builder: (BuildContext context, MoviesProvider value, Widget? child) {
      var moviesProvider = Provider.of<MoviesProvider>(context, listen: false);
      return Scaffold(
        appBar: AppBar(
          leading: IconButton(
            icon: const Icon(Icons.add),
            onPressed: () {
              moviesProvider.movieID = '2911';
              Navigator.pushNamed(context, "/details");
            },
          ),
        ),
      );
    });
  }
}
