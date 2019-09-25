import 'package:flutter/material.dart';
import 'const/route_const.dart';
import 'router.dart' as router;
import 'package:provider/provider.dart';

void main() => runApp(AgryApp());

class AgryApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(builder: (context) => HomeModel()),
        ChangeNotifierProvider(builder: (context) => PanelModel()),
        ChangeNotifierProvider(builder: (context) => ButtonsModel()),
        ChangeNotifierProvider(builder: (context) => ProfileModel()),
        ChangeNotifierProvider(builder: (context) => YourStoreModel()),
        ChangeNotifierProvider(builder: (context) => SignUpModel()),
      ],
      child: MaterialApp(
        home: AgryStart(),
      ),
    );
  }
}

class AgryStart extends StatefulWidget {
  AgryStart({Key key, this.title}) : super(key: key);
  final String title;

  @override
  _AgryStartState createState() => _AgryStartState();
}

class _AgryStartState extends State<AgryStart> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      onGenerateRoute: router.generateRoute,
      initialRoute: StartRoute,
    );
  }
}

class HomeModel extends ChangeNotifier{
  bool _onDashboard = true;
  double _barWidth = 96.0;
  double _barPadding = 26.5;
  double _maxBarWidth;

  bool get onDashboard => _onDashboard;
  double get barWidth => _barWidth;
  double get barPadding => _barPadding;
  double get maxBarWidth => _maxBarWidth;

  void set onDashboard(bool _response){
    _onDashboard = _response;
    notifyListeners();
  }

  void set barWidth(double _response){
    _barWidth = _response;
  }

  void set barPadding(double _response){
    _barPadding = _response;
  }

  void set maxBarWidth(double _response){
    _maxBarWidth = _response;
  }

  void notify(){
    notifyListeners();
  }
}

class PanelModel extends ChangeNotifier{
  bool _onHome;
  bool _onExplore;
  bool _onGroups;
  bool _onCommunity;
  bool _onYourStore;
  bool _onEducation;
  bool _onProfile;
  // DONT NEED BOOL FOR ONCHAT
  bool _onFarmMonitoring;

  bool get onHome => _onHome;
  bool get onExplore => _onExplore;
  bool get onGroups => _onGroups;
  bool get onCommunity => _onCommunity;
  bool get onYourStore => _onYourStore;
  bool get onEducation => _onEducation;
  bool get onProfile => _onProfile;
  bool get onFarmMonitoring => _onFarmMonitoring;

  void userHome(){
    _onHome = true;
    _onExplore = false;
    _onGroups = false;
    _onCommunity = false;
    _onYourStore = false;
    _onEducation = false;
    _onProfile = false;
    _onFarmMonitoring = false;
  }
  void userExplore(){
    _onHome = false;
    _onExplore = true;
    _onGroups = false;
    _onCommunity = false;
    _onYourStore = false;
    _onEducation = false;
    _onProfile = false;
    _onFarmMonitoring = false;
  }
  void userGroups(){
    _onHome = false;
    _onExplore = false;
    _onGroups = true;
    _onCommunity = false;
    _onYourStore = false;
    _onEducation = false;
    _onProfile = false;
    _onFarmMonitoring = false;
  }
  void userCommunity(){
    _onHome = false;
    _onExplore = false;
    _onGroups = false;
    _onCommunity = true;
    _onYourStore = false;
    _onEducation = false;
    _onProfile = false;
    _onFarmMonitoring = false;
  }
  void userYourStore(){
    _onHome = false;
    _onExplore = false;
    _onGroups = false;
    _onCommunity = false;
    _onYourStore = true;
    _onEducation = false;
    _onProfile = false;
    _onFarmMonitoring = false;
  }
  void userEducation(){
    _onHome = false;
    _onExplore = false;
    _onGroups = false;
    _onCommunity = false;
    _onYourStore = false;
    _onEducation = true;
    _onProfile = false;
    _onFarmMonitoring = false;
  }
  void userProfile(){
    _onHome = false;
    _onExplore = false;
    _onGroups = false;
    _onCommunity = false;
    _onYourStore = false;
    _onEducation = false;
    _onProfile = true;
    _onFarmMonitoring = false;
  }
  void userFarmMonitoring(){
    _onHome = false;
    _onExplore = false;
    _onGroups = false;
    _onCommunity = false;
    _onYourStore = false;
    _onEducation = false;
    _onProfile = false;
    _onFarmMonitoring = true;
  }

}

class ButtonsModel extends ChangeNotifier{
  bool _isOpen = false;

  bool get isOpen => _isOpen;

  void set isOpen(_response){
    _isOpen = _response;
    notifyListeners();
  }

}

class ProfileModel extends ChangeNotifier{
  bool _onPost = true;
  double _barWidth = 96.0;
  double _barPadding = 26.5;
  double _maxBarWidth;

  double get barWidth => _barWidth;
  double get barPadding => _barPadding;
  double get maxBarWidth => _maxBarWidth;
  bool get onPost => _onPost;

  void set barWidth(double _response){
    _barWidth = _response;
  }

  void set barPadding(double _response){
    _barPadding = _response;
  }

  void set maxBarWidth(double _response){
    _maxBarWidth = _response;
  }

  void set onPost(_response){
    _onPost = _response;
  }

  void notify(){
    notifyListeners();
  }
}

class YourStoreModel extends ChangeNotifier{
  bool _onCatalog = true;
  double _barWidth = 96.0;
  double _barPadding = 26.5;
  double _maxBarWidth;

  double get barWidth => _barWidth;
  double get barPadding => _barPadding;
  double get maxBarWidth => _maxBarWidth;
  bool get onCatalog => _onCatalog;

  void set barWidth(_response){
    _barWidth = _response;
  }

  void set barPadding(_response){
    _barPadding = _response;
  }

  void set maxBarWidth(_response){
    _maxBarWidth = _response;
  }

  void set onCatalog(_response){
    _onCatalog = _response;
  }

  void notify(){
    notifyListeners();
  }
}

class SignUpModel extends ChangeNotifier{
  bool _chooseFarmer = false;
  bool _chooseCompanies = false;
  bool _chooseOthers = false;
  String _chosenWhat;

  bool get chooseFarmer => _chooseFarmer;
  bool get chooseCompanies => _chooseCompanies;
  bool get chooseOthers => _chooseOthers;
  String get chosenWhat => _chosenWhat;

  void set chooseFarmer(_response){
    _chooseFarmer = _response;
  }
  void set chooseCompanies(_response){
    _chooseCompanies = _response;
  }
  void set chooseOthers(_response){
    _chooseOthers = _response;
  }
  void pickFarmer(){
    _chooseFarmer = true;
    _chooseCompanies = false;
    _chooseOthers = false;
    _chosenWhat = 'farmer';
  }
  void pickCompanies(){
    _chooseFarmer = false;
    _chooseCompanies = true;
    _chooseOthers = false;
    _chosenWhat = 'companies';
  }
  void pickOthers(){
    _chooseFarmer = false;
    _chooseCompanies = false;
    _chooseOthers = true;
    _chosenWhat = 'others';
  }
  void notify(){
    notifyListeners();
  }
}