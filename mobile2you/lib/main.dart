import 'package:flutter/material.dart';
import 'package:mobile2you/modules/detailspage/detailspage.dart';
// ignore: unused_import
import 'package:mobile2you/modules/homepage/homepage.dart';
import 'package:mobile2you/provider/movieprovider.dart';
import 'package:provider/provider.dart';

void main() => runApp(ChangeNotifierProvider(
      create: (_) => MoviesProvider(),
      child: MaterialApp(
        routes: {
          "/": (context) => const HomePage(),
          "/details": (context) => Consumer<MoviesProvider>(
                builder: (BuildContext context, MoviesProvider value,
                        Widget? child) =>
                    DetailsPage(
                        id: Provider.of<MoviesProvider>(context, listen: false)
                            .movieID),
              )
        },
        initialRoute: "/",
        title: "Desafio Mobile2You",
      ),
    ));
