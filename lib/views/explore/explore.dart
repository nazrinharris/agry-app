import 'package:agry_app_3/const/colors_const.dart';
import 'package:flutter/material.dart';
import 'package:agry_app_3/ui_widgets/texts.dart';
import 'package:sliding_up_panel/sliding_up_panel.dart';
import 'package:agry_app_3/const/route_const.dart';
import 'package:agry_app_3/ui_widgets/slide_panel_master.dart';

class Explore extends StatefulWidget {
  @override
  _ExploreState createState() => _ExploreState();
}

class _ExploreState extends State<Explore> {
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
                          text: 'Explore', textAlign: TextAlign.center,),
                      ),
                    ),
                    Expanded(
                      flex: 1,
                      child: Container(
                        alignment: Alignment.centerRight,
                      ),
                    ),
                  ],
                ),
              )),
          panel: PanelMaster(panelType: 'explore',),
          body: ExploreBody(),
          borderRadius: panelRadius),
    );
  }
}

class ExploreBody extends StatefulWidget {
  @override
  _ExploreBodyState createState() => _ExploreBodyState();
}

class _ExploreBodyState extends State<ExploreBody> {
  @override
  Widget build(BuildContext context) {
    return ListView(
      physics: BouncingScrollPhysics(),
      scrollDirection: Axis.vertical,
      children: <Widget>[
        SizedBox(height: 14,),
        SearchBar(),
        SizedBox(height: 24,),
        DailyNewsSection(),
        SizedBox(height: 24,),
        MoreSection(),
        SizedBox(height: 90,),
      ],
    );
  }
}

class SearchBar extends StatefulWidget {
  @override
  _SearchBarState createState() => _SearchBarState();
}

class _SearchBarState extends State<SearchBar> {
  @override
  Widget build(BuildContext context) {
    return Hero(
      tag: 'searchbar',
      child: Material(
        child: Container(
          child: GestureDetector(
              onTap: (){Navigator.pushNamed(context, SearchRoute);},
            child: Container(
              padding: EdgeInsets.symmetric(horizontal: 24),
              alignment: Alignment.center,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(5),
                color: Colors.white,
                boxShadow: [BoxShadow(color: Black.withOpacity(0.16),offset: Offset(0, 0),blurRadius: 6)]
              ),
              margin: EdgeInsets.symmetric(horizontal: 24),
              constraints: BoxConstraints.expand(height: 44
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  ParagraphDark(text: 'Search here',color: Black.withOpacity(0.5),),
                  Icon(Icons.search)
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}

class DailyNewsSection extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      constraints: BoxConstraints.expand(height: 400),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Padding(
            padding: EdgeInsets.only(left: 24),
            child: ParagraphMedium(text: 'Daily News',),
          ),
          SizedBox(height: 10,),
          DailyCard(
            title: 'Major Bioplant Flaw Discovered',
            content: 'It seems that Plantech\'s new biologically edited plant using CRISPR is very dangerous..',
          ),
          SizedBox(height: 10,),
          DailyCard(
            title: 'Agriculture Revolution 2.0',
            content: 'With the advent of new technologies new advancement are being made esp..',
          ),
          SizedBox(height: 10,),
          DailyCard(
            title: 'New Pasarborong open in Pahang',
            content: 'Since there have been a lot of agriculture activity spurting from the Pahang regio..',
          ),
        ],
      ),
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

class MoreSection extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      constraints: BoxConstraints.expand(
        height: 290
      ),
      child: Column(
        children: <Widget>[
          Container(
            margin: EdgeInsets.only(left: 24),
            alignment: Alignment.topLeft,
            constraints: BoxConstraints.expand(height: 30),
            child: ParagraphHeaderMedium(text: 'More',),
          ),
          Container(
            constraints: BoxConstraints.expand(height: 260),
            child: ListView(
              physics: BouncingScrollPhysics(),
              scrollDirection: Axis.horizontal,
              children: <Widget>[
                SizedBox(width: 24,),
                MoreCards(title: 'tets',),
                SizedBox(width: 10,),
                MoreCards(),
                SizedBox(width: 10,),
                MoreCards(),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class MoreCards extends StatelessWidget {
  final String title;
  MoreCards({this.title});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: <Widget>[
        Material(
          color: KindaWhite,
          borderRadius: BorderRadius.circular(13),
          child: InkWell(
            borderRadius: BorderRadius.circular(13),
            onTap: (){},
            child: Container(
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(13)
              ),
              constraints: BoxConstraints.expand(
                height: 250,
                width: 160,
              ),
            ),
          ),
        ),
      ],
    );
  }
}



