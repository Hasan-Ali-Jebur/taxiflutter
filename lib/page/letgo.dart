import 'package:flutter/material.dart';
import 'package:uiflutterjubertaxi/page/home.dart';
import 'package:uiflutterjubertaxi/page/login.dart';
import 'package:uiflutterjubertaxi/widget/mybutton.dart';

import '../uidata.dart';

class LetGoPage extends StatelessWidget {
  LetGoPage({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      body: Stack(
        children: <Widget>[
          Image.asset(
            'assets/images/letgo.png',
            width: size.width,
            height: size.height,
            fit: BoxFit.fill,
          ),
          Padding(
            padding: const EdgeInsets.only(bottom: 100),
            child: Container(
              width: size.width,
              //color: Colors.green,
              child: Column(
                mainAxisSize: MainAxisSize.max,
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: <Widget>[
                  Spacer(),
                  MyButton(
                      caption: "USE MY LOCATION",
                      onPressed: () {
                        print("Tapped Me");
                      }),
                  SizedBox(height: 24,),
                  GestureDetector(
                      onTap: () => {
                            Navigator.of(context).pushReplacement(
                                new MaterialPageRoute(builder: (context) {
                              return new LoginPage();
                            }))
                          },
                      child: Text(
                        "Go to Login",
                        style: TextStyle(fontSize: 18),
                      ))
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }


}
