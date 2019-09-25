import 'package:agry_app_3/const/colors_const.dart';
import 'package:flutter/material.dart';
import 'package:agry_app_3/main.dart';
import 'package:provider/provider.dart';
import 'package:agry_app_3/ui_widgets/texts.dart';
import 'package:agry_app_3/const/route_const.dart';

class PanelMaster extends StatelessWidget {
  final String panelType;

  PanelMaster({this.panelType});

  @override
  Widget build(BuildContext context) {

    return Container(
      alignment: Alignment.topLeft,
      decoration: BoxDecoration(
        color: White,
      ),
      constraints: BoxConstraints.expand(),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          ProfilePreview(),
          SizedBox(height: 10.0,),
          Container(
            margin: EdgeInsets.symmetric(horizontal: 32.0,),
            color: Colors.black.withOpacity(0.3),
            constraints: BoxConstraints.expand(
              height: 1.0
            ),
          ),
          SizedBox(height: 20.0,),
          PanelList(panelType: panelType,),
        ],
      ),
    );
  }
}

class PanelList extends StatelessWidget {
  final panelType;
  PanelList({this.panelType});

  @override
  Widget build(BuildContext context) {
    return Consumer<PanelModel>(
      builder: (context, model, child){

        switch (panelType) {
          case 'home' : {
            model.userHome();
          }break;
          case 'explore' : {
            model.userExplore();
          }break;
          case 'groups' : {
            model.userGroups();
          }break;
          case 'community' : {
            model.userCommunity();
          }break;
          case 'yourstore' : {
            model.userYourStore();
          }break;
          case 'education' : {
            model.userEducation();
          }break;
          case 'profile' : {
            model.userProfile();
          }break;
          case 'farmmonitoring' : {
            model.userFarmMonitoring();
          }break;
        }

        return Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            HomePanel(onTap: (){Navigator.pushNamed(context, HomeRoute);},isSelected: model.onHome,),
            SizedBox(height: 4.0,),
            ExplorePanel(onTap: (){Navigator.pushNamed(context, ExploreRoute);},isSelected: model.onExplore,),
            SizedBox(height: 4.0,),
            GroupsPanel(onTap: (){Navigator.pushNamed(context, GroupsRoute);},isSelected: model.onGroups,),
            SizedBox(height: 4.0,),
            CommunityPanel(onTap: (){Navigator.pushNamed(context, CommunityRoute);},isSelected: model.onCommunity,),
            SizedBox(height: 4.0,),
            YourStorePanel(onTap: (){Navigator.pushNamed(context, YourStoreRoute);},isSelected: model.onYourStore,),
            SizedBox(height: 4.0,),
            EducationPanel(onTap: (){Navigator.pushNamed(context, EducationRoute);},isSelected: model.onEducation,),
            SizedBox(height: 4.0,),
            ProfilePanel(onTap: (){Navigator.pushNamed(context, ProfileRoute);},isSelected: model.onProfile,),
            SizedBox(height: 4.0,),
            ChatPanel(onTap: (){Navigator.pushNamed(context, ChatRoute);},),
            SizedBox(height: 4.0,),
            FarmMonitoringPanel(onTap: (){Navigator.pushNamed(context, FarmMonitoringRoute);},isSelected: model.onFarmMonitoring,),
          ],
        );
      },
    );
  }
}

class HomePanel extends StatelessWidget {
  final Function onTap;
  final bool isSelected;
  Color colors;
  Color textColor;
  HomePanel({this.onTap,this.isSelected});

  @override
  Widget build(BuildContext context) {
    if(isSelected == true){
      colors = MorePaleGreen;
      textColor = DarkGreen;
    }else{
      colors = Transparent;
      textColor = Black;
    }

    return Material(
      color: Colors.transparent,
      child: InkWell(
        onTap: onTap,
        splashColor: MorePaleGreen,
        highlightColor: PaleGreen.withOpacity(0.5),
        borderRadius: BorderRadius.only(
          topRight: Radius.circular(30),
          bottomRight: Radius.circular(30),
        ),
        child: Container(
          padding: EdgeInsets.only(left: 24.0),
          alignment: Alignment.centerLeft,
          decoration: BoxDecoration(
            color: colors,
              borderRadius: BorderRadius.only(
                topRight: Radius.circular(30),
                bottomRight: Radius.circular(30),
              )
          ),
          constraints: BoxConstraints.expand(
            height: 37,
            width: 280,
          ),
          child: SemiParagraph(text: 'Home',color: textColor,fontSize: 16,),
        ),
      ),
    );
  }
}

class ExplorePanel extends StatelessWidget {
  final Function onTap;
  final bool isSelected;
  Color colors;
  Color textColor;
  ExplorePanel({this.onTap,this.isSelected});

  @override
  Widget build(BuildContext context) {
    if(isSelected == true){
      colors = MorePaleGreen;
      textColor = DarkGreen;
    }else{
      colors = Transparent;
      textColor = Black;
    }

    return Material(
      color: Colors.transparent,
      child: InkWell(
        onTap: onTap,
        splashColor: MorePaleGreen,
        highlightColor: PaleGreen.withOpacity(0.5),
        borderRadius: BorderRadius.only(
          topRight: Radius.circular(30),
          bottomRight: Radius.circular(30),
        ),
        child: Container(
          constraints: BoxConstraints.expand(
            height: 37,
            width: 280,
          ),
          alignment: Alignment.centerLeft,
          padding: EdgeInsets.only(left: 24.0),
          decoration: BoxDecoration(
            color: colors,
            borderRadius: BorderRadius.only(
              topRight: Radius.circular(30),
              bottomRight: Radius.circular(30),
            ),
          ),
          child: SemiParagraph(text: 'Explore',color: textColor,fontSize: 16,),
        ),
      ),
    );
  }
}

class GroupsPanel extends StatelessWidget {
  final Function onTap;
  final bool isSelected;
  Color colors;
  Color textColor;
  GroupsPanel({this.onTap,this.isSelected});

  @override
  Widget build(BuildContext context) {
    if(isSelected == true){
      colors = MorePaleGreen;
      textColor = DarkGreen;
    }else{
      colors = Transparent;
      textColor = Black;
    }

    return Material(
      color: Colors.transparent,
      child: InkWell(
        onTap:  onTap,
        borderRadius: BorderRadius.only(
          topRight: Radius.circular(30),
          bottomRight: Radius.circular(30),
        ),
        child: Container(
          constraints: BoxConstraints.expand(
            height: 37,
            width: 280,
          ),
          alignment: Alignment.centerLeft,
          padding: EdgeInsets.only(left: 24.0),
          decoration: BoxDecoration(
            color: colors,
            borderRadius: BorderRadius.only(
              topRight: Radius.circular(30),
              bottomRight: Radius.circular(30),
            ),
          ),
          child: SemiParagraph(text: 'Groups',color: textColor,fontSize: 16,),
        ),
      ),
    );
  }
}

class CommunityPanel extends StatelessWidget {
  final Function onTap;
  final bool isSelected;
  Color colors;
  Color textColor;
  CommunityPanel({this.onTap,this.isSelected});

  @override
  Widget build(BuildContext context) {
    if(isSelected == true){
      colors = MorePaleGreen;
      textColor = DarkGreen;
    }else{
      colors = Transparent;
      textColor = Black;
    }

    return Material(
      color: Colors.transparent,
      child: InkWell(
        onTap: onTap,
        splashColor: MorePaleGreen,
        highlightColor: PaleGreen.withOpacity(0.5),
        borderRadius: BorderRadius.only(
          topRight: Radius.circular(30),
          bottomRight: Radius.circular(30),
        ),
        child: Container(
          constraints: BoxConstraints.expand(
            height: 37,
            width: 280,
          ),
          alignment: Alignment.centerLeft,
          padding: EdgeInsets.only(left: 24.0),
          decoration: BoxDecoration(
            color: colors,
            borderRadius: BorderRadius.only(
              topRight: Radius.circular(30),
              bottomRight: Radius.circular(30),
            ),
          ),
          child: SemiParagraph(text: 'Community',color: textColor,fontSize: 16,),
        ),
      ),
    );
  }
}

class YourStorePanel extends StatelessWidget {
  final Function onTap;
  final bool isSelected;
  Color colors;
  Color textColor;
  YourStorePanel({this.onTap,this.isSelected});

  @override
  Widget build(BuildContext context) {
    if(isSelected == true){
      colors = MorePaleGreen;
      textColor = DarkGreen;
    }else{
      colors = Transparent;
      textColor = Black;
    }

    return Material(
      color: Colors.transparent,
      child: InkWell(
        onTap: onTap,
        splashColor: MorePaleGreen,
        highlightColor: PaleGreen.withOpacity(0.5),
        borderRadius: BorderRadius.only(
          topRight: Radius.circular(30),
          bottomRight: Radius.circular(30),
        ),
        child: Container(
          constraints: BoxConstraints.expand(
            height: 37,
            width: 280,
          ),
          alignment: Alignment.centerLeft,
          padding: EdgeInsets.only(left: 24.0),
          decoration: BoxDecoration(
            color: colors,
            borderRadius: BorderRadius.only(
              topRight: Radius.circular(30),
              bottomRight: Radius.circular(30),
            ),
          ),
          child: SemiParagraph(text: 'Your Store',color: textColor,fontSize: 16,),
        ),
      ),
    );
  }
}

class EducationPanel extends StatelessWidget {
  final Function onTap;
  final bool isSelected;
  Color colors;
  Color textColor;
  EducationPanel({this.onTap,this.isSelected});

  @override
  Widget build(BuildContext context) {
    if(isSelected == true){
      colors = MorePaleGreen;
      textColor = DarkGreen;
    }else{
      colors = Transparent;
      textColor = Black;
    }

    return Material(
      color: Colors.transparent,
      child: InkWell(
        onTap: onTap,
        splashColor: MorePaleGreen,
        highlightColor: PaleGreen.withOpacity(0.5),
        borderRadius: BorderRadius.only(
          topRight: Radius.circular(30),
          bottomRight: Radius.circular(30),
        ),
        child: Container(
          constraints: BoxConstraints.expand(
            height: 37,
            width: 280,
          ),
          alignment: Alignment.centerLeft,
          padding: EdgeInsets.only(left: 24.0),
          decoration: BoxDecoration(
            color: colors,
            borderRadius: BorderRadius.only(
              topRight: Radius.circular(30),
              bottomRight: Radius.circular(30),
            ),
          ),
          child: SemiParagraph(text: 'Education',color: textColor,fontSize: 16,),
        ),
      ),
    );
  }
}

class ProfilePanel extends StatelessWidget {
  final Function onTap;
  final bool isSelected;
  Color colors;
  Color textColor;
  ProfilePanel({this.onTap,this.isSelected});

  @override
  Widget build(BuildContext context) {
    if(isSelected == true){
      colors = MorePaleGreen;
      textColor = DarkGreen;
    }else{
      colors = Transparent;
      textColor = Black;
    }

    return Material(
      color: Colors.transparent,
      child: InkWell(
        onTap: onTap,
        splashColor: MorePaleGreen,
        highlightColor: PaleGreen.withOpacity(0.5),
        borderRadius: BorderRadius.only(
          topRight: Radius.circular(30),
          bottomRight: Radius.circular(30),
        ),
        child: Container(
          constraints: BoxConstraints.expand(
            height: 37,
            width: 280,
          ),
          alignment: Alignment.centerLeft,
          padding: EdgeInsets.only(left: 24.0),
          decoration: BoxDecoration(
            color: colors,
            borderRadius: BorderRadius.only(
              topRight: Radius.circular(30),
              bottomRight: Radius.circular(30),
            ),
          ),
          child: SemiParagraph(text: 'Profile',color: textColor,fontSize: 16,),
        ),
      ),
    );
  }
}

class ChatPanel extends StatelessWidget {
  final Function onTap;
  ChatPanel({this.onTap});

  @override
  Widget build(BuildContext context) {
    return Material(
      color: Colors.transparent,
      child: InkWell(
        onTap: onTap,
        splashColor: MorePaleGreen,
        highlightColor: PaleGreen.withOpacity(0.5),
        borderRadius: BorderRadius.only(
          topRight: Radius.circular(30),
          bottomRight: Radius.circular(30),
        ),
        child: Container(
          constraints: BoxConstraints.expand(
            height: 37,
            width: 280,
          ),
          alignment: Alignment.centerLeft,
          padding: EdgeInsets.only(left: 24.0),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.only(
              topRight: Radius.circular(30),
              bottomRight: Radius.circular(30),
            ),
          ),
          child: SemiParagraph(text: 'Chat',color: Black,fontSize: 16,),
        ),
      ),
    );
  }
}

class FarmMonitoringPanel extends StatelessWidget {
  final Function onTap;
  final bool isSelected;
  Color colors;
  Color textColor;
  FarmMonitoringPanel({this.onTap,this.isSelected});

  @override
  Widget build(BuildContext context) {
    if(isSelected == true){
      colors = MorePaleGreen;
      textColor = DarkGreen;
    }else{
      colors = Transparent;
      textColor = Black;
    }

    return Material(
      color: Colors.transparent,
      child: InkWell(
        onTap: onTap,
        splashColor: MorePaleGreen,
        highlightColor: PaleGreen.withOpacity(0.5),
        borderRadius: BorderRadius.only(
          topRight: Radius.circular(30),
          bottomRight: Radius.circular(30),
        ),
        child: Container(
          constraints: BoxConstraints.expand(
            height: 37,
            width: 280,
          ),
          alignment: Alignment.centerLeft,
          padding: EdgeInsets.only(left: 24.0),
          decoration: BoxDecoration(
            color: colors,
            borderRadius: BorderRadius.only(
              topRight: Radius.circular(30),
              bottomRight: Radius.circular(30),
            ),
          ),
          child: SemiParagraph(text: 'Farm Monitoring',color: textColor,fontSize: 16,),
        ),
      ),
    );
  }
}

class ProfilePreview extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 24.0),
      margin: EdgeInsets.only(
        top: 10.0,
      ),
      constraints: BoxConstraints.expand(
          height: 80.0
      ),
      child: Container(
        child: Row(
          children: <Widget>[
            Expanded(
              flex: 1,
              child: Container(
                alignment: Alignment.centerLeft,
                child: Container(
                  width: 48.0,
                  height: 48.0,
                  decoration: BoxDecoration(
                    color: MorePaleGreen,
                    borderRadius: BorderRadius.circular(40.0),
                  ),
                ),
              ),
            ),
            Expanded(
              flex: 3,
              child: Container(
                alignment: Alignment.centerLeft,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    SemiParagraph(text: 'Jufayri Hafiz', fontSize: 16,),
                    SizedBox(height: 6.0,),
                    ParagraphDark(text: 'jufayrihafiz@gmail.com',color: Black.withOpacity(0.7),)
                  ],
                ),
              ),
            ),
            Expanded(
              flex: 1,
              child: Container(
                alignment: Alignment.centerRight,
                child: IconButton(icon: Icon(Icons.settings,color: Black.withOpacity(0.7),), onPressed: (){}),
              ),
            ),
          ],
        ),
      ),
    );
  }
}