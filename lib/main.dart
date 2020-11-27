import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:uiflutterjubertaxi/page/loginsignup.dart';
import 'package:uiflutterjubertaxi/uidata.dart';

import 'model/counter.dart';
import 'page/bookpage.dart';
import 'page/home.dart';
import 'page/homedriver.dart';
import 'page/letgo.dart';
import 'page/login.dart';
import 'page/onboarding.dart';
import 'page/phoneinput.dart';
import 'page/promo.dart';
import 'page/selectdestination.dart';
import 'page/signup.dart';
import 'page/testmap.dart';
import 'page/testprovider.dart';
import 'page/verifyotp.dart';
import 'widget/loader2.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_localizations/flutter_localizations.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      localizationsDelegates: [
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
        DefaultCupertinoLocalizations.delegate
      ],
      supportedLocales: [
        Locale("ar", "AE"), // OR Locale('ar', 'AE') OR Other RTL locales
      ],
      locale: Locale("ar", "AE"), // OR Locale('ar', 'AE') OR Other RTL locales,
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        //primarySwatch: PrimaryColor,
          primaryColor: UIData.PrimaryColor,
          fontFamily: 'El_Messiri'
      ),
      initialRoute: '/',
      routes: {
        '/': (context) => LandingPage(),
        //'/': (context) => MyHomePage(),
        '/login': (context) => LoginSignupPage(),
        //'/home': (context) => ProfileFillPage(),
        '/intro': (context) => WalkthroughScreen(),
        '/home': (context) => HomeDriverPage(),
      },
    );
  }
}

class LandingPage extends StatefulWidget {
  @override
  _LandingPageState createState() => _LandingPageState();
}

class _LandingPageState extends State<LandingPage> {
  @override
  void initState() {
    super.initState();

    checkIfAuthenticated();
  }

  @override
  Widget build(BuildContext context) {
  checkIfAuthenticated().then((success) {
     if (success) {
       Navigator.pushReplacementNamed(context, '/home');
     } else {
       Navigator.pushReplacementNamed(context, '/login');
     }
   });
    Size size = MediaQuery.of(context).size;
    return Stack(
      children: <Widget>[
        Image.asset(
          'assets/images/splash1.png',
          width: size.width,
          height: size.height,
          fit: BoxFit.fill,
        ),
        Center(
          child: LoaderTwo(),
        ),
      ],
    );
  }

  checkIfAuthenticated() async {
    await Future.delayed(Duration(
        seconds:
            6)); // could be a long running task, like a fetch from keychain
    Navigator.pushReplacementNamed(context, '/intro');

    return true;
  }
}

class MyApp2 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: ChangeNotifierProvider<Counter>(
        create: (_) => Counter(0),
        child: HomePageTest(),
      ),
      //initialRoute: '/',

    );
  }
}
