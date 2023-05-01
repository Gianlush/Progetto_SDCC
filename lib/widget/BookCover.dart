import 'package:flutter/material.dart';
import 'package:frontend_sdcc_flutter/pages/ReviewsPage.dart';

class BookCover extends StatelessWidget {


  @override
  const BookCover({Key key, @required this.title, this.proportion, this.clickable}) : super(key: key);

  final String title;
  final double proportion;
  final bool clickable;

  @override
  Widget build(BuildContext context) {
    String image = title.replaceAll(" ", "_");
    image = image.replaceAll("à", "a").trim();
    return InkWell(
      onTap:clickable? () { ReviewsPage.bookTitle=title; Navigator.push(context,MaterialPageRoute(builder: (context) => const ReviewsPage()),);} : null,
      child: Container(
        width: 175*proportion,
        padding: const EdgeInsets.fromLTRB(10,6,10,8),
        decoration: BoxDecoration(
          border: Border.all(color: Colors.black),
          color: Colors.tealAccent,

        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Padding(
              padding: const EdgeInsets.fromLTRB(0, 0, 0, 4),
              child: Image(
                image: AssetImage('images/$image.jpg'),
                width: 140*proportion,
                height: 180*proportion,
              ),
            ),
            Text(title ,
              style: const TextStyle(color: Colors.black,
                fontStyle: FontStyle.italic,
                fontSize: 18,
              ),
            )
          ],
        ),
      ),
    );
  }

}