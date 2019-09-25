import 'package:flutter/material.dart';

class BackArrowWithContainer extends StatelessWidget {
  final Function onTap;

  BackArrowWithContainer({this.onTap});

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.centerLeft,
      padding: EdgeInsets.only(
        top: 14.0,
      ),
      constraints: BoxConstraints.expand(
        height: 48.0
      ),
      child: IconButton(icon: Icon(Icons.arrow_back), onPressed: onTap),
    );
  }
}
