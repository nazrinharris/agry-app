import 'package:agry_app_3/const/colors_const.dart';
import 'package:agry_app_3/const/route_const.dart';
import 'package:flutter/material.dart';
import 'package:agry_app_3/ui_widgets/texts.dart';
import 'package:sliding_up_panel/sliding_up_panel.dart';
import 'package:agry_app_3/ui_widgets/slide_panel_master.dart';

class Community extends StatefulWidget {
  @override
  _CommunityState createState() => _CommunityState();
}

class _CommunityState extends State<Community> {
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
                          text: 'Community', textAlign: TextAlign.center,),
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
          panel: PanelMaster(panelType: 'community',),
          body: CommunityBody(),
          borderRadius: panelRadius),
    );
  }
}

class CommunityBody extends StatefulWidget {
  @override
  _CommunityBodyState createState() => _CommunityBodyState();
}

class _CommunityBodyState extends State<CommunityBody> {
  @override
  Widget build(BuildContext context) {
    return ListView(
      children: <Widget>[
        SizedBox(height: 10,),
        Headers(),
        SizedBox(height: 20,),
        Container(margin: EdgeInsets.only(left: 24),child: ParagraphHeader(text: 'Joined',fontSize: 20,)),
        SizedBox(height: 15,),
        CommunityCard(title: 'Pahang Petany', onTap: (){Navigator.pushNamed(context, PPHomeRoute);},),
        SizedBox(height: 15,),
        CommunityCard(title: 'Gemas Collective', onTap: (){},),
        SizedBox(height: 15,),
        CommunityCard(title: 'Jabatan Pertanian Malaysia', onTap: (){},)
      ],
    );
  }
}

class CommunityCard extends StatelessWidget {
  final String title;
  final Function onTap;
  CommunityCard({this.title,this.onTap});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 24),
      child: Material(
        color: LightGreen,
        shadowColor: LightGreen,
        elevation: 2,
        borderRadius: BorderRadius.circular(10),
        child: InkWell(
          borderRadius: BorderRadius.circular(10),
          onTap: onTap,
          child: Container(
            alignment: Alignment.centerLeft,
            margin: EdgeInsets.symmetric(horizontal: 24),
            constraints: BoxConstraints.expand(height: 75),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                SemiParagraph(text: title,),
                Icon(Icons.navigate_next,color: KindaGrey,),
              ],
            ),
          ),
        ),
      ),
    );
  }
}


class Headers extends StatelessWidget {
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
            flex: 2,
            child: Container(
                alignment: Alignment.centerLeft,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: <Widget>[
                    SemiParagraph(text: 'Community',fontSize: 30,),
                    SizedBox(width: 10,),
                    Icon(Icons.domain, size: 30,),
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



