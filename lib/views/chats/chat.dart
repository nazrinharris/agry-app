import 'package:agry_app_3/const/route_const.dart';
import 'package:flutter/material.dart';
import 'package:agry_app_3/const/colors_const.dart';
import 'package:agry_app_3/ui_widgets/texts.dart';

class Chat extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: White,
      body: SafeArea(
        child: ChatBody(),
      ),
    );
  }
}

class ChatBody extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ListView(
      physics: BouncingScrollPhysics(),
      children: <Widget>[
        TopHeader(),
        SizedBox(height: 24,),
        ChatsCard(
          title: 'Albert Gerald',
          content: 'Oh! Thats Amazing!',
          onTap: (){Navigator.pushNamed(context, ChatAlbertRoute);},
        ),
        SizedBox(height: 15,),
        ChatsCard(
          title: 'James Mayfield',
          content: 'Not exactly our best offer bu..',
        ),
        SizedBox(height: 15,),
        ChatsCard(
          title: 'Abu Kasim',
          content: 'Wah kau Hafiz.. takleh bwk binc..',
        ),
        SizedBox(height: 15,),
        ChatsCard(
          title: 'Abdul Hafiz',
          content: 'Eh! wei hafiz, tolong do, kentan..',
        ),
      ],
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
          SemiParagraph(text: 'Chat',fontSize: 20,),
        ],
      ),
    );
  }
}

class ChatsCard extends StatelessWidget {
  final String title;
  final String content;
  Function onTap;
  ChatsCard({this.title,this.content,this.onTap});

  @override
  Widget build(BuildContext context) {
    if(onTap == null){
      onTap = (){};
    }

    return Material(
      color: KindaWhite,
      child: InkWell(
        onTap: onTap,
        child: Container(
          padding: EdgeInsets.only(left: 14),
          constraints: BoxConstraints.expand(height: 110),
          child: Row(
            children: <Widget>[
              Expanded(
                flex: 1,
                child: Container(
                  alignment: Alignment.centerLeft,
                  child: Container(
                    height: 58,
                    width: 58,
                    decoration: BoxDecoration(
                        color: MorePaleGreen,
                        borderRadius: BorderRadius.circular(30)
                    ),
                  ),
                ),
              ),
              Expanded(
                flex: 3,
                child: Container(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      ParagraphDark(text: title,),
                      SizedBox(height: 5,),
                      Container(
                          alignment: Alignment.centerLeft,
                          child: ParagraphDark(fontSize: 13,color: Black.withOpacity(0.5),text: content,))
                    ],
                  ),
                ),
              ),
              Expanded(
                flex: 1,
                child: Container(
                  padding: EdgeInsets.only(right: 14),
                  alignment: Alignment.centerRight,
                  child: Icon(Icons.navigate_next,color: Grey,),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}