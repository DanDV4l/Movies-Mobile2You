import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

bool favorite = false;

PreferredSize buildTitleImageBox(context,
    {required title, required posterURL, required likes, required popularity}) {
  var _size = MediaQuery.of(context).size;
  double _boxHeight = _size.height * 0.6;

  return PreferredSize(
    preferredSize: Size.fromHeight(_boxHeight),
    child: Container(
        padding: const EdgeInsets.only(top: 40),
        height: _boxHeight,
        decoration: BoxDecoration(
          image:
              DecorationImage(image: NetworkImage(posterURL), fit: BoxFit.fill),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            buildBackButton(onPressed: () => Navigator.pop(context)),
            buildBoxBottomBar(
                getSize: _size,
                title: title,
                likes: likes,
                popularity: popularity)
          ],
        )),
  );
}

Widget buildBackButton({required onPressed}) {
  return Container(
    width: 38,
    height: 38,
    margin: const EdgeInsets.all(20),
    decoration: BoxDecoration(
        color: Colors.black.withOpacity(0.70),
        borderRadius: const BorderRadius.all(Radius.circular(200))),
    child: IconButton(
        icon:
            const Icon(Icons.arrow_back_ios_new, color: Colors.white, size: 19),
        onPressed: onPressed),
  );
}

Widget buildBoxBottomBar(
    {required getSize, required title, required likes, required popularity}) {
  return Container(
    padding: const EdgeInsets.only(bottom: 8, left: 10),
    color: Colors.black,
    child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          shadowEffect(),
          buildTitleBar(
              getSize: getSize,
              title: title,
              likes: likes,
              popularity: popularity),
        ]),
  );
}

Widget shadowEffect() {
  return Container(
    height: 1,
    width: double.infinity,
    padding: const EdgeInsets.all(10),
    decoration: const BoxDecoration(boxShadow: [
      BoxShadow(
          color: Colors.black,
          spreadRadius: 25,
          blurRadius: 20,
          offset: Offset(0, 0))
    ]),
  );
}

Widget buildTitleBar(
    {required getSize, required title, required likes, required popularity}) {
  return SizedBox(
    child: Column(
      children: [
        //title - start
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            SizedBox(
              width: getSize.width * 0.7,
              child: Text(
                title,
                textAlign: TextAlign.start,
                style: GoogleFonts.inter(
                    color: Colors.white,
                    fontSize: 26,
                    fontWeight: FontWeight.bold),
              ),
            ),
            IconButton(
              icon: Icon(
                favorite ? Icons.favorite : Icons.favorite_outline_sharp,
                color: Colors.white,
                size: 30,
              ),
              onPressed: () {
                // favorite = true;
              },
            )
          ],
        ),
        //title - end

        //subtitle - start
        Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            const Icon(
              Icons.favorite,
              size: 16,
              color: Colors.white,
            ),
            Padding(
              padding: const EdgeInsets.fromLTRB(5, 0, 20, 0),
              child: Text(
                "$likes Likes",
                textAlign: TextAlign.start,
                style: GoogleFonts.inter(
                  color: Colors.white,
                  fontSize: 14,
                ),
              ),
            ),
            Transform.rotate(
              angle: -190,
              child: const Icon(Icons.contrast_outlined,
                  color: Colors.white, size: 16),
            ),
            Padding(
              padding: const EdgeInsets.fromLTRB(5, 0, 20, 0),
              child: Text(
                "$popularity Views",
                textAlign: TextAlign.start,
                style: GoogleFonts.inter(
                  color: Colors.white,
                  fontSize: 14,
                ),
              ),
            ),
            //const VerticalDivider(),
          ],
        )
        //subtitle - end
      ],
    ),
  );
}
