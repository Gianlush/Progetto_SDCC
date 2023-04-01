import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:frontend_sdcc_flutter/pages/LoginPage.dart';

class BookCover extends StatelessWidget {
  @override
  BookCover({Key key, @required this.title}) : super(key: key);

  String title;

  Widget build(BuildContext context) {
    String image = title.replaceAll(" ", "_");
    image = image.replaceAll("à", "a").trim();
    return InkWell(
      onTap:() { } ,
      child: Container(
        width: 175,
        padding: EdgeInsets.fromLTRB(10,6,10,8),
        decoration: BoxDecoration(
          border: Border.all(color: Colors.black),
          color: Colors.tealAccent,

        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Padding(
              padding: EdgeInsets.fromLTRB(0, 0, 0, 4),
              child: Image(
                image: AssetImage('images/$image.jpg'),
                width: 140,
                height: 180,
              ),
            ),
            Text(title ,
              style: TextStyle(color: Colors.black,
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