import 'package:flutter/material.dart';

class Logo extends StatelessWidget{
  const Logo({Key key}) : super(key: key);


  @override
  Widget build(BuildContext context) {
    return Row(
        children: const [
          Text("My Library   ",
              style: TextStyle(
                  color: Colors.indigoAccent,
                  fontSize: 60,
                  decorationStyle: TextDecorationStyle.solid,
                  fontWeight: FontWeight.bold,
                  fontStyle: FontStyle.italic
              )
          ),
          Image(
            image: AssetImage('images/logo.png'),
            width: 100,
            height: 100,
          )
        ]
    );
  }

}