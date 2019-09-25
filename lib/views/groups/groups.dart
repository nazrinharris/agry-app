import 'package:agry_app_3/const/colors_const.dart';
import 'package:flutter/material.dart';
import 'package:agry_app_3/main.dart';
import 'package:provider/provider.dart';
import 'package:agry_app_3/ui_widgets/texts.dart';
import 'package:sliding_up_panel/sliding_up_panel.dart';
import 'package:agry_app_3/const/route_const.dart';
import 'package:agry_app_3/ui_widgets/slide_panel_master.dart';

class Groups extends StatefulWidget {
  @override
  _GroupsState createState() => _GroupsState();
}

class _GroupsState extends State<Groups> {
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
                          text: 'Groups', textAlign: TextAlign.center,),
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
          panel: PanelMaster(panelType : 'groups'),
          body: GroupsBody(),
          borderRadius: panelRadius),
    );
  }
}

class GroupsBody extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ListView(
      scrollDirection: Axis.vertical,
      physics: BouncingScrollPhysics(),
      children: <Widget>[
        SizedBox(height: 10,),
        GroupHeader(),
        SizedBox(height: 24,),
        GroupCards(
          groupName: 'Doguire Exchange',
          status: 'ongoing',
          statusColor: KindaGrey,
          chatAmount: 17,
          activityAmount: 3,
          paymentAmount: 1,
        ),
        GroupCards(
          groupName: 'Tanjung Deal',
          status: 'ongoing',
          statusColor: KindaGrey,
          chatAmount: 2,
          activityAmount: 4,
          paymentAmount: 7,
        ),
        GroupCards(
          groupName: 'Extradite Initiative',
          status: 'halted',
          statusColor: Red,
          chatAmount: 3,
          activityAmount: 0,
          paymentAmount: 0,
        ),
        GroupCards(
          groupName: 'Sudan Relief',
          status: 'finish',
          statusColor: Colors.white,
          chatAmount: 1,
          activityAmount: 0,
          paymentAmount: 0,
        ),
      ],
    );
  }
}

class GroupCards extends StatelessWidget {
  final String groupName;
  final String status;
  final int chatAmount;
  final int activityAmount;
  final int paymentAmount;
  final Color statusColor;

  GroupCards({this.chatAmount,this.paymentAmount,this.activityAmount,this.groupName,this.status,this.statusColor});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(
        left: 24,
        right: 24,
        bottom: 15,
      ),
      constraints: BoxConstraints.expand(
        height: 120,
        width: 300
      ),
      child: Material(
        elevation: 3,
        borderRadius: BorderRadius.circular(6),
        color: LightGreen,
        child: InkWell(
          borderRadius: BorderRadius.circular(6),
          onTap: (){},
          child: Container(
            padding: EdgeInsets.only(top: 14,right: 14),
            child: Column(
              children: <Widget>[
                Container(
                  padding: EdgeInsets.only(left: 14),
                  constraints: BoxConstraints.expand(
                    height: 20
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      SemiParagraph(text: groupName,),
                      ParagraphDark(text: status,color: statusColor,)
                    ],
                  ),
                ),
                Expanded(child: Container(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      Container(
                        padding: EdgeInsets.only(left: 14),
                        height: 40,
                        width: 230,
                        decoration: BoxDecoration(
                          color: KindaGrey,
                          borderRadius: BorderRadius.only(
                            topRight: Radius.circular(30),
                            bottomRight: Radius.circular(30),
                          )
                        ),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: <Widget>[
                            GroupIcons(iconData : Icons.chat_bubble, amount: chatAmount,),
                            SizedBox(width: 10,),
                            GroupIcons(iconData : Icons.assignment, amount: activityAmount,),
                            SizedBox(width: 10,),
                            GroupIcons(iconData : Icons.attach_money, amount: paymentAmount,),
                          ],
                        ),
                      ),
                      Container(
                        alignment: Alignment.centerRight,
                        child: Icon(Icons.navigate_next, color: KindaGrey,),
                      )
                    ],
                  ),
                ))
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class GroupIcons extends StatelessWidget {
  final IconData iconData;
  final int amount;
  GroupIcons({this.iconData,this.amount});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: <Widget>[
        Icon(iconData, color: LightGreen,),
        SizedBox(width: 5,),
        SemiParagraph(text: amount.toString(), color: Colors.white,)
      ],
    );
  }
}


class GroupHeader extends StatelessWidget {
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
            child: Container(
              alignment: Alignment.centerLeft,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: <Widget>[
                    SemiParagraph(text: 'Groups',fontSize: 30,),
                    SizedBox(width: 10,),
                    Icon(Icons.people, size: 30,),
                  ],
                )
            ),
          ),
          Expanded(
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

