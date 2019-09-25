import 'package:flutter/material.dart';
import 'package:agry_app_3/const/colors_const.dart';
import 'package:agry_app_3/const/route_const.dart';
import 'package:agry_app_3/ui_widgets/texts.dart';
import 'package:agry_app_3/ui_widgets/buttons.dart';

class SignUp2 extends StatelessWidget {
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
              MediumParagraph(text: 'Great!',color: KindaGrey,),
              SizedBox(height: 15,),
              ParagraphDark(text: 'Let\'s get some basic details \nout of the way first.',fontSize: 20,color: KindaGrey,),
              SizedBox(height: 30,),
              CustomTextField('Enter your full name'),
              SizedBox(height: 10,),
              CustomTextField('Enter your desired username'),
              SizedBox(height: 10,),
              CustomTextField('Enter your e-mail'),
              SizedBox(height: 10,),
              CustomTextField('Enter your password'),
              SizedBox(height: 10,),
              CustomTextField('Re-enter your password'),
              Expanded(child: Container(
                alignment: Alignment.center,
                child: PrimaryButton1(text: 'Next', height: 50,width: 170,onTap: (){Navigator.pushNamed(context, SignUp3Route);},),
              ),)
            ],
          ),
        ),
      )
    );
  }
}
class CustomTextField extends StatelessWidget {
  final String _text;
  CustomTextField(this._text);

  @override
  Widget build(BuildContext context) {
    return TextField(
      style: TextStyle(
          fontStyle: FontStyle.italic,
          fontFamily: 'Metropolis',
          fontWeight: FontWeight.w600),
      decoration: InputDecoration(
        labelText: _text,
      ),
    );
  }
}
