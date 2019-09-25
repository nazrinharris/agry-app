import 'package:agry_app_3/const/colors_const.dart';
import 'package:flutter/material.dart';
import 'package:agry_app_3/main.dart';
import 'package:provider/provider.dart';
import 'package:agry_app_3/ui_widgets/texts.dart';
import 'package:sliding_up_panel/sliding_up_panel.dart';
import 'package:agry_app_3/const/route_const.dart';
import 'package:agry_app_3/ui_widgets/slide_panel_master.dart';

class Profile extends StatefulWidget {
  @override
  _ProfileState createState() => _ProfileState();
}

class _ProfileState extends State<Profile> {
  PanelController _pc = new PanelController();

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery
        .of(context)
        .size
        .width;
    BorderRadiusGeometry panelRadius = BorderRadius.only(
      topLeft: Radius.circular(11.0),
      topRight: Radius.circular(11.0),
    );

    return Scaffold(
      bottomNavigationBar: null,
      backgroundColor: Colors.white,
      body: SlidingUpPanel(
          controller: _pc,
          boxShadow: [
            BoxShadow(
                color: Black.withOpacity(0.16),
                blurRadius: 6,
                offset: Offset(0, 0))
          ],
          parallaxEnabled: true,
          backdropEnabled: true,
          minHeight: 62.0,
          collapsed: Container(
              constraints: BoxConstraints.expand(height: 62.0, width: width),
              decoration: BoxDecoration(color: Colors.white),
              padding: EdgeInsets.symmetric(horizontal: 14.0,),
              child: Container(
                constraints: BoxConstraints.expand(height: 62.0, width: width),
                child: Row(
                  children: <Widget>[
                    Expanded(
                      flex: 1,
                      child: Container(
                        alignment: Alignment.centerLeft,
                        child: IconButton(
                            icon: Icon(Icons.menu), onPressed: () {
                          _pc.open();
                        }),
                      ),
                    ),
                    Expanded(
                      flex: 4,
                      child: Container(
                        alignment: Alignment.center,
                        child: SemiParagraph(
                          text: 'Profile', textAlign: TextAlign.center,),
                      ),
                    ),
                    Expanded(
                      flex: 1,
                      child: Container(
                        alignment: Alignment.centerRight,
                        child: IconButton(icon: Icon(Icons.edit),onPressed: (){},),
                      ),
                    ),
                  ],
                ),
              )),
          panel: PanelMaster(panelType : 'profile'),
          body: ProfileBody(),
          borderRadius: panelRadius),
    );
  }
}

class ProfileBody extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ListView(
      physics: BouncingScrollPhysics(),
      children: <Widget>[
        SizedBox(height: 24,),
        Container(
          alignment: Alignment.center,
          constraints: BoxConstraints.expand(
            height: 90,
          ),
          child: Container(
            height: 90,
            width: 90,
            decoration: BoxDecoration(
              color: MorePaleGreen,
              borderRadius: BorderRadius.circular(60),
            ),
          ),
        ),
        SizedBox(height: 18,),
        Name(name: 'Jufayri Hafiz',),
        SizedBox(height: 8,),
        Email(),
        SizedBox(height: 20,),
        Bio(),
        SizedBox(height: 10,),
        Line(),
        SizedBox(height: 15,),
        TopNavWidget(),
        PageSwitcher(),
      ],
    );
  }
}

class Name extends StatelessWidget {
  final String name;
  Name({this.name});

  @override
  Widget build(BuildContext context) {
    return Container(
        alignment: Alignment.center,
        constraints: BoxConstraints.expand(height: 18),
        child: SemiParagraph(text: name,)
    );
  }
}

class Email extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.center,
      constraints: BoxConstraints.expand(height: 15),
      child: ParagraphDark(text: 'jufayrihafiz@gmail.com',color: Black.withOpacity(0.7),),
    );
  }
}

class Bio extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.center,
      constraints: BoxConstraints.expand(
        height: 50
      ),
      child: ParagraphDark(
        textAlign: TextAlign.center,
        text: 'Hello, I am a potato and wheat farmer based \nin Gemas, 21 years of experience.\nModernised',
      ),
    );
  }
}

class Line extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      constraints: BoxConstraints.expand(height: 10),
      alignment: Alignment.center,
      child: Container(
        height: 1,
        width: 200,
        color: KindaGrey,
      ),
    );
  }
}

class TopNavWidget extends StatefulWidget {
  @override
  _TopNavWidgetState createState() => _TopNavWidgetState();
}

class _TopNavWidgetState extends State<TopNavWidget> {
  Color dashboardColor = Black;
  Color feedColor = Black.withOpacity(0.5);

  @override
  Widget build(BuildContext context) {
    double maxBarWidth = MediaQuery.of(context).size.width - 48.0;

    return Consumer<ProfileModel>(
      builder: (context, bloc, child) {
        bloc.maxBarWidth = maxBarWidth;

        return Container(
          padding: EdgeInsets.symmetric(
            horizontal: 24.0,
          ),
          constraints: BoxConstraints.expand(height: 64),
          child: Column(
            children: <Widget>[
              Container(
                constraints: BoxConstraints.expand(height: 56),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    Expanded(
                      child: Material(
                        color: Colors.transparent,
                        child: InkWell(
                          onTap: () {
                            if (bloc.onPost == true) {
                              bloc.barWidth = 96.0;
                              double firstPosition =
                                  ((bloc.maxBarWidth / 2) / 2) -
                                      (bloc.barWidth / 2);
                              bloc.barPadding = firstPosition;
                              dashboardColor = Black;
                              feedColor = HalfBlack;
                              bloc.notify();
                              bloc.onPost = true;
                              print(bloc.onPost);
                            } else {
                              bloc.barWidth = 96.0;
                              double firstPosition =
                                  ((bloc.maxBarWidth / 2) / 2) -
                                      (bloc.barWidth / 2);
                              bloc.barPadding = firstPosition;
                              dashboardColor = Black;
                              feedColor = HalfBlack;
                              bloc.notify();
                              bloc.onPost = true;
                              print(bloc.onPost);
                            }
                          },
                          child: Container(
                            alignment: Alignment.center,
                            child: MediumParagraph(
                              text: 'Posts',
                              color: dashboardColor,
                            ),
                          ),
                        ),
                      ),
                    ),
                    Expanded(
                      child: Material(
                        color: Colors.transparent,
                        child: InkWell(
                          onTap: () {
                            if (bloc.onPost == false) {
                              bloc.barWidth = 46.0;
                              double secondPosition = ((bloc.maxBarWidth / 2) +
                                  ((bloc.maxBarWidth / 2) / 2)) -
                                  (bloc.barWidth / 2);
                              bloc.barPadding = secondPosition;
                              dashboardColor = HalfBlack;
                              feedColor = Black;
                              bloc.notify();
                              bloc.onPost = false;
                              print(bloc.onPost);
                            } else {
                              bloc.barWidth = 46.0;
                              double secondPosition = ((bloc.maxBarWidth / 2) +
                                  ((bloc.maxBarWidth / 2) / 2)) -
                                  (bloc.barWidth / 2);
                              bloc.barPadding = secondPosition;
                              dashboardColor = HalfBlack;
                              feedColor = Black;
                              bloc.notify();
                              bloc.onPost = false;
                              print(bloc.onPost);
                            }
                          },
                          child: Container(
                            alignment: Alignment.center,
                            child: MediumParagraph(
                              text: 'Your Info',
                              color: feedColor,
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              Container(
                width: maxBarWidth,
                height: 4.0,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: <Widget>[
                    AnimatedContainer(
                      duration: Duration(milliseconds: 500),
                      curve: Curves.easeOutExpo,
                      width: bloc.barPadding,
                      height: 5.0,
                    ),
                    AnimatedContainer(
                      duration: Duration(milliseconds: 500),
                      curve: Curves.easeOutExpo,
                      width: bloc.barWidth,
                      height: 4.0,
                      decoration: BoxDecoration(
                          color: LightGreen,
                          borderRadius: BorderRadius.only(
                            bottomLeft: Radius.circular(3),
                            bottomRight: Radius.circular(3),
                          )),
                    ),
                  ],
                ),
              )
            ],
          ),
        );
      },
    );
  }
}

class PageSwitcher extends StatefulWidget {
  @override
  _PageSwitcherState createState() => _PageSwitcherState();
}

class _PageSwitcherState extends State<PageSwitcher> {
  @override
  Widget build(BuildContext context) {
    return Consumer<ProfileModel>(
      builder: (context, model, child) {
        Widget widgets;
        model.onPost ? widgets = PostsView() : widgets = YourInfoView();

        return AnimatedSwitcher(
          duration: Duration(milliseconds: 200),
          child: widgets,
        );
      },
    );
  }
}

class PostsView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        SizedBox(height: 24,),
        PostCards(),
        PostCards(),
        PostCards(),
        SizedBox(height: 90,)
      ],
    );
  }
}

class YourInfoView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        SizedBox(height: 24,),
        MiniHeader(text: 'Farm Locations :-',),
        SizedBox(height: 10,),
        YourInfoLocationCard(text: 'Tanjung Malim',),
        YourInfoLocationCard(text: 'Gemas',),
        SizedBox(height: 10,),
        MiniHeader(text: 'Preferred Partner Locations :-',),
        SizedBox(height: 10,),
        YourInfoLocationCard(text: 'Tanjung Malim',),
        YourInfoLocationCard(text: 'Gemas',),
        YourInfoLocationCard(text: 'Johor',),
        SizedBox(height: 10,),
        Container(
          margin: EdgeInsets.only(left: 24),
            child: Row(
                children: <Widget>[
                  YourInfoTypes(title: 'Pricing',content: 'Negotiable',),
                  SizedBox(width: 10,),
                  YourInfoTypes(title: 'Account \nType',content: 'Free User',),
                  SizedBox(width: 10,),
                  YourInfoTypes(title: 'Known \nas a..',content: 'Farmer',),
                ],)
        ),
        SizedBox(height: 24,),
        MiniHeader(text: 'Main Crops Sold :-',),
        SizedBox(height: 15,),
        YourInfoCropsCard(text: 'Wheat',),
        YourInfoCropsCard(text: 'Potato',),
        SizedBox(height: 90,),
      ],
    );
  }
}

class YourInfoLocationCard extends StatelessWidget {
  final String text;
  YourInfoLocationCard({this.text});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(left: 24,bottom: 6),
      child: Material(
        borderRadius: BorderRadius.circular(5),
        color: MorePaleGreen,
        child: InkWell(
          borderRadius: BorderRadius.circular(5),
          onTap: (){},
          child: Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(5)
            ),
            height: 50,
            width: 250,
            child: Row(
              children: <Widget>[
                Expanded(
                  flex: 1,
                  child: Container(
                    alignment: Alignment.center,
                    child: Icon(Icons.location_on),
                  ),
                ),
                Expanded(
                  flex: 3,
                  child: Container(
                    alignment: Alignment.centerLeft,
                    child: ParagraphDark(text: text,fontSize: 13,),
                  ),
                ),
                Expanded(
                  flex: 1,
                  child: Container(
                    alignment: Alignment.center,
                    child: Icon(Icons.more_vert),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class YourInfoCropsCard extends StatelessWidget {
  final String text;
  YourInfoCropsCard({this.text});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(left: 24,bottom: 6),
      child: Material(
        borderRadius: BorderRadius.circular(5),
        color: MorePaleGreen,
        child: InkWell(
          borderRadius: BorderRadius.circular(5),
          onTap: (){},
          child: Container(
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(5)
            ),
            height: 50,
            width: 250,
            child: Row(
              children: <Widget>[
                Expanded(
                  flex: 3,
                  child: Container(
                    margin: EdgeInsets.only(left: 20),
                    alignment: Alignment.centerLeft,
                    child: ParagraphDark(text: text,fontSize: 13,),
                  ),
                ),
                Expanded(
                  flex: 1,
                  child: Container(
                    alignment: Alignment.center,
                    child: Icon(Icons.navigate_next),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}


class YourInfoTypes extends StatelessWidget {
  final String title;
  final String content;
  YourInfoTypes({this.title,this.content});

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Material(
        borderRadius: BorderRadius.circular(6),
        color: MorePaleGreen,
        child: InkWell(
          borderRadius: BorderRadius.circular(6),
          onTap: (){},
          child: Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(6),
            ),
            height: 70,
            width: 100,
            child: Column(
              children: <Widget>[
                Expanded(
                  child: Container(
                    alignment: Alignment.bottomCenter,
                    child: ParagraphDark(text: title,fontSize: 12,textAlign: TextAlign.center,),
                  ),
                ),
                Expanded(
                  child: Container(
                    alignment: Alignment.center,
                    child: SemiParagraph(text: content,fontSize: 12,textAlign: TextAlign.center,),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}



class PostCards extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(bottom: 15),
      padding: EdgeInsets.symmetric(horizontal: 24),
      constraints: BoxConstraints.expand(height: 160),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Material(
            borderRadius: BorderRadius.circular(10),
            color: MorePaleGreen,
            child: InkWell(
              onTap: (){},
              borderRadius: BorderRadius.circular(10),
              child: Container(
                height: 160,
                width: 160,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10)
                ),
              ),
            ),
          ),
          SizedBox(width: 15,),
          Material(
            borderRadius: BorderRadius.circular(10),
            color: MorePaleGreen,
            child: InkWell(
              borderRadius: BorderRadius.circular(10),
              onTap: (){},
              child: Container(
                height: 160,
                width: 160,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10)
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}




