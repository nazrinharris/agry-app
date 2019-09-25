import 'package:flutter/material.dart';
import 'package:agry_app_3/const/colors_const.dart';
import 'package:agry_app_3/ui_widgets/texts.dart';

class ChatAlbert extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: White,
      body: SafeArea(
        child: ListView(
          children: <Widget>[
            TopHeader(),
            ProfilePictureRow(),
          ],
        ),
      ),
    );
  }
}

class TopHeader extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 24),
      padding: EdgeInsets.only(right: 24),
      constraints: BoxConstraints.expand(
          height: 64
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          IconButton(icon: Icon(Icons.arrow_back), onPressed: (){Navigator.pop(context);}),
          Expanded(child: Container(
            alignment: Alignment.centerRight,
              child: SemiParagraph(text: 'Albert Gerald',fontSize: 20,))),
        ],
      ),
    );
  }
}

class ProfilePictureRow extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.center,
      constraints: BoxConstraints.expand(height: 120),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Container(
            height: 45,
            width: 45,
            decoration: BoxDecoration(
              color: MorePaleGreen,
              borderRadius: BorderRadius.circular(40)
            ),
          ),
          SizedBox(width: 5,),
          Container(
            height: 65,
            width: 65,
            decoration: BoxDecoration(
                color: MorePaleGreen,
                borderRadius: BorderRadius.circular(40)
            ),
          ),
          SizedBox(width: 5,),
          Container(
            height: 45,
            width: 45,
            decoration: BoxDecoration(
                color: MorePaleGreen,
                borderRadius: BorderRadius.circular(40)
            ),
          ),
        ],
      ),
    );
  }
}

