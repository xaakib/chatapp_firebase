import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

Widget appBarMian(BuildContext context) {
  return AppBar(
    title: Text(
      "ChatApp FDB",
    ),
  );
}

InputDecoration textFeildInputDecoraion(String hintText) {
  return InputDecoration(
    hintText: hintText,
    hintStyle: TextStyle(
      color: Colors.white54,
    ),
    focusedBorder: UnderlineInputBorder(
      borderSide: BorderSide(
        color: Colors.white,
      ),
    ),
    enabledBorder: UnderlineInputBorder(
      borderSide: BorderSide(
        color: Colors.white,
      ),
    ),
  );
}

TextStyle simpleTextStyle() {
  return TextStyle(
    color: Colors.white,
    fontSize: 16,
  );
}
