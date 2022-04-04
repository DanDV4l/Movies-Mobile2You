import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:movies/providers/movieprovider.dart';
import 'package:movies/shared/themes/textstyles.dart';
import 'package:provider/provider.dart';

Widget buildSimilarList(context, {required providerData}) {
  return Padding(
      padding: const EdgeInsets.only(top: 8),
      child: ListView.builder(
        physics: const BouncingScrollPhysics(
            parent: AlwaysScrollableScrollPhysics()),
        itemCount: providerData.length,
        itemBuilder: (context, index) {
          return ListTile(
            leading: Image.network(providerData[index].posterPath),
            title: Text(
              providerData[index].title,
              style: Styles.listTitle,
            ),
            subtitle: Text(
              "${providerData[index].releaseDate.toString().split('-')[0]}  ${providerData[index].genreList.toString().replaceFirst('[', '').replaceFirst(']', '')}",
              style: Styles.subtitle,
            ),
            trailing: Provider.of<MovieProvider>(context, listen: false)
                    .favoriteList
                    .contains(providerData[index].id)
                ? const Icon(CupertinoIcons.checkmark_circle_fill,
                    color: Colors.white, size: 15)
                : null,
            onTap: () {
              Provider.of<MovieProvider>(context, listen: false).id =
                  providerData[index].id;
              Navigator.pushReplacementNamed(context, "/load");
            },
          );
        },
      )

      /*buildSimilarList(context, id: _dataProvider.id)*/
      );
}
