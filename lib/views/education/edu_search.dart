import 'package:agry_app_3/const/colors_const.dart';
import 'package:flutter/material.dart';
import 'package:agry_app_3/main.dart';
import 'package:provider/provider.dart';
import 'package:agry_app_3/ui_widgets/texts.dart';
import 'package:sliding_up_panel/sliding_up_panel.dart';
import 'package:agry_app_3/const/route_const.dart';
import 'package:agry_app_3/ui_widgets/slide_panel_master.dart';

class EduSearch extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: White,
      body: SafeArea(
        child: EduSearchBody(),
      ),
    );
  }
}

class EduSearchBody extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        SearchBar2(),
        SearchContent(),
      ],
    );
  }
}

class SearchBar2 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Hero(
      tag: 'searchbar2',
      child: Material(
        color: Colors.transparent,
        child: Container(
          child: GestureDetector(
            onTap: (){},
            child: Container(
              padding: EdgeInsets.symmetric(horizontal: 24),
              decoration: BoxDecoration(
                  color: Colors.white,
                  boxShadow: [BoxShadow(color: Colors.black.withOpacity(0.16),blurRadius: 6)]
              ),
              constraints: BoxConstraints.expand(
                  height: 58
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  ParagraphDark(text: 'What do you need?',color: Black.withOpacity(0.5),),
                  IconButton(icon: Icon(Icons.close), onPressed: (){Navigator.pop(context);})
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}

class SearchContent extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container();
  }
}
