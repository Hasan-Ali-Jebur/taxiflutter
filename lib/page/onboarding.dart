import 'package:flutter/material.dart';
import "package:flutter_swiper/flutter_swiper.dart";

import 'package:shared_preferences/shared_preferences.dart';
//import 'package:onboarding_flow/ui/widgets/custom_flat_button.dart';
import 'package:uiflutterjubertaxi/model/walkobj.dart';
import 'package:uiflutterjubertaxi/page/login.dart';
import 'package:uiflutterjubertaxi/page/loginsignup.dart';

import '../uidata.dart';

class WalkthroughScreen extends StatefulWidget {
  final SharedPreferences prefs;
  final List<Walkthrough> pages = [
    Walkthrough(
      icon: Icons.developer_mode,
      title: "Flutter Onboarding",
      description: "Build your onboarding flow in seconds.",
    ),
    Walkthrough(
      icon: Icons.layers,
      title: "Firebase Auth",
      description: "Use Firebase for user management.",
    ),
    Walkthrough(
      icon: Icons.account_circle,
      title: "Facebook Login",
      description: "Leverage Facebook to log in user easily.",
    ),
  ];

  WalkthroughScreen({this.prefs});

  @override
  _WalkthroughScreenState createState() => _WalkthroughScreenState();
}

class _WalkthroughScreenState extends State<WalkthroughScreen> {
  List<String> images = [
    'assets/images/a1.png',
    'assets/images/a2.png',
    'assets/images/a3.png',
    'assets/images/a4.png',
  ];
  int _currentIndex = 0;
  final SwiperController _swiperController = SwiperController();
  final int _pageCount = 4;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: <Widget>[
          Swiper.children(
            autoplay: false,
            index: _currentIndex,
            loop: false,
            pagination: new SwiperPagination(
              margin: new EdgeInsets.fromLTRB(0.0, 0.0, 0.0, 40.0),
              builder: new DotSwiperPaginationBuilder(
                  //color: Colors.white30,
                  activeColor: UIData.PrimaryAssentColor,
                  size: 6.5,
                  activeSize: 8.0),
            ),
            control: SwiperControl(
              iconPrevious: null,
              iconNext: null,
            ),
            controller: _swiperController,
            children: _getPages(context),
            onIndexChanged: (index) {
              setState(() {
                _currentIndex = index;
              });
              //print("index${_currentIndex}");
            },
          ),
          _buildBottom()
        ],
      ),
    );
  }

  Widget _buildBottom() {
    return Align(
      alignment: Alignment.bottomCenter,
      child: Container(
        //color: Colors.black26,
        height: 90,
        padding: EdgeInsets.all(20),
        width: MediaQuery.of(context).size.width,
        child: Container(
          //padding: EdgeInsets.only(bottom: 28),
          //color: Colors.green,
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              GestureDetector(
                  onTap: () => _skip(),
                  child: Text(
                    "Skip",
                    style: TextStyle(color: Colors.white),
                  )),
              Container(
                  color: Colors.transparent,
                  height: 40,
                  width: 90,
                  child: RaisedButton(
                    textColor: Colors.white,
                    color: Colors.orange,
                    child: _currentIndex == 3 ? Text("FINISH") : Text("NEXT"),
                    onPressed: () => _gotonexxt(),
                    shape: new RoundedRectangleBorder(
                      borderRadius: new BorderRadius.circular(30.0),
                    ),
                  ))
            ],
          ),
        ),
      ),
    );
  }

  List<Widget> _getPages(BuildContext context) {
    List<Widget> widgets = [];
    for (int i = 0; i < images.length; i++) {
      //Walkthrough page = widget.pages[i];
      widgets.add(
        new Container(
          //color: Color.fromRGBO(212, 20, 15, 1.0),
          decoration: BoxDecoration(
            //borderRadius: BorderRadius.circular(30.0),
            image: DecorationImage(
              image: AssetImage(images[i]),
              fit: BoxFit.cover,
              //colorFilter: ColorFilter.mode(Colors.black38, BlendMode.multiply)
            ),
          ),
          //child:
        ),
      );
    }

    return widgets;
  }

  _skip() {
    print("click");
    Navigator.of(context)
        .pushReplacement(new MaterialPageRoute(builder: (context) {
      return new LoginSignupPage();
    }));
  }

  _gotonexxt() {
    if (_currentIndex < _pageCount - 1)
      _swiperController.next();
    else {
      Navigator.of(context)
          .pushReplacement(new MaterialPageRoute(builder: (context) {
        return new LoginSignupPage();
      }));
    }
  }
}
