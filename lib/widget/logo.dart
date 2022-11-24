import 'package:flutter/material.dart';

class Logo extends StatelessWidget{

  const Logo(this.color, {Key key}) : super(key: key);

  final Color color;


  @override
  Widget build(BuildContext context) {
    return Row(
        children: [
          Text("My Library  ",
              style: TextStyle(
                color: color,
                fontSize: 60,
                fontFamily: 'Pacifico',


              )
          ),
          const Image(
            image: AssetImage('images/logo.png'),
            width: 100,
            height: 100,
          )
        ]
    );
  }

}