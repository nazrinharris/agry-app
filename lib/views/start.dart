import 'package:agry_app_3/ui_widgets/texts.dart';
import 'package:flutter/material.dart';
import 'package:agry_app_3/const/colors_const.dart';
import 'package:agry_app_3/ui_widgets/buttons.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:agry_app_3/const/route_const.dart';

class StartView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    final height = MediaQuery.of(context).size.height;

    return Scaffold(
      backgroundColor: PaleGreen,
      body: SafeArea(
        child: Stack(
          children: <Widget>[
            Positioned(
                right: 80.0,
                top: 40.0,
                child: StartBackground()
            ),
            Container(
              padding: EdgeInsets.only(
                top: 100.0,
              ),
              height: height,
              width: width,
              alignment: Alignment.center,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                children: <Widget>[
                  ExtraLargeHeader(text: 'Welcome To \nAgry',textAlign: TextAlign.center,),
                  SizedBox(height: 90.0,),
                  ParagraphDark(text: 'The app that allows farmers a \nfarther reach', textAlign: TextAlign.center,),
                  SizedBox(height: 50.0,),
                  ParagraphDark(text: 'Find out how we do it',textAlign: TextAlign.center,),
                  SizedBox(height: 140.0,),
                  Expanded(
                    child: Container(
                      padding: EdgeInsets.only(
                        bottom: 50.0
                      ),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: <Widget>[
                          PrimaryButton1(text: 'Get Started', onTap: (){
                            Navigator.pushNamed(context, SplashSignUp1Route);
                          },),
                          SizedBox(height: 15.0,),
                          PrimaryButton2(text: 'Log In', onTap: (){
                            Navigator.pushNamed(context, LoginRoute);
                          },),
                        ],
                      ),
                    ),
                  )
                ],
              ),
            ),
          ],
        )
      ),
    );
  }
}

class StartBackground extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    String svgAsset = 'assets/images/undraw-gardening.svg';
    final width = MediaQuery.of(context).size.width;
    final height = MediaQuery.of(context).size.height;

    return Container(
      alignment: Alignment.bottomLeft,
      width: width,
      height: height,
      child: SizedBox(
        width: 450,
        height: 462.05,
        child: SvgPicture.asset(svgAsset),
      ),
    );
  }
}

