import 'package:agry_app_3/const/colors_const.dart';
import 'package:agry_app_3/ui_widgets/buttons.dart';
import 'package:flutter/material.dart';
import 'package:agry_app_3/main.dart';
import 'package:provider/provider.dart';
import 'package:agry_app_3/ui_widgets/texts.dart';
import 'package:sliding_up_panel/sliding_up_panel.dart';
import 'package:agry_app_3/const/route_const.dart';
import 'package:agry_app_3/ui_widgets/slide_panel_master.dart';
import 'package:charts_flutter/flutter.dart' as charts;

class YourStore extends StatefulWidget {
  @override
  _YourStoreState createState() => _YourStoreState();
}

class _YourStoreState extends State<YourStore> {
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
                          text: 'Your Store', textAlign: TextAlign.center,),
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
          panel: PanelMaster(panelType : 'yourstore'),
          body: YourStoreBody(),
          borderRadius: panelRadius),
    );
  }
}

class chartData{
  String sales;
  double salesValue;
  Color color;
  chartData({this.sales,this.color,this.salesValue});
}

class YourStoreBody extends StatefulWidget {
  @override
  _YourStoreBodyState createState() => _YourStoreBodyState();
}

class _YourStoreBodyState extends State<YourStoreBody> {

  List<charts.Series<chartData,String>> _seriesData;

  _generateData(){
    var data = [
      chartData(sales: 'Jan', salesValue: 21, color: LightGreen),
      chartData(sales: 'Feb', salesValue: 12, color: LightGreen),
      chartData(sales: 'Mar', salesValue: 14, color: LightGreen),
      chartData(sales: 'Apr', salesValue: 15, color: LightGreen),
      chartData(sales: 'May', salesValue: 67, color: LightGreen),
      chartData(sales: 'Jun', salesValue: 89, color: LightGreen),
    ];

    _seriesData.add(
      charts.Series(
        data: data,
        domainFn: (chartData chartData,_) => chartData.sales,
        measureFn: (chartData chartData,_) => chartData.salesValue,
        id: 'Data',
        labelAccessorFn: (chartData row,_) => '${row.salesValue}',

      ),
    );
  }

  @override
  void initState(){
    super.initState();
    _seriesData = List<charts.Series<chartData,String>>();
    _generateData();
  }

  @override
  Widget build(BuildContext context) {
    return ListView(
      physics: BouncingScrollPhysics(),
      children: <Widget>[
        SizedBox(height: 20,),
        MainHeader(text: 'Your Store', iconData: Icons.shopping_basket,),
        TopNavWidget(),
        PageSwitcher(),
      ],
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

    return Consumer<YourStoreModel>(
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
                            if (bloc.onCatalog == true) {
                              bloc.barWidth = 96.0;
                              double firstPosition =
                                  ((bloc.maxBarWidth / 2) / 2) -
                                      (bloc.barWidth / 2);
                              bloc.barPadding = firstPosition;
                              dashboardColor = Black;
                              feedColor = HalfBlack;
                              bloc.notify();
                              bloc.onCatalog = true;
                              print(bloc.onCatalog);
                            } else {
                              bloc.barWidth = 96.0;
                              double firstPosition =
                                  ((bloc.maxBarWidth / 2) / 2) -
                                      (bloc.barWidth / 2);
                              bloc.barPadding = firstPosition;
                              dashboardColor = Black;
                              feedColor = HalfBlack;
                              bloc.notify();
                              bloc.onCatalog = true;
                              print(bloc.onCatalog);
                            }
                          },
                          child: Container(
                            alignment: Alignment.center,
                            child: MediumParagraph(
                              text: 'Your Catalog',
                              fontSize: 25,
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
                            if (bloc.onCatalog == false) {
                              bloc.barWidth = 46.0;
                              double secondPosition = ((bloc.maxBarWidth / 2) +
                                  ((bloc.maxBarWidth / 2) / 2)) -
                                  (bloc.barWidth / 2);
                              bloc.barPadding = secondPosition;
                              dashboardColor = HalfBlack;
                              feedColor = Black;
                              bloc.notify();
                              bloc.onCatalog = false;
                              print(bloc.onCatalog);
                            } else {
                              bloc.barWidth = 46.0;
                              double secondPosition = ((bloc.maxBarWidth / 2) +
                                  ((bloc.maxBarWidth / 2) / 2)) -
                                  (bloc.barWidth / 2);
                              bloc.barPadding = secondPosition;
                              dashboardColor = HalfBlack;
                              feedColor = Black;
                              bloc.notify();
                              bloc.onCatalog = false;
                              print(bloc.onCatalog);
                            }
                          },
                          child: Container(
                            alignment: Alignment.center,
                            child: MediumParagraph(
                              fontSize: 25,
                              text: 'Analytics',
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
    return Consumer<YourStoreModel>(
      builder: (context, model, child) {
        Widget widgets;
        model.onCatalog ? widgets = YourCatalogView() : widgets = AnalyticsView();

        return AnimatedSwitcher(
          duration: Duration(milliseconds: 200),
          child: widgets,
        );
      },
    );
  }
}

class YourCatalogView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        SizedBox(height: 24,),
        CatalogCard(
          title: 'Potato Combo 5KG',
          content: '5KG of Fresh Potato, \nAvailable between March to July \nRM25',
          type: 'commerce',
        ),
        SizedBox(height: 15,),
        CatalogCard(
          title: 'Potato Load 50KG',
          content: '50KG of Fresh Potato, \nAvailable between January to July \nRM25',
          type: 'commerce',
        ),
        SizedBox(height: 15,),
        CatalogCard(
          title: 'Potato Tonne 100KG+',
          content: '100KG+ of Fresh Potato, \nPrice and availability will be negotiated',
          type: 'contract',
        ),
        SizedBox(height: 15,),
        CatalogCard(
          title: 'Wheat Tonne 100KG+',
          content: '100KG+ of Wheat, \nPrice and availability will be negotiated',
          type: 'contract',
        ),
        SizedBox(height: 15,),
        Container(
          alignment: Alignment.center,
          constraints: BoxConstraints.expand(height: 40),
          child: SmallerPrimaryButton(
            text: '+ Add Product To Catalog',
            onTap: (){},
            height: 35,
            width: 240,
          ),
        ),
        SizedBox(height: 90,),
      ],
    );
  }
}

class AnalyticsView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 24,right: 24),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          SizedBox(height: 24,),
          Container(
              alignment: Alignment.centerLeft,
                child: ParagraphMedium(text: 'Sales',)),
          SizedBox(height: 15,),
          Container(
            constraints: BoxConstraints.expand(
              height: 210
            ),
            child: Container(
              decoration: BoxDecoration(
                color: KindaGrey,
                borderRadius: BorderRadius.circular(10),
              ),
            ),
          ),
          SizedBox(height: 34,),
          Row(
            children: <Widget>[
              AnalyticsCard(
                title: 'Avg. \nMonthly Sales',
                value: 47,
                color: LightGreen,
              ),
              SizedBox(width: 15,),
              AnalyticsCard(
                title: 'Avg. Daily \nUser Visits',
                value: 9,
                color: LightGreen,
              ),
            ],
          ),
          SizedBox(height: 15,),
          Row(
            children: <Widget>[
              AnalyticsCard(
                title: 'Last Month \nSales',
                value: 54,
                color: PaleGreen,
              ),
              SizedBox(width: 15,),
              AnalyticsCard(
                title: 'Current Month \nSales',
                value: 21,
                color: KindaRed,
              ),
            ],
          ),
          SizedBox(height: 90,),
        ],
      ),
    );
  }
}

class CatalogCard extends StatelessWidget {
  final String title;
  final String content;
  final String type;
  CatalogCard({this.title,this.content,this.type});

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
                  child: Column(
                    children: <Widget>[
                      Expanded(
                        flex: 1,
                        child: Container(
                          alignment: Alignment.bottomLeft,
                          child: ParagraphDark(text: type, fontSize: 12,),
                        ),
                      ),
                      Expanded(
                        flex: 2,
                        child: Container(
                          alignment: Alignment.topRight,
                          child: Icon(Icons.navigate_next,color: Grey,),
                        ),
                      )
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class AnalyticsCard extends StatelessWidget {
  final String title;
  final int value;
  final Color color;
  AnalyticsCard({this.title,this.value,this.color});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 150,
      width: 150,
      decoration: BoxDecoration(
        color: KindaGrey,
        borderRadius: BorderRadius.circular(10),
      ),
      child: Column(
        children: <Widget>[
          SizedBox(height: 14,),
          Container(constraints: BoxConstraints.expand(height: 60),
            child: SemiParagraph(text: title, color: KindaWhite,textAlign: TextAlign.center,),
          ),
          Container(constraints: BoxConstraints.expand(height: 76),
            alignment: Alignment.topCenter,
            child: SemiParagraph(text: value.toString(), fontSize: 41,color: color,),
          )
        ],
      ),
    );
  }
}
