import 'dart:ui';

import 'package:agry_app_3/const/colors_const.dart';
import 'package:agry_app_3/ui_widgets/buttons.dart';
import 'package:flutter/material.dart';
import 'package:agry_app_3/main.dart';
import 'package:provider/provider.dart';
import 'package:agry_app_3/ui_widgets/texts.dart';
import 'package:sliding_up_panel/sliding_up_panel.dart';
import 'package:agry_app_3/const/route_const.dart';
import 'package:agry_app_3/ui_widgets/slide_panel_master.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  PanelController _pc = new PanelController();

  final double _initFabHeight = 80.0;
  double _fabHeight;
  double _panelHeightOpen = 500.0;
  double _panelHeightClosed = 62.0;

  @override
  void initState(){
    super.initState();

    _fabHeight = _initFabHeight;
  }

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    BorderRadiusGeometry panelRadius = BorderRadius.only(
      topLeft: Radius.circular(11.0),
      topRight: Radius.circular(11.0),
    );

    return Scaffold(
      bottomNavigationBar: null,
      backgroundColor: Colors.white,
      body: Stack(
        children: <Widget>[
          SlidingUpPanel(
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
              onPanelSlide: (double pos) => setState((){
                _fabHeight = pos * (_panelHeightOpen - _panelHeightClosed) + _initFabHeight;
              }),
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
                            child: IconButton(icon: Icon(Icons.menu), onPressed: (){_pc.open();}),
                          ),
                        ),
                        Expanded(
                          flex: 4,
                          child: Container(
                            alignment: Alignment.center,
                            child: SemiParagraph(text: 'Home', textAlign: TextAlign.center,),
                          ),
                        ),
                        Expanded(
                          flex: 1,
                          child: Container(
                            alignment: Alignment.centerRight,
                            child: IconButton(icon: Icon(Icons.forum), onPressed: (){Navigator.pushNamed(context, ChatRoute);}),
                          ),
                        ),
                      ],
                    ),
                  )),
              panel: PanelMaster(panelType: 'home',),
              body: ListView(
                physics: BouncingScrollPhysics(),
                children: <Widget>[
                  SizedBox(height: 20,),
                  MainHeader(text: 'Home', iconData: Icons.home,),
                  TopNavWidget(),
                  PageSwitcher(),
                ],
              ),
              borderRadius: panelRadius),

          Positioned(
            right: 20.0,
            bottom: _fabHeight,
            child: FloatingActionButton(
              child: Icon(
                Icons.add,
                color: PaleGreen,
              ),
              onPressed: (){},
              backgroundColor: KindaGrey,
            ),
          ),

        ],
      )
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

    return Consumer<HomeModel>(
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
                            if (bloc.onDashboard == true) {
                              bloc.barWidth = 96.0;
                              double firstPosition =
                                  ((bloc.maxBarWidth / 2) / 2) -
                                      (bloc.barWidth / 2);
                              bloc.barPadding = firstPosition;
                              dashboardColor = Black;
                              feedColor = HalfBlack;
                              bloc.notify();
                              bloc.onDashboard = true;
                              print(bloc.onDashboard);
                            } else {
                              bloc.barWidth = 96.0;
                              double firstPosition =
                                  ((bloc.maxBarWidth / 2) / 2) -
                                      (bloc.barWidth / 2);
                              bloc.barPadding = firstPosition;
                              dashboardColor = Black;
                              feedColor = HalfBlack;
                              bloc.notify();
                              bloc.onDashboard = true;
                              print(bloc.onDashboard);
                            }
                          },
                          child: Container(
                            alignment: Alignment.center,
                            child: MediumParagraph(
                              fontSize: 25,
                              text: 'Dashboard',
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
                            if (bloc.onDashboard == false) {
                              bloc.barWidth = 46.0;
                              double secondPosition = ((bloc.maxBarWidth / 2) +
                                      ((bloc.maxBarWidth / 2) / 2)) -
                                  (bloc.barWidth / 2);
                              bloc.barPadding = secondPosition;
                              dashboardColor = HalfBlack;
                              feedColor = Black;
                              bloc.notify();
                              bloc.onDashboard = false;
                              print(bloc.onDashboard);
                            } else {
                              bloc.barWidth = 46.0;
                              double secondPosition = ((bloc.maxBarWidth / 2) +
                                      ((bloc.maxBarWidth / 2) / 2)) -
                                  (bloc.barWidth / 2);
                              bloc.barPadding = secondPosition;
                              dashboardColor = HalfBlack;
                              feedColor = Black;
                              bloc.notify();
                              bloc.onDashboard = false;
                              print(bloc.onDashboard);
                            }
                          },
                          child: Container(
                            alignment: Alignment.center,
                            child: MediumParagraph(
                              fontSize: 25,
                              text: 'Your Feed',
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
    return Consumer<HomeModel>(
      builder: (context, model, child) {
        Widget widgets;
        model.onDashboard ? widgets = DashboardView() : widgets = FeedView();

        return AnimatedSwitcher(
          duration: Duration(milliseconds: 200),
          child: widgets,
        );
      },
    );
  }
}

class DashboardView extends StatefulWidget {
  @override
  _DashboardViewState createState() => _DashboardViewState();
}

class _DashboardViewState extends State<DashboardView> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        Container(
          constraints: BoxConstraints.expand(height: 310),
          margin: EdgeInsets.symmetric(vertical: 10),
          child: Column(
            children: <Widget>[
              Container(
                padding: EdgeInsets.only(left: 24.0,),
                alignment: Alignment.topLeft,
                constraints: BoxConstraints.expand(height: 50),
                child: ParagraphHeader(text: 'Recent',),
              ),
              Container(
                constraints: BoxConstraints.expand(
                  height: 260
                ),
                child: ListView(
                  scrollDirection: Axis.horizontal,
                  physics: BouncingScrollPhysics(),
                  children: <Widget>[
                    SizedBox(width: 14,),
                    RecentCards(title: 'Doguire\nExchange',
                      chatAmount: 17,
                      groupsAmount: 3,
                      paymentAmount: 1,
                    ),
                    RecentCards(title: 'Tanjung\nDeal',
                      chatAmount: 2,
                      groupsAmount: 4,
                      paymentAmount: 7,
                    ),
                    RecentCards(title: 'Extradite\nComposite',
                      chatAmount: 3,
                      groupsAmount: 0,
                      paymentAmount: 0,
                    ),
                    RecentCards(title: 'Replant\nProject',
                      chatAmount: 41,
                      groupsAmount: 6,
                      paymentAmount: 0,
                    ),
                  ],
                ),
              )
            ],
          ),
        ),
        SizedBox(height: 24,),
        RecentTutorialAlert(),
        SizedBox(height: 90,),
      ],
    );
  }
}

class RecentCards extends StatelessWidget {
  final String title;
  final int chatAmount;
  final int groupsAmount;
  final int paymentAmount;
  RecentCards({this.chatAmount,this.groupsAmount,this.paymentAmount,this.title});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: <Widget>[
        SizedBox(width: 10,),
        Material(
          elevation: 2.0,
          color: LightGreen,
          borderRadius: BorderRadius.circular(13),
          child: InkWell(
            borderRadius: BorderRadius.circular(13),
            splashColor: PaleGreen,
            highlightColor: PaleGreen.withOpacity(0.5),
            onTap: (){},
            child: Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(13)
              ),
              constraints: BoxConstraints.expand(
                height: 250,
                width: 160,
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: <Widget>[
                  SizedBox(height: 24.0,),
                  SemiParagraph(text: title,textAlign: TextAlign.center,),
                  SizedBox(height: 40.0,),
                  RecentCardIcon(icon: Icons.chat_bubble,amount: chatAmount.toString(),),
                  RecentCardIcon(icon: Icons.assignment,amount: groupsAmount.toString(),),
                  RecentCardIcon(icon: Icons.euro_symbol,amount: paymentAmount.toString(),),
                ],
              ),
            ),
          ),
        ),
      ],
    );
  }
}

class RecentCardIcon extends StatelessWidget {
  final IconData icon;
  final String amount;
  RecentCardIcon({this.amount,this.icon});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(bottom: 18.0),
      alignment: Alignment.center,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Icon(icon,color: Colors.black,),
          SizedBox(width: 10,),
          SemiParagraph(text: amount,fontSize: 21,)
        ],
      ),
    );
  }
}

class RecentTutorialAlert extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(constraints: BoxConstraints.expand(height: 150),
      child: Column(
        children: <Widget>[
          Container(
            alignment: Alignment.center,
            constraints: BoxConstraints.expand(height: 28),
            child: Icon(Icons.close, color: Colors.black.withOpacity(0.5),),
          ),
          Container(
            constraints: BoxConstraints.expand(height: 57),
            alignment: Alignment.bottomCenter,
            child: SemiParagraphItalic(
              text: 'Hey! Did you know you could \nfully customize your dashboard?',
              color: Colors.black.withOpacity(0.5),
              textAlign: TextAlign.center,
            ),
          ),
          Expanded(
            child: Container(
              alignment: Alignment.bottomCenter,
              child: PrimaryButton2(onTap: (){}, text: 'Start my tutorial'),
            ),
          )
        ],
      ),
    );
  }
}



class FeedView extends StatefulWidget {
  @override
  _FeedViewState createState() => _FeedViewState();
}

class _FeedViewState extends State<FeedView> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        SizedBox(height: 14.0,),
        ExplorePost(
          name: 'Hafiz Denzolo',
          details: 'A little close up image of my favourite huge \ncow betty!',
          likeCount: '216',
          chatCount: '20',
        ),
        ExplorePost(
          name: 'Hafiz Denzolo',
          details: 'A little close up image of my favourite huge \ncow betty!',
          likeCount: '216',
          chatCount: '20',
        ),
        DailyCard(
          title: 'Major Bioplant Flaw Discovered',
          content: 'It seems that Plantech\'s new biologically edited plant using CRISPR is very dangerous..',
        ),
        SizedBox(height: 10,),
        DailyCard(
          title: 'Agriculture Revolution 2.0',
          content: 'With the advent of new technologies new advancement are being made esp..',
        ),
        SizedBox(height: 24,),
        ExplorePost(
          name: 'Hafiz Denzolo',
          details: 'A little close up image of my favourite huge \ncow betty!',
          likeCount: '216',
          chatCount: '20',
        ),
        SizedBox(height: 90,),
      ],
    );
  }
}

class DailyCard extends StatelessWidget {
  final String title;
  final String content;
  DailyCard({this.title,this.content});

  @override
  Widget build(BuildContext context) {
    return Material(
      color: KindaWhite,
      child: InkWell(
        onTap: (){},
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
                        color: PaleGreen,
                        borderRadius: BorderRadius.circular(4)
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

class ExplorePost extends StatelessWidget {
  final String profileAsset;
  final String imageAsset;
  final String name;
  final String details;
  final String likeCount;
  final String chatCount;

  ExplorePost(
      {this.name,
        this.details,
        this.imageAsset,
        this.profileAsset,
        this.likeCount,
        this.chatCount});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(
        horizontal: 24.0,
      ),
      constraints: BoxConstraints.expand(
        height: 510.0,
      ),
      child: Column(
        children: <Widget>[
          Container(
            constraints: BoxConstraints.expand(
              height: 120.0,
            ),
            child: Column(
              children: <Widget>[
                Expanded(
                  child: Row(
                    children: <Widget>[
                      Container(
                        decoration: BoxDecoration(
                            color: MorePaleGreen,
                            borderRadius: BorderRadius.circular(30.0),
                            boxShadow: [
                              BoxShadow(
                                  color: Color(0xff000000).withOpacity(0.05),
                                  blurRadius: 10.0)
                            ]),
                        width: 55,
                        height: 55,
                      ),
                      SizedBox(
                        width: 20.0,
                        height: 10.0,
                      ),
                      Expanded(
                        child: Container(
                          child: Text(
                            name,
                            style: TextStyle(
                              fontFamily: 'Metropolis',
                              fontWeight: FontWeight.w700,
                              color: KindaGrey,
                              fontSize: 18.0,
                            ),
                          ),
                        ),
                      ),
                      Expanded(
                        child: Container(
                          alignment: Alignment.centerRight,
                          child: Icon(
                            Icons.more_vert,
                            color: KindaGrey,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                SizedBox(
                  width: 10.0,
                  height: 20.0,
                ),
                Container(
                  constraints: BoxConstraints.expand(
                    height: 47.0,
                  ),
                  child: Text(
                    details,
                    style: TextStyle(
                      fontFamily: 'Metropolis',
                      color: KindaGrey,
                      fontSize: 14.0,
                    ),
                  ),
                ),
              ],
            ),
          ),
          Container(
            decoration: BoxDecoration(
                color: MorePaleGreen,
                borderRadius: BorderRadius.circular(15.0),
                boxShadow: [
                  BoxShadow(
                      color: Colors.black.withOpacity(0.05),
                      blurRadius: 10.0,
                      offset: Offset(0, 3.0))
                ]),
            constraints: BoxConstraints.expand(
              height: 300.0,
            ),
          ),
          SizedBox(
            width: 10.0,
            height: 20.0,
          ),
          Container(
            constraints: BoxConstraints.expand(
              height: 30.0,
            ),
            child: Row(
              children: <Widget>[
                Expanded(
                  child: Row(
                    children: <Widget>[
                      Container(
                        padding: EdgeInsets.only(
                          left: 20.0,
                        ),
                        alignment: Alignment.centerLeft,
                        child: Icon(
                          Icons.sentiment_very_satisfied,
                          color: KindaGrey,
                        ),
                      ),
                      SizedBox(
                        width: 10.0,
                        height: 10.0,
                      ),
                      Text(
                        likeCount,
                        style: TextStyle(
                          fontFamily: 'Metropolis',
                          fontWeight: FontWeight.w700,
                          color: KindaGrey,
                          fontSize: 16.0,
                        ),
                      ),
                      SizedBox(
                        width: 20.0,
                        height: 10.0,
                      ),
                      Icon(
                        Icons.chat_bubble_outline,
                        color: KindaGrey,
                      ),
                      SizedBox(
                        width: 10.0,
                        height: 10.0,
                      ),
                      Text(
                        chatCount,
                        style: TextStyle(
                          fontFamily: 'Metropolis',
                          fontWeight: FontWeight.w700,
                          color: KindaGrey,
                          fontSize: 16.0,
                        ),
                      ),
                    ],
                  ),
                ),
                Expanded(
                  child: Container(
                    padding: EdgeInsets.only(right: 20.0),
                    alignment: Alignment.centerRight,
                    child: Icon(
                      Icons.bookmark_border,
                      color: KindaGrey,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
