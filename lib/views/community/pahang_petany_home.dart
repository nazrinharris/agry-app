import 'package:agry_app_3/const/colors_const.dart';
import 'package:flutter/material.dart';
import 'package:agry_app_3/ui_widgets/buttons.dart';
import 'package:agry_app_3/ui_widgets/texts.dart';
import 'package:flutter_speed_dial/flutter_speed_dial.dart';


class PPHome extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      floatingActionButton: FAB2(childList: [
        SpeedDialChild(
            child: Icon(Icons.chat,color: KindaGrey,),
            backgroundColor: PaleGreen,
            label: 'Start Discussion',
            labelBackgroundColor: PaleGreen,
            labelStyle: TextStyle(fontSize: 18.0,color: KindaGrey,fontFamily: 'Metropolis'),
            onTap: () => print('FIRST CHILD')
        ),],),
      body: SafeArea(
        child: ListView(
          children: <Widget>[
            TopHeader(),
            SizedBox(height: 32,),
            PPBody(),
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
      constraints: BoxConstraints.expand(
        height: 64
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          IconButton(icon: Icon(Icons.arrow_back), onPressed: (){Navigator.pop(context);}),
          SemiParagraph(text: 'Pahang Petany',fontSize: 20,),
          IconButton(icon: Icon(Icons.more_vert), onPressed: (){}),
        ],
      ),
    );
  }
}

class PPBody extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        Container(
          margin: EdgeInsets.only(left: 24),
          constraints: BoxConstraints.expand(
            height: 24,
          ),
          child: ParagraphDark(text: 'Discussions', fontSize: 20,),
        ),
        SizedBox(height: 20,),
        DiscussionCard(
          title: 'Alright, how to potato?',
          content: 'I mean I found a supplier with an absur..',
          amount: 21,
        ),
        SizedBox(height: 15,),
        DiscussionCard(
          title: 'Wait, my chilli plant has holes!',
          content: 'This is absoulutely new to me. Please hel..',
          amount: 13,
        ),
        SizedBox(height: 15,),
        DiscussionCard(
          title: 'Shipping to Canada?',
          content: 'So, TLDR, I got an amazing deak for me to sh..',
          amount: 3,
        ),
        SizedBox(height: 15,),
        Container(
          alignment: Alignment.center,
            child: PrimaryButton1(text: 'More',onTap: (){},), width: 200,)
      ],
    );
  }
}

class DiscussionCard extends StatelessWidget {
  final String title;
  final String content;
  final String author;
  final int amount;
  DiscussionCard({this.title,this.content,this.author,this.amount});

  @override
  Widget build(BuildContext context) {
    return Material(
      color: KindaWhite,
      child: InkWell(
        onTap: (){},
        child: Container(
          padding: EdgeInsets.only(
            left: 24,
            right: 24,
            top: 20,
            bottom: 14,
          ),
          constraints: BoxConstraints.expand(
              height: 130
          ),
          child: Column(
            children: <Widget>[
              Container(
                alignment: Alignment.centerLeft,
                constraints: BoxConstraints.expand(height: 20),
                child: ButtonDarkText(text: title,),
              ),
              SizedBox(height: 10,),
              Container(
                constraints: BoxConstraints.expand(height: 40),
                child: ParagraphDark(
                  color: Black.withOpacity(0.5),
                  textAlign: TextAlign.left,
                  text: content,
                ),
              ),
              Expanded(
                child: Container(
                  child: Row(
                    children: <Widget>[
                      Expanded(child: Container(
                        alignment: Alignment.centerLeft,
                        child: Row(
                          children: <Widget>[
                            Icon(Icons.chat_bubble),
                            SizedBox(width: 10,),
                            ParagraphDark(text: amount.toString(),)
                          ],
                        ),
                      ),),
                      Expanded(child: Container(
                        alignment: Alignment.centerRight,
                      ),),
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

