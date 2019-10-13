import 'package:flutter/material.dart';
import 'package:flutter_country_picker/flutter_country_picker.dart';
import 'package:flutter_verification_code_input/flutter_verification_code_input.dart';



import '../uidata.dart';
import 'letgo.dart';

class VerifyOTPPage extends StatefulWidget {
  VerifyOTPPage({Key key}) : super(key: key);

  @override
  _PhoneInputPageState createState() {
    return _PhoneInputPageState();
  }
}

class _PhoneInputPageState extends State<VerifyOTPPage> {
  Country _selected;

  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
  }

  Widget _buildPageContent(BuildContext context) {

    return Container(
        padding: EdgeInsets.all(20.0),
        //color: Colors.grey.shade800,
        child: ListView(children: <Widget>[
          Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[

                Text(
                  "Verify phone number",
                  style: TextStyle(fontSize: 40, fontWeight: FontWeight.bold),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 26, bottom: 26),
                  child: Text(
                      "Check your SMS messages. We've sent you the PIN at +84939123456"),
                ),
                Center(
                  child: VerificationCodeInput(
                    keyboardType: TextInputType.number,
                    length: 4,
                    onCompleted: (String value) {
                      //...
                      print(value);
                    },
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(bottom: 30, top: 30),
                  child: Row(
                    children: <Widget>[
                      Text("Didn't receive SMS? ",
                          style: TextStyle(color: Colors.grey)),
                      Text(
                        "Resend Code",
                        style: TextStyle(color: UIData.PrimaryColor),
                      )
                    ],
                  ),
                ),
                SizedBox(
                    width: double.infinity,
                    height: 50,
                    child: FlatButton(
                      color: UIData.PrimaryColor,
                      textColor: Colors.white,
                      disabledColor: Colors.grey,
                      disabledTextColor: Colors.black,
                      padding: EdgeInsets.all(8.0),
                      splashColor: Colors.blueAccent,
                      onPressed: () {
                        Navigator.of(context).pushReplacement(
                            new MaterialPageRoute(builder: (context) {
                          return new LetGoPage();
                        }));
                      },
                      child: Text(
                        "VERIFY",
                        style: TextStyle(fontSize: 20.0),
                      ),
                    )),
              ])
        ]));
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return _buildPageContent(context);
  }
}
