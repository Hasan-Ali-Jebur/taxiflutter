import 'package:flutter/material.dart';
import "package:flutter_swiper/flutter_swiper.dart";

import 'package:shared_preferences/shared_preferences.dart';
//import 'package:onboarding_flow/ui/widgets/custom_flat_button.dart';
import 'package:uiflutterjubertaxi/model/walkobj.dart';
import 'package:uiflutterjubertaxi/page/login.dart';
import 'package:uiflutterjubertaxi/page/loginsignup.dart';
import 'package:uiflutterjubertaxi/widget/mybutton.dart';
import 'package:uiflutterjubertaxi/widget/swiper_pagination.dart';

import '../uidata.dart';
import 'letgo.dart';

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
  Future<int> _firstTime;
  List<String> images = [
    'assets/images/a1.png',
    'assets/images/a2.png',
    'assets/images/a3.png',
  ];
  int _currentIndex = 0;
  final SwiperController _swiperController = SwiperController();
  final int _pageCount = 3;

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
                builder: CustomPaginationBuilder(
                    activeSize: Size(10.0, 20.0),
                    size: Size(10.0, 15.0),
                    color: Colors.grey.shade600)),
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
        height: 190,
        padding: EdgeInsets.all(20),
        width: MediaQuery.of(context).size.width,
        child: Container(
          //padding: EdgeInsets.only(bottom: 28),
          //color: Colors.green,
          child: Row(
            //crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              (_currentIndex < 2)
                  ? GestureDetector(
                      onTap: () => _skip(),
                      child: Text(
                        "Skip",
                        style: TextStyle(color: Colors.grey),
                      ))
                  :
              MyButton(
                  caption: "GET STARTED",
                  onPressed: () {
                    setFirstTime(false);
                    Navigator.of(context)
                        .pushReplacement(new MaterialPageRoute(builder: (context) {
                      return new LoginSignupPage();
                    }));
                  })
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
    setFirstTime(false);
    Navigator.of(context)
        .pushReplacement(new MaterialPageRoute(builder: (context) {
      return new LoginSignupPage();
    }));
  }

  setFirstTime(key) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setBool('isFirstTime', key);
  }
}
