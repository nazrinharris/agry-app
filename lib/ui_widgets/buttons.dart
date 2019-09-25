import 'package:agry_app_3/main.dart';
import 'package:flutter/material.dart';
import 'package:agry_app_3/const/colors_const.dart';
import 'package:agry_app_3/ui_widgets/texts.dart';
import 'package:flutter_speed_dial/flutter_speed_dial.dart';
import 'package:provider/provider.dart';

class PrimaryButton1 extends StatelessWidget {
  final String text;
  final Function onTap;
  double height;
  double width;

  PrimaryButton1({@required this.onTap,@required this.text,this.width,this.height});

  @override
  Widget build(BuildContext context) {
    if(height == null){
      height = 50;
    }else{}
    if(width == null){
      width = 280;
    }else{}

    return RaisedButton(
      color: LightGreen,
      child: Container(
        height: height,
        width: width,
        alignment: Alignment.center,
        child: ButtonLightText(text: text,),
      ),
      onPressed: onTap,
    );
  }
}

class FlatButton1 extends StatelessWidget {
  final String text;
  final Function onTap;

  FlatButton1({this.text,this.onTap});

  @override
  Widget build(BuildContext context) {
    return FlatButton(
      onPressed: onTap,
      child: Container(
        height: 50,
        width: 280,
        alignment: Alignment.center,
        child: ButtonLightText(text: text,color: KindaGrey.withOpacity(0.5),),
      ),
    );
  }
}


class PrimaryButton2 extends StatelessWidget {
  final String text;
  final Function onTap;

  PrimaryButton2({@required this.onTap,@required this.text});

  @override
  Widget build(BuildContext context) {
    return RaisedButton(
      color: MorePaleGreen,
      child: Container(
        height: 50,
        width: 280,
        alignment: Alignment.center,
        child: ButtonDarkText(text: text),
      ),
      onPressed: onTap,
    );
  }
}

class OpenCloseFAB extends StatefulWidget {
  @override
  _OpenCloseFABState createState() => _OpenCloseFABState();
}

class _OpenCloseFABState extends State<OpenCloseFAB> {
  @override
  Widget build(BuildContext context) {
    return Material(
      color: Colors.transparent,
      child: InkWell(
        onTap: (){},
        borderRadius: BorderRadius.circular(40),
        child: Container(
          height: 56.0,
            width: 56.0,
          decoration: BoxDecoration(
            color: KindaGrey,
            borderRadius: BorderRadius.circular(40),
          ),
        ),
      ),
    );
  }
}

class FAB2 extends StatefulWidget {
  final Function onTap;
  final List<SpeedDialChild> childList;
  FAB2({this.onTap,this.childList});

  @override
  _FAB2State createState() => _FAB2State();
}

class _FAB2State extends State<FAB2> {
  @override
  Widget build(BuildContext context) {
    return Consumer<ButtonsModel>(
      builder: (context, model, child){
        return SpeedDial(
          // both default to 16
          marginRight: 18,
          marginBottom: 20,
          animatedIconTheme: IconThemeData(size: 22.0,color: PaleGreen),
          // this is ignored if animatedIcon is non null
          // child: Icon(Icons.add),
          visible: true,
          // If true user is forced to close dial manually
          // by tapping main button and overlay is not rendered.
          closeManually: false,
          curve: Curves.bounceIn,
          overlayColor: Colors.black,
          overlayOpacity: 0.5,
          heroTag: 'speed-dial-hero-tag',
          backgroundColor: KindaGrey,
          foregroundColor: Colors.black,
          elevation: 8.0,
          shape: CircleBorder(),
          animatedIcon: AnimatedIcons.menu_close,
          children: widget.childList,

        );
      },
    );
  }
}

class SmallerPrimaryButton extends StatelessWidget {
  final String text;
  final Function onTap;
  double height;
  double width;
  double fontSize;
  SmallerPrimaryButton({this.text,this.onTap,this.width,this.height,this.fontSize});

  @override
  Widget build(BuildContext context) {
    if (width == null){
      width = 135;
    }else{}
    if(height == null){
      height =27;
    }

    return RaisedButton(
      color: MorePaleGreen,
      child: Container(
        height: height,
        width: width,
        alignment: Alignment.center,
        child: ButtonDarkText(text: text, fontSize: 12,),
      ),
      onPressed: onTap,
    );
  }
}



