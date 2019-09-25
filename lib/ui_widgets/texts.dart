import 'package:agry_app_3/const/colors_const.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class ButtonLightText extends StatelessWidget {
  final String text;
  TextAlign textAlign;
  Color color;

  ButtonLightText({this.text,this.textAlign,this.color});

  @override
  Widget build(BuildContext context) {
    if(textAlign == null){
      textAlign = TextAlign.left;
    }else{}
    if(color == null){
      color = KindaGrey;
    }else{}

    return Text(
      text,
      textAlign: textAlign,
      style: TextStyle(
        color: color,
        fontSize: 15,
        fontFamily: 'Metropolis',
        fontWeight: FontWeight.w600
      ),
    );
  }
}

class ButtonDarkText extends StatelessWidget {
  final String text;
  double fontSize;
  TextAlign textAlign;

  ButtonDarkText({this.text,this.textAlign,this.fontSize});

  @override
  Widget build(BuildContext context) {
    if(textAlign == null){
      textAlign = TextAlign.left;
    }else{}
    if(fontSize == null){
      fontSize = 15;
    }

    return Text(
      text,
      textAlign: textAlign,
      style: TextStyle(
          color: Colors.black,
          fontSize: fontSize,
          fontFamily: 'Metropolis',
          fontWeight: FontWeight.w600
      ),
    );
  }
}

class ExtraLargeHeader extends StatelessWidget {
  final String text;
  TextAlign textAlign;
  Color color;
  double fontSize;

  ExtraLargeHeader({this.text,this.textAlign,this.color,this.fontSize});

  @override
  Widget build(BuildContext context) {
    if(textAlign == null){
      textAlign = TextAlign.left;
    }else{}

    if(color == null){
      color = DarkGreen;
    }else{}

    if(fontSize == null){
      fontSize = 45;
    }else{}

    return Text(
      text,
      textAlign: textAlign,
      style: TextStyle(
          color: color,
          fontSize: fontSize,
          fontFamily: 'Metropolis',
          fontWeight: FontWeight.w700
      ),
    );
  }
}

class ParagraphLight extends StatelessWidget {
  final String text;
  TextAlign textAlign;

  ParagraphLight({this.text,this.textAlign});

  @override
  Widget build(BuildContext context) {
    if(textAlign == null){
      textAlign = TextAlign.left;
    }else{}

    return Text(
      text,
      textAlign: textAlign,
      style: TextStyle(
          color: Colors.white,
          fontSize: 14,
          fontFamily: 'Metropolis',
          fontWeight: FontWeight.w600
      ),
    );
  }
}

class ParagraphDark extends StatelessWidget {
  final String text;
  TextAlign textAlign;
  Color color;
  double fontSize;

  ParagraphDark({this.text,this.textAlign,this.fontSize,this.color});

  @override
  Widget build(BuildContext context) {
    if(textAlign == null){
      textAlign = TextAlign.left;
    }else{}
    if(fontSize == null){
      fontSize = 14;
    }else{}
    if(color == null){
      color = Colors.black;
    }else{}

    return Text(
      text,
      textAlign: textAlign,
      style: TextStyle(
          color: color,
          fontSize: fontSize,
          fontFamily: 'Metropolis',
          fontWeight: FontWeight.w600
      ),
    );
  }
}

class MediumParagraph extends StatelessWidget {
  final String text;
  TextAlign textAlign;
  Color color;
  double fontSize;

  MediumParagraph({this.textAlign,this.fontSize,this.color,this.text});

  @override
  Widget build(BuildContext context) {
    if(textAlign == null){
      textAlign = TextAlign.left;
    }else{}
    if(color == null){
      color = Colors.white;
    }else{}
    if(fontSize == null){
      fontSize = 29;
    }else{}

    return Text(text,
      textAlign: textAlign,
      style: TextStyle(
        color: color,
        fontSize: fontSize,
        fontFamily: 'Metropolis',
        fontWeight: FontWeight.w700
      ),
    );
  }
}

class SemiParagraph extends StatelessWidget {
  final String text;
  TextAlign textAlign;
  Color color;
  double fontSize;

  SemiParagraph({this.textAlign,this.fontSize,this.color,this.text});

  @override
  Widget build(BuildContext context) {
    if(textAlign == null){
      textAlign = TextAlign.left;
    }else{}
    if(color == null){
      color = Colors.black;
    }else{}
    if(fontSize == null){
      fontSize = 18;
    }else{}

    return Text(text,
      textAlign: textAlign,
      style: TextStyle(
          color: color,
          fontSize: fontSize,
          fontFamily: 'Metropolis',
          fontWeight: FontWeight.w700
      ),
    );
  }
}

class SemiParagraphItalic extends StatelessWidget {
  final String text;
  TextAlign textAlign;
  Color color;
  double fontSize;

  SemiParagraphItalic({this.textAlign,this.fontSize,this.color,this.text});

  @override
  Widget build(BuildContext context) {
    if(textAlign == null){
      textAlign = TextAlign.left;
    }else{}
    if(color == null){
      color = Colors.black;
    }else{}
    if(fontSize == null){
      fontSize = 18;
    }else{}

    return Text(text,
      textAlign: textAlign,
      style: TextStyle(
          color: color,
          fontSize: fontSize,
          fontFamily: 'Metropolis',
          fontWeight: FontWeight.w600,
          fontStyle: FontStyle.italic,
      ),
    );
  }
}

class ParagraphHeader extends StatelessWidget {
  final String text;
  TextAlign textAlign;
  Color color;
  double fontSize;

  ParagraphHeader({this.textAlign,this.fontSize,this.color,this.text});

  @override
  Widget build(BuildContext context) {
    if(textAlign == null){
      textAlign = TextAlign.left;
    }else{}
    if(color == null){
      color = Colors.black;
    }else{}
    if(fontSize == null){
      fontSize = 23;
    }else{}

    return Text(text,
      textAlign: textAlign,
      style: TextStyle(
          color: color,
          fontSize: fontSize,
          fontFamily: 'Metropolis',
          fontWeight: FontWeight.w700
      ),
    );
  }
}

class ParagraphHeaderMedium extends StatelessWidget {
  final String text;
  TextAlign textAlign;
  Color color;
  double fontSize;

  ParagraphHeaderMedium({this.textAlign,this.fontSize,this.color,this.text});

  @override
  Widget build(BuildContext context) {
    if(textAlign == null){
      textAlign = TextAlign.left;
    }else{}
    if(color == null){
      color = Colors.black;
    }else{}
    if(fontSize == null){
      fontSize = 23;
    }else{}

    return Text(text,
      textAlign: textAlign,
      style: TextStyle(
          color: color,
          fontSize: fontSize,
          fontFamily: 'Metropolis',
          fontWeight: FontWeight.w600
      ),
    );
  }
}

class ParagraphMedium extends StatelessWidget {
  final String text;
  TextAlign textAlign;
  Color color;
  double fontSize;

  ParagraphMedium({this.textAlign,this.fontSize,this.color,this.text});

  @override
  Widget build(BuildContext context) {
    if(textAlign == null){
      textAlign = TextAlign.left;
    }else{}
    if(color == null){
      color = Colors.black;
    }else{}
    if(fontSize == null){
      fontSize = 23;
    }else{}

    return Text(text,
      textAlign: textAlign,
      style: TextStyle(
          color: color,
          fontSize: fontSize,
          fontFamily: 'Metropolis',
          fontWeight: FontWeight.w600,
      ),
    );
  }
}

class MainHeader extends StatelessWidget {
  final String text;
  final IconData iconData;
  MainHeader({this.text,this.iconData});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(
          horizontal: 24
      ),
      margin: EdgeInsets.only(
          top: 14
      ),
      constraints: BoxConstraints.expand(
          height: 30
      ),
      child: Row(
        children: <Widget>[
          Expanded(
            flex: 4,
            child: Container(
                alignment: Alignment.centerLeft,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: <Widget>[
                    SemiParagraph(text: text,fontSize: 30,),
                    SizedBox(width: 10,),
                    Icon(iconData, size: 30,),
                  ],
                )
            ),
          ),
          Expanded(
            flex: 1,
            child: Container(
              alignment: Alignment.topRight,
              child: IconButton(icon: Icon(Icons.help_outline), onPressed: (){}),
            ),
          )
        ],
      ),
    );
  }
}

class MiniHeader extends StatelessWidget {
  double fontSize;
  final String text;
  MiniHeader({this.text,this.fontSize});
  @override
  Widget build(BuildContext context) {
    if(fontSize == null){
      fontSize = 12;
    }

    return Container(
      padding: EdgeInsets.only(left: 24),
      constraints: BoxConstraints.expand(height: 15),
      child: ParagraphDark(text: text, fontSize: fontSize,),
    );
  }
}

