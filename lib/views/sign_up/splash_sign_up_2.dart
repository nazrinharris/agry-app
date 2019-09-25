import 'package:flutter/material.dart';
import 'package:agry_app_3/const/colors_const.dart';
import 'package:agry_app_3/const/route_const.dart';
import 'package:agry_app_3/ui_widgets/texts.dart';
import 'package:agry_app_3/ui_widgets/buttons.dart';
import 'package:flutter_svg/flutter_svg.dart';

class SplashSignUp2 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    String svgAsset = 'assets/images/undraw_people_search.svg';
    final width = MediaQuery.of(context).size.width;
    final height = MediaQuery.of(context).size.height;

    return Scaffold(
      backgroundColor: PaleGreen,
      body: SafeArea(
        child: Container(
          padding: EdgeInsets.only(
            top: 40.0,
            left: 24.0,
            right: 24.0,
          ),
          height: height,
          width: width,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              MediumParagraph(text: 'Search.\nSpecifically',color: KindaGrey,),
              SizedBox(height: 30.0,),
              SplashProgressBar(),
              Container(
                constraints: BoxConstraints.expand(
                    height: 400
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    ParagraphDark(text: 'Search for farms, farmers, companies,\nmanufacturers and more!',fontSize: 15,textAlign: TextAlign.left,),
                    SizedBox(
                      width: 373.8,
                      height: 269.55,
                      child: SvgPicture.asset(svgAsset),
                    ),
                    SizedBox(height: 30.0,),
                  ],
                ),
              ),
              SizedBox(height: 30.0,),
              Expanded(
                child: Container(
                  alignment: Alignment.topCenter,
                  child: Column(
                    children: <Widget>[
                      PrimaryButton1(onTap: (){Navigator.pushNamed(context, SplashSignUp3Route);}, text: 'Click here'),
                      SizedBox(height: 10.0,),
                      FlatButton1(onTap: (){Navigator.pop(context);}, text: 'Back',)
                    ],
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}

class SplashProgressBar extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
        constraints: BoxConstraints.expand(
          height: 40.0,
        ),
        child: Stack(
          children: <Widget>[
            Container(
              decoration: BoxDecoration(
                color: KindaGrey.withOpacity(0.5),
                borderRadius: BorderRadius.circular(20.0),
              ),
              constraints: BoxConstraints.expand(
                  height: 6.0
              ),
            ),
            Hero(
              tag: 'lightbar',
              child: Container(
                decoration: BoxDecoration(
                  color: LightGreen,
                  borderRadius: BorderRadius.circular(20.0),
                ),
                constraints: BoxConstraints.expand(
                    height: 6.0,
                    width: 120.0
                ),
              ),
            ),
          ],
        ),
      );
  }
}