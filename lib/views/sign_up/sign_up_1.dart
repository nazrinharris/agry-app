import 'package:agry_app_3/main.dart';
import 'package:flutter/material.dart';
import 'package:agry_app_3/const/colors_const.dart';
import 'package:agry_app_3/const/route_const.dart';
import 'package:agry_app_3/ui_widgets/texts.dart';
import 'package:agry_app_3/ui_widgets/buttons.dart';
import 'package:provider/provider.dart';

class SignUp1 extends StatelessWidget {
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
              MediumParagraph(text: 'Alright, let\'s start!',color: KindaGrey,),
              SizedBox(height: 15,),
              ParagraphDark(text: 'First, are you a..?',fontSize: 20,color: KindaGrey,),
              SizedBox(height: 30,),
              Container(
                alignment: Alignment.center,
                constraints: BoxConstraints.expand(height: 300),
                child: Consumer<SignUpModel>(
                  builder: (context, model, child){
                    return Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        ChooseBox(isChosen: model.chooseFarmer,text: 'Farmer',onTap: (){
                          model.pickFarmer();
                          model.notify();
                          print('User chose Farmer!');
                          },),
                        SizedBox(height: 15,),
                        ChooseBox(isChosen: model.chooseCompanies,text: 'Companies',onTap: (){
                          model.pickCompanies();
                          model.notify();
                          print('User chose Companies!');
                          },),
                        SizedBox(height: 15,),
                        ChooseBox(isChosen: model.chooseOthers,text: 'Others',onTap: (){
                          model.pickOthers();
                          model.notify();
                          print('User chose Others!');
                          },),
                      ],
                    );
                  },
                )
              ),
              HelpBox(),
            ],
          ),
        ),
      ),
    );
  }
}

class ChooseBox extends StatefulWidget {
  final bool isChosen;
  final String text;
  final Function onTap;
  ChooseBox({this.isChosen,this.text,this.onTap});

  @override
  _ChooseBoxState createState() => _ChooseBoxState();
}

class _ChooseBoxState extends State<ChooseBox> {
  @override
  Widget build(BuildContext context) {
    return Consumer<SignUpModel>(
      builder: (context, model, child){
        Widget widgets;
        widget.isChosen ? widgets = ChooseTrue(text: widget.text,onTap: widget.onTap,) : widgets = ChooseFalse(text: widget.text,onTap: widget.onTap,);

        return AnimatedSwitcher(
            duration: Duration(milliseconds: 200),
            child: widgets,
          );
      }
    );
  }
}

class ChooseTrue extends StatelessWidget {
  final String text;
  final Function onTap;
  ChooseTrue({this.text,this.onTap});

  @override
  Widget build(BuildContext context) {
    return Material(
      elevation: 3,
      color: LightGreen,
      child: InkWell(
        onTap: onTap,
        child: Container(
          alignment: Alignment.center,
          height: 50,
          width: 210,
          child: ParagraphDark(text: text,),
        ),
      ),
    );
  }
}

class ChooseFalse extends StatelessWidget {
  final String text;
  final Function onTap;
  ChooseFalse({this.text,this.onTap});

  @override
  Widget build(BuildContext context) {
    return Material(
      color: Transparent,
      child: InkWell(
        onTap: onTap,
        child: Container(
          decoration: BoxDecoration(
            border: Border.all(width: 2,color: KindaGrey)
          ),
          alignment: Alignment.center,
          height: 50,
          width: 210,
          child: ParagraphDark(text: text,),
        ),
      ),
    );
  }
}

class HelpBox extends StatefulWidget {
  @override
  _HelpBoxState createState() => _HelpBoxState();
}

class _HelpBoxState extends State<HelpBox> {
  @override
  Widget build(BuildContext context) {
    return Consumer<SignUpModel>(
      builder: (context, model, child){
        Widget widgets;

        switch(model.chosenWhat){
          case 'farmer' :{
            widgets = FarmerHelp();
          }break;
          case 'companies':{
            widgets = CompaniesHelp();
          }break;
          case 'others':{
            widgets = OthersHelp();
          }break;
          default :{
            widgets = HelpNull();
          }
        }
        return AnimatedSwitcher(
          duration: Duration(milliseconds: 200),
          child: widgets,
        );
      }
    );
  }
}

class FarmerHelp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 34),
      child: SemiParagraphItalic(
        textAlign: TextAlign.center,
        fontSize: 17,
        color: Black.withOpacity(0.5),
        text: 'You have chosen farmers.\nThis option is highly recommended for individual farmers or groups of farmers. As long as it'
            'is not an official company',
      ),
    );
  }
}

class CompaniesHelp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 34),
      child: SemiParagraphItalic(
        textAlign: TextAlign.center,
        fontSize: 17,
        color: Black.withOpacity(0.5),
        text: 'You have chosen companies.\nThis option is for any kind of business or companies that can range from marketing, to consultancy to supermarkets.',
      ),
    );
  }
}

class OthersHelp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 34),
      child: SemiParagraphItalic(
        textAlign: TextAlign.center,
        fontSize: 17,
        color: Black.withOpacity(0.5),
        text: 'You have chosen others.\nThis option is for people such as researchers, hobbyists or just any\nindividual that might want to make use of the app',
      ),
    );
  }
}

class HelpNull extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 34),
      child: SemiParagraphItalic(
        textAlign: TextAlign.center,
        fontSize: 17,
        color: Black.withOpacity(0.5),
        text: 'Please choose one of three before proceeding',
      ),
    );
  }
}


