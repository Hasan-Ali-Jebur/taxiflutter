import 'package:flutter/material.dart';
import 'package:uiflutterjubertaxi/page/loginsignup.dart';
import 'package:uiflutterjubertaxi/uidata.dart';
import 'page/homedriver.dart';
import 'page/onboarding.dart';
import 'widget/loader2.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'page/loginPage.dart';
import 'welcomePage.dart';
import 'page/mainsignup.dart';

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
      locale: Locale("ar", "AE"),
      // OR Locale('ar', 'AE') OR Other RTL locales,
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
          //primarySwatch: PrimaryColor,
          primaryColor: UIData.PrimaryColor,
          fontFamily: 'El_Messiri'),
      initialRoute: '/',
      routes: {
        '/': (context) => LandingPage(),
        //'/': (context) => MyHomePage(),
        // '/login': (context) => LoginSignupPage(),
        '/login': (context) => RegisterPage(),
        //'/home': (context) => ProfileFillPage(),
        '/intro': (context) => WalkthroughScreen(),
        '/home': (context) => HomeDriverPage(),
        '/welcome': (context) => WelcomePage(),
        '/signup': (context) => SignUpPage(),
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
      Navigator.pushReplacementNamed(context, '/welcome');
      if (success) {
        Navigator.pushReplacementNamed(context, '/home');
      } else {
        isFirstTime().then((isFirstTime){
          if (isFirstTime) {
            Navigator.pushReplacementNamed(context, '/intro');
          } else {
            Navigator.pushReplacementNamed(context, '/welcome');
          }
        });
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
    return false;
  }



  isFirstTime() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    bool CheckValue = prefs.containsKey('isFirstTime');
    if (CheckValue) {
      bool boolValue = prefs.getBool('isFirstTime');
      return boolValue;
    }
    return false;
  }
}
