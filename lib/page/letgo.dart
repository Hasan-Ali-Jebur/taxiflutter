import 'package:flutter/material.dart';
import 'package:uiflutterjubertaxi/page/home.dart';

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
          Center(
            child: SizedBox(
                width: 200,
                height: 50,
                child: FlatButton(
                  color: UIData.Bassic,
                  textColor: Colors.white,
                  disabledColor: Colors.grey,
                  disabledTextColor: Colors.black,
                  padding: EdgeInsets.all(8.0),
                  splashColor: Colors.blueAccent,
                  onPressed: () {
//                    Navigator.of(context)
//                        .pushReplacement(new MaterialPageRoute(builder: (context) {
//                      return new HomePage();
//                    }));
                    Navigator.of(context)
                        .pushNamedAndRemoveUntil('/home', (Route<dynamic> route) => false);
                  },
                  child: Text(
                    "GET STARTED",
                    style: TextStyle(fontSize: 20.0,color: UIData.PrimaryColor),
                  ),
                )),
          ),
        ],
      ),
    );
  }
}
