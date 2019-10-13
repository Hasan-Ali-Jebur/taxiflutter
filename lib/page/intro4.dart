/**
 * Author: Damodar Lohani
 * profile: https://github.com/lohanidamodar
 */

import 'package:flutter/material.dart';
import 'package:flutter_swiper/flutter_swiper.dart';
import 'package:uiflutterjubertaxi/widget/swiper_pagination.dart';

import '../uidata.dart';

class IntroFourPage extends StatefulWidget {
  static final String path = "lib/src/pages/onboarding/intro4.dart";
  @override
  _IntroFourPageState createState() => _IntroFourPageState();
}

class _IntroFourPageState extends State<IntroFourPage> {
  final SwiperController _swiperController = SwiperController();
  final int _pageCount = 3;
  int _currentIndex = 0;
  final List<String> titles = [
    "Lorem ipsum dolor \nsit amet, consectetur adipiscing \n elit placerat. ",
    "Aliquam eget justo \n nec arcu ultricies elementum \n id at metus. ",
    "Nulla facilisi. \nFusce non tempus risus.\n Sed ultrices scelerisque sem,"
  ];

  List<String> images = [
    'https://firebasestorage.googleapis.com/v0/b/dl-flutter-ui-challenges.appspot.com/o/img%2F1.jpg?alt=media',
    'https://firebasestorage.googleapis.com/v0/b/dl-flutter-ui-challenges.appspot.com/o/img%2F2.jpg?alt=media',
    'https://firebasestorage.googleapis.com/v0/b/dl-flutter-ui-challenges.appspot.com/o/img%2F3.jpg?alt=media',
    'https://firebasestorage.googleapis.com/v0/b/dl-flutter-ui-challenges.appspot.com/o/img%2F4.jpg?alt=media',
    'https://firebasestorage.googleapis.com/v0/b/dl-flutter-ui-challenges.appspot.com/o/img%2F5.jpg?alt=media',
    'https://firebasestorage.googleapis.com/v0/b/dl-flutter-ui-challenges.appspot.com/o/img%2F6.jpg?alt=media',
    'https://firebasestorage.googleapis.com/v0/b/dl-flutter-ui-challenges.appspot.com/o/img%2F7.jpg?alt=media',
  ];

  final String bgImage = "assets/img/photographer.jpg";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: <Widget>[
          Container(
            alignment: Alignment.center,
            child: Image.asset(
              bgImage,
              fit: BoxFit.contain,
            ),
          ),
          Column(
            children: <Widget>[
              Expanded(
                  child: Swiper(
                index: _currentIndex,
                controller: _swiperController,
                itemCount: _pageCount,
                onIndexChanged: (index) {
                  setState(() {
                    _currentIndex = index;
                  });
                },
                loop: false,
                itemBuilder: (context, index) {
                  return _buildPage(title: titles[index], icon: images[index]);
                },
                pagination: SwiperPagination(
                    builder: CustomPaginationBuilder(
                        activeSize: Size(10.0, 20.0),
                        size: Size(10.0, 15.0),
                        color: Colors.grey.shade600)),
              )),
              //SizedBox(height: 10.0),
             // _buildButtons(),
              _buildBottom(),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildBottom() {
    return Container(
      height: 80,
      padding: EdgeInsets.only(bottom: 28),
      color: UIData.Bassic,
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          Text(
            "Skip",
            style: TextStyle(color: Colors.white),
          ),
          Container(
              color: UIData.Bassic,
              height: 40,
              width: 90,
              child: RaisedButton(
                textColor: Colors.white,
                color: Colors.orange,
                child: Text("NEXT"),
                onPressed: () {},
                shape: new RoundedRectangleBorder(
                  borderRadius: new BorderRadius.circular(30.0),
                ),
              ))
        ],
      ),
    );
  }

  Widget _buildButtons() {
    return Container(
      margin: const EdgeInsets.only(right: 16.0, bottom: 10),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          FlatButton(
            textColor: Colors.grey.shade700,
            child: Text("Skip"),
            onPressed: () {
              Navigator.of(context).pushReplacementNamed('home');
            },
          ),
          IconButton(
            icon: Icon(
              _currentIndex < _pageCount - 1
                  ? Icons.access_alarm
                  : Icons.accessible_forward,
              size: 40,
            ),
            onPressed: () async {
              if (_currentIndex < _pageCount - 1)
                _swiperController.next();
              else {
                Navigator.of(context).pushReplacementNamed('home');
              }
            },
          )
        ],
      ),
    );
  }

  Widget _buildPage({String title, String icon}) {
    final TextStyle titleStyle =
        TextStyle(fontWeight: FontWeight.w500, fontSize: 20.0);
    return Container(
      width: double.infinity,
      //margin: const EdgeInsets.all(50.0),
      //padding: const EdgeInsets.all(16.0),
      decoration: BoxDecoration(
        //borderRadius: BorderRadius.circular(30.0),
        image: DecorationImage(
            image: AssetImage('assets/images/intro1.png'),
            fit: BoxFit.fill,
            colorFilter: ColorFilter.mode(Colors.black38, BlendMode.multiply)),
      ),
    );
  }
}
