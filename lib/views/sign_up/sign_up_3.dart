import 'package:flutter/material.dart';
import 'package:agry_app_3/const/colors_const.dart';
import 'package:agry_app_3/const/route_const.dart';
import 'package:agry_app_3/ui_widgets/texts.dart';
import 'package:agry_app_3/ui_widgets/buttons.dart';

class SignUp3 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: PaleGreen,
      body: SafeArea(
        child: Container(
          padding: EdgeInsets.only(
              top: 54,
              left: 24,
              right: 24
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              MediumParagraph(text: 'Splendid!',color: KindaGrey,),
              SizedBox(height: 15,),
              ParagraphDark(text: 'Now to setup some of your\nfarm information.',fontSize: 20,color: KindaGrey,),
            ],
          ),
        ),
      ),
    );
  }
}
