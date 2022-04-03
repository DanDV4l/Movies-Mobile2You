import 'package:flutter/material.dart';
import 'package:movies/modules/detailspage/detailspage.dart';
import 'package:movies/modules/homepage/homepage.dart';
import 'package:movies/modules/loadingpage/loadingpage.dart';
import 'package:movies/providers/movieprovider.dart';
import 'package:movies/shared/elements/errorpage.dart';
import 'package:provider/provider.dart';

void main() => runApp(MultiProvider(
      providers: [ChangeNotifierProvider(create: (_) => MovieProvider())],
      child: MaterialApp(
        title: 'MOVIES - Mobile2You',
        routes: {
          "/": (context) => const HomePage(),
          "/load": (context) => const LoadingPage(),
          "/details": (context) => const DetailsPage(),
          "/error": (context) => const ErrorPage()
        },
        initialRoute: "/",
      ),
    ));
