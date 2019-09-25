import 'package:agry_app_3/const/colors_const.dart';
import 'package:agry_app_3/ui_widgets/buttons.dart';
import 'package:flutter/material.dart';
import 'package:agry_app_3/main.dart';
import 'package:provider/provider.dart';
import 'package:agry_app_3/ui_widgets/texts.dart';
import 'package:sliding_up_panel/sliding_up_panel.dart';
import 'package:agry_app_3/const/route_const.dart';
import 'package:agry_app_3/ui_widgets/slide_panel_master.dart';

class FarmMonitoring extends StatefulWidget {
  @override
  _FarmMonitoringState createState() => _FarmMonitoringState();
}

class _FarmMonitoringState extends State<FarmMonitoring> {
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
                          text: 'Farm Monitoring', textAlign: TextAlign.center,),
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
          panel: PanelMaster(panelType : 'farmmonitoring'),
          body: FarmMonitoringBody(),
          borderRadius: panelRadius),
    );
  }
}

class FarmMonitoringBody extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ListView(
      children: <Widget>[
        SizedBox(height: 10,),
        MainHeader(text: 'Farm Monitoring',),
        SizedBox(height: 200,),
        AttentionWidget(),
      ],
    );
  }
}

class AttentionWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      constraints: BoxConstraints.expand(
        height: 235,
      ),
      alignment: Alignment.center,
      child: Column(
        children: <Widget>[
          ParagraphHeader(text: 'Whoops! This \nfeature isn\'t available \nfor free users.\nUpgrade to attain the \nnew feature!',textAlign: TextAlign.left,),
          SizedBox(height: 24,),
          Container(
              child: PrimaryButton1(onTap: (){}, text: 'Upgrade My Account!'),width: 250,)
        ],
      ),
    );
  }
}



