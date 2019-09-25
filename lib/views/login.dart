import 'package:agry_app_3/ui_widgets/buttons.dart';
import 'package:flutter/material.dart';
import 'package:agry_app_3/const/colors_const.dart';
import 'package:agry_app_3/const/route_const.dart';
import 'package:agry_app_3/ui_widgets/components.dart';
import 'package:agry_app_3/ui_widgets/texts.dart';

class Login extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    final height = MediaQuery.of(context).size.height;

    return Scaffold(
      backgroundColor: PaleGreen,
      body: SafeArea(
        child: Container(
          padding: EdgeInsets.only(left: 14.0, right: 14.0),
          width: width,
          height: height,
          child: Padding(
            padding: const EdgeInsets.only(left: 2.0),
            child: Column(
              children: <Widget>[
                BackArrowWithContainer(
                  onTap: () {Navigator.pop(context);},
                ),
                SizedBox(
                  height: 40.0,
                ),
                Container(
                  padding: EdgeInsets.only(left: 10.0),
                  alignment: Alignment.centerLeft,
                  child: ExtraLargeHeader(
                    text: 'Welcome \nBack!',
                    color: KindaBlue,
                    fontSize: 52,
                  ),
                ),
                SizedBox(
                  height: 40.0,
                ),
                Container(
                  alignment: Alignment.center,
                  constraints: BoxConstraints.expand(height: 350),
                  child: LoginFields(),
                ),
                SizedBox(
                  height: 10.0,
                ),
                Expanded(
                  child: Container(
                    alignment: Alignment.center,
                    child: PrimaryButton1(onTap: () {
                      Navigator.pushNamed(context, HomeRoute);
                    }, text: 'Continue'),
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class LoginFields extends StatefulWidget {
  @override
  _LoginFieldsState createState() => _LoginFieldsState();
}

class _LoginFieldsState extends State<LoginFields> {
  String _email;
  String _password;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(
        top: 30.0,
        left: 14.0,
        right: 24.0,
      ),
      child: Column(
        children: <Widget>[
          TextField(
            decoration: InputDecoration(hintText: 'Enter your email'),
            onChanged: (value) {
              setState(() {
                _email = value;
              });
            },
          ),
          SizedBox(height: 30.0,),
          TextField(
            decoration: InputDecoration(hintText: 'Enter your password'),
            obscureText: true,
            onChanged: (value){
              setState(() {
                _password = value;
              });
            },
          ),
        ],
      ),
    );
  }
}
