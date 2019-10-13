import 'package:flutter/material.dart';
import 'package:flutter_country_picker/flutter_country_picker.dart';

import '../uidata.dart';
import 'verifyotp.dart';

class SignupPage extends StatefulWidget {
  SignupPage({Key key}) : super(key: key);

  @override
  _SignupPageState createState() {
    return _SignupPageState();
  }
}

class _SignupPageState extends State<SignupPage> {
  final TextEditingController textEditingController =
      new TextEditingController();
  Country _selected = Country.VN;

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
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: UIData.myBackground,
      body: Container(
        padding: EdgeInsets.fromLTRB(16, 70, 16, 22),
        child: Column(
          children: <Widget>[
            //SizedBox(height: 50,),
            Stack(
              children: <Widget>[
                Image.asset(
                  'assets/images/bg1.png',
                  width: size.width,
                  height: size.height / 3,
                  fit: BoxFit.fill,
                ),
                Padding(
                  padding: const EdgeInsets.all(16),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Row(children: <Widget>[
                        Text("Signup",
                            style: TextStyle(
                                fontWeight: FontWeight.bold, fontSize: 32)),
                        Text(
                          " with email ",
                          style: TextStyle(fontSize: 30),
                        ),
                      ]),
                      Text(
                        "and phone number",
                        style: TextStyle(fontSize: 30),
                      ),
                    ],
                  ),
                )

              ],

            ),

            Container(
                color: Colors.white,
                padding: EdgeInsets.all(16),
                child: Column(
                  children: <Widget>[
                    TextField(
                      controller: textEditingController,
                      decoration: InputDecoration(
                          hintText: "Email@example.com",
                          hintStyle: TextStyle(color: Colors.black26),
                          //filled: true,
                          //fillColor: Colors.white,
                          border: OutlineInputBorder(
                            borderSide:
                                BorderSide(color: Colors.white10, width: 5.0),
                            borderRadius:
                                BorderRadius.all(Radius.circular(4.0)),
                          ),
                          contentPadding: EdgeInsets.symmetric(
                              horizontal: 20.0, vertical: 16.0)),
                    ),
                    SizedBox(
                      height: 16,
                    ),
                    Row(
                      mainAxisSize: MainAxisSize.max,
                      children: <Widget>[
                        CountryPicker(
                          showDialingCode: true,
                          showName: false,
                          onChanged: (Country country) {
                            setState(() {
                              _selected = country;
                            });
                          },
                          selectedCountry: _selected,
                        ),
                        Flexible(
                          child: TextField(
                            keyboardType: TextInputType.phone,
                            controller: textEditingController,
                            decoration: InputDecoration(
                                hintText: "Phone number",
                                hintStyle: TextStyle(color: Colors.black26),
                                //filled: true,
                                //fillColor: Colors.white,

                                border: OutlineInputBorder(
                                  borderSide: BorderSide(
                                      color: UIData.myBackground, width: 5.0),
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(4.0)),
                                ),
                                contentPadding: EdgeInsets.symmetric(
                                    horizontal: 20.0, vertical: 16.0)),
                          ),
                        ),
                      ],
                    ),
                    SizedBox(
                      height: 16,
                    ),
                    SizedBox(
                      width: double.infinity,
                      child: FlatButton(
                        shape: RoundedRectangleBorder(
                            borderRadius: new BorderRadius.circular(8.0)),
                        color: UIData.Bassic,
                        textColor: Colors.white,
                        disabledColor: Colors.grey,
                        disabledTextColor: Colors.black,
                        padding: EdgeInsets.fromLTRB(24, 8, 24, 8),
                        splashColor: UIData.Bassic,
                        onPressed: () => {
                          Navigator.of(context).push(
                              new MaterialPageRoute(builder: (context) {
                                return new VerifyOTPPage();
                              }))
                        },
                        child: Text(
                          "SIGN UP",
                          style: TextStyle(fontSize: 20.0),
                        ),
                      ),
                    ),
                  ],
                )),
          ],
        ),
      ),
    );
  }
}
