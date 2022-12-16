import 'package:flutter/material.dart';

class Config {
  double deviceHeight(BuildContext context) {
    return MediaQuery.of(context).size.height;
  }

  double deviceWidth(BuildContext context) {
    return MediaQuery.of(context).size.width;
  }
}

//Colors
// Color secondary = Color(0xFFFFECB3);
Color secondary = Colors.white;
Color accent = const Color(0xffA8FF35);

Color grey = const Color(0xff171717);
Color black = Colors.black;
Color white = Colors.white;
Color lightgrey = Colors.grey.shade200;

class Nav {
  goTo(Widget child, BuildContext context) {
    Navigator.of(context)
        .push(MaterialPageRoute<void>(builder: (BuildContext context) {
      return child;
    }));
  }
}
