import 'package:flutter/material.dart';
import 'package:flutter_country_picker/flutter_country_picker.dart';
import 'package:uiflutterjubertaxi/page/verifyotp.dart';
import 'package:uiflutterjubertaxi/uidata.dart';

class LoginPage extends StatefulWidget {
  LoginPage({Key key}) : super(key: key);

  @override
  _LoginPageState createState() {
    return _LoginPageState();
  }
}

class _LoginPageState extends State<LoginPage> {
  Country _selected = Country.VN;
  final TextEditingController textEditingController =
      new TextEditingController();

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
      body: Stack(
        children: <Widget>[
          Image.asset(
            'assets/images/bg1.png',
            width: size.width,
            height: size.height / 3,
            fit: BoxFit.fill,
          ),
          Container(
            height: 430,
            padding: EdgeInsets.only(
                top: 160.0, left: 10.0, right: 10.0, bottom: 10.0),
            child: Card(
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Row(children: <Widget>[
                      Text("Login",
                          style: TextStyle(
                              fontWeight: FontWeight.bold, fontSize: 32)),
                      Text(
                        " with your ",
                        style: TextStyle(fontSize: 30),
                      ),
                    ]),
                    Text(
                      "phone number",
                      style: TextStyle(fontSize: 30),
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
                                suffixIcon: GestureDetector(
                                  onTap: () {
                                    print("clear");
                                    textEditingController.clear();
                                  },
                                  child: Icon(
                                    Icons.clear,
                                    color: Colors.black26,
                                  ),
                                ),
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
                                    horizontal: 8.0, vertical: 8.0)),
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
                          "NEXT",
                          style: TextStyle(fontSize: 20.0),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}
