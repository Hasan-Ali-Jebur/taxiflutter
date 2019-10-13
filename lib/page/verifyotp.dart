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
                "Phone Vertification",
                style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
              ),
              Padding(
                padding: const EdgeInsets.fromLTRB(0,16,0,16),
                child: Text("Enter your OTP code here"),
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
                        caption: "VERIFY NOW",
                        onPressed: () {
                          print("Tapped Me");
                        }),
                  ),
                ],
              ),
            ],
          ),
        ));
  }
}
