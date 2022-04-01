import 'package:flutter/material.dart';

List moviesList = ['A', 'B', 'C', 'D'];

Widget bodyContent() {
  return Padding(
      padding: const EdgeInsets.all(8.0),
      child: SizedBox(
        child: ListView.builder(
            itemCount: moviesList.length,
            itemBuilder: (context, index) {
              return Text(
                moviesList[index],
                style: const TextStyle(fontSize: 20, color: Colors.white),
              );
            }),
      ));
}
