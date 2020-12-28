import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_verification_code_input/flutter_verification_code_input.dart';
import 'package:uiflutterjubertaxi/uidata.dart';
import 'package:uiflutterjubertaxi/widget/mybutton.dart';

class VerifyOTPPage extends StatefulWidget {
  VerifyOTPPage({Key key}) : super(key: key);

  @override
  _VerifyOTPPageState createState() {
    return _VerifyOTPPageState();
  }
}

class _VerifyOTPPageState extends State<VerifyOTPPage> {
  String _verificationCode;
  _verifyPhone() async {
    await FirebaseAuth.instance.verifyPhoneNumber(
        phoneNumber: '+9647733639950',
        verificationCompleted: (PhoneAuthCredential credential) async {
          await FirebaseAuth.instance
              .signInWithCredential(credential)
              .then((value) async {
            if (value.user != null) {
              /*Navigator.pushAndRemoveUntil(
                  context,
                  MaterialPageRoute(builder: (context) => Home()),
                      (route) => false);*/
            }
          });
        },
        verificationFailed: (FirebaseAuthException e) {
          print(e.message);
        },
        codeSent: (String verficationID, int resendToken) {
          setState(() {
            _verificationCode = verficationID;
          });
        },
        codeAutoRetrievalTimeout: (String verificationID) {
          setState(() {
            _verificationCode = verificationID;
          });
        },
        timeout: Duration(seconds: 120));
  }

  @override
  void initState() {
    super.initState();
    _verifyPhone();
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: UIData.myBackground,
        appBar: new AppBar(
          backgroundColor: UIData.myBackground,
          elevation: 0,
          leading: new IconButton(
            icon: new Icon(
              Icons.arrow_back,
              color: Colors.black,
            ),
            onPressed: () => Navigator.of(context).pop(),
          ),
        ),
        body: Container(
          padding: EdgeInsets.all(24),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Text(
                "تأكيد رقم الهاتف",
                style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
              ),
              Padding(
                padding: const EdgeInsets.fromLTRB(0,16,0,16),
                child: Text("ادخل كود SMS هنا"),
              ),
              Padding(
                padding: const EdgeInsets.fromLTRB(20, 40, 20, 50),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    VerificationCodeInput(
                      keyboardType: TextInputType.number,
                      length: 4,
                      onCompleted: (String value) {
                        //...
                        print(value);
                      },
                    ),
                  ],
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Expanded(
                    child: MyButton(
                        caption: "تأكيد الان",
                        onPressed: () {
                          Navigator.pushReplacementNamed(context, '/signup');
                        }),
                  ),
                ],
              ),
            ],
          ),
        ));
  }
}
