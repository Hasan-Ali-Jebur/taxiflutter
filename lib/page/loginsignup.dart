import 'package:flutter/material.dart';
import 'package:uiflutterjubertaxi/page/login.dart';

import 'onboarding.dart';
import 'signup.dart';

class LoginSignupPage extends StatefulWidget {
  LoginSignupPage({Key key}) : super(key: key);

  @override
  _LoginSignupPageState createState() {
    return _LoginSignupPageState();
  }
}

class _LoginSignupPageState extends State<LoginSignupPage> {
  @override
  void initState() {
    super.initState();


  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    final loginBtn = InkWell(
      onTap: () => _gotonexxt(),
      child: Container(
        height: 50.0,
        width: MediaQuery.of(context).size.width/2-40,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(7.0),
          border: Border.all(color: Colors.white),
          color: Colors.transparent,
        ),
        child: Center(
          child: Text(
            'Log in',
            style: TextStyle(
              fontWeight: FontWeight.w600,
              fontSize: 20.0,
              color: Colors.white,
            ),
          ),
        ),
      ),
    );
    final signupBtn = InkWell(
      onTap: () => _gotonexxt2(),
      child: Container(
        height: 50.0,
        width: MediaQuery.of(context).size.width/2-40,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(7.0),
          border: Border.all(color: Colors.white),
          color: Colors.white,
        ),
        child: Center(
          child: Text(
            'Sign up',
            style: TextStyle(
              fontWeight: FontWeight.w600,
              fontSize: 20.0,
              color: Colors.red,
            ),
          ),
        ),
      ),
    );




    return Scaffold(
      body: Stack(
        children: <Widget>[
          Center(
            child: new Image.asset(
              'assets/images/login.png',
              width: size.width,
              height: size.height,
              fit: BoxFit.fill,
            ),
          ),

          Column(
            children: <Widget>[
              Expanded(
                child: Align(
                  
                  alignment: Alignment.bottomCenter,
                  child: Container(
                    padding: EdgeInsets.all(24),
                    //color: Colors.green,
                    child: Row(

                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: <Widget>[
                        signupBtn,
                       loginBtn

                      ],



                    ),
                  ),
                ),
              ),
            ],

          )
        ],
      ),
    );
  }

  _gotonexxt() {
    print("click");
    Navigator.of(context).push(new MaterialPageRoute(builder: (context) {
      return new LoginPage();

    }));
  }
  _gotonexxt2() {
    print("click");
    Navigator.of(context).push(new MaterialPageRoute(builder: (context) {
      return new SignupPage();

    }));
  }




}