import 'package:agry_app_3/const/colors_const.dart';
import 'package:agry_app_3/ui_widgets/buttons.dart';
import 'package:flutter/material.dart';
import 'package:agry_app_3/main.dart';
import 'package:provider/provider.dart';
import 'package:agry_app_3/ui_widgets/texts.dart';
import 'package:sliding_up_panel/sliding_up_panel.dart';
import 'package:agry_app_3/const/route_const.dart';
import 'package:agry_app_3/ui_widgets/slide_panel_master.dart';

class Education extends StatefulWidget {
  @override
  _EducationState createState() => _EducationState();
}

class _EducationState extends State<Education> {
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
                          text: 'Education', textAlign: TextAlign.center,),
                      ),
                    ),
                    Expanded(
                      flex: 1,
                      child: Container(
                        alignment: Alignment.centerRight,
                        child: IconButton(
                          icon: Icon(Icons.book),
                          onPressed: (){},
                        ),
                      ),
                    ),
                  ],
                ),
              )),
          panel: PanelMaster(panelType : 'education'),
          body: EducationBody(),
          borderRadius: panelRadius),
    );
  }
}

class SearchBar2 extends StatefulWidget {
  @override
  _SearchBar2State createState() => _SearchBar2State();
}

class _SearchBar2State extends State<SearchBar2> {
  @override
  Widget build(BuildContext context) {
    return Hero(
      tag: 'searchbar2',
      child: Material(
        child: Container(
          child: GestureDetector(
            onTap: (){Navigator.pushNamed(context, EducationSearchRoute);},
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

class EducationBody extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ListView(
      physics: BouncingScrollPhysics(),
      children: <Widget>[
        SizedBox(height: 14,),
        SearchBar2(),
        SizedBox(height: 24,),
        Container(margin: EdgeInsets.only(left: 24),child: ParagraphHeader(text: 'Trending',fontSize: 20,)),
        SizedBox(height: 20,),
        TrendingCard(
          title: 'The Unknown way of Crop Management',
          content: 'Now the world is changing indefinitely, and adoption of new and improved tech is no longer something to ignore. Tons of advances have been made but genetically modified DNA of plants ha..',
          author: 'Plantech',
        ),
        TrendingCard(
          title: 'Jangan sembur peracun pada D45',
          content: 'Kajian baru telah membuktikan bahawa peracun serangga mengakifkan sesuatu penyakit pada padi jenis D45 dan boleh merebak ke satu ladang dengan kadar masa yang singkat, dinashi..',
          author: 'Jabatan Pertanian \nMalaysia',
        ),
        TrendingCard(
          title: 'Traditional Potato Harvesting',
          content: 'Here\'s a quick lesson to teach you how to farm your potatoes. The traditional way. Now there are a plethora of reasons on why you might want to harvest traditonally rath..',
          author: 'Joe Fazli',
        ),
        SizedBox(height: 14,),
        MoreSection(),
        SizedBox(height: 90,)
      ],
    );
  }
}

class TrendingCard extends StatelessWidget {
  final String title;
  final String content;
  final String author;
  TrendingCard({this.title,this.content,this.author});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(
        left: 24,
        right: 24,
          top: 20,
        bottom: 14,
      ),
      margin: EdgeInsets.only(bottom: 15),
      color: KindaWhite,
      constraints: BoxConstraints.expand(
        height: 180
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
            constraints: BoxConstraints.expand(height: 70),
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
                    child: SmallerPrimaryButton(text: 'Read',onTap: (){},),
                  ),),
                  Expanded(child: Container(
                    alignment: Alignment.centerRight,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: <Widget>[
                        ParagraphDark(text: author,textAlign: TextAlign.right,),
                        IconButton(icon: Icon(Icons.bookmark_border),onPressed: (){print('TAP!');},),
                      ],
                    ),
                  ),),
                ],
              ),
            ),
          )
        ],
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


