import 'package:flutter/material.dart';
import 'package:flutter_country_picker/flutter_country_picker.dart';
import 'package:uiflutterjubertaxi/page/verifyotp.dart';

import '../uidata.dart';

class PhoneInputPage extends StatefulWidget {
  PhoneInputPage({Key key}) : super(key: key);

  @override
  _PhoneInputPageState createState() {
    return _PhoneInputPageState();
  }
}

class _PhoneInputPageState extends State<PhoneInputPage> {
  Country _selected = Country.VN;

  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
  }

  Widget _buildPageContent() {
    Size size = MediaQuery.of(context).size;
    return SingleChildScrollView(
      child: Container(
          width: size.width,
          height: size.height -80,
          padding: EdgeInsets.all(20.0),
          //color: Colors.grey.shade800,
          child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Text(
                  "What is your phone number ?",
                  style: TextStyle(fontSize: 40, fontWeight: FontWeight.bold),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 26, bottom: 26),
                  child: Text(
                      "Tap \"Get Started\" to get an SMS confirmation to help you use RUBER. We would like your phon number."),
                ),
                Padding(
                  padding: const EdgeInsets.only(bottom: 8, top: 3),
                  child: Text("COUNTRY CODE",
                      style: TextStyle(color: Colors.grey)),
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
                        decoration: InputDecoration(
                            hintText: "Phone number",
                            hintStyle: TextStyle(color: Colors.black26),
                            //filled: true,
                            //fillColor: Colors.white,

                            border: OutlineInputBorder(
                              borderSide: BorderSide(
                                  color: Colors.blueGrey, width: 5.0),
                              borderRadius:
                                  BorderRadius.all(Radius.circular(4.0)),
                            ),
                            contentPadding: EdgeInsets.symmetric(
                                horizontal: 20.0, vertical: 16.0)),
                      ),
                    ),
                  ],
                ),

                Expanded(
                  child: Align(
                    alignment: FractionalOffset.bottomCenter,
                    child:   SizedBox(
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
                            Navigator.of(context)
                                .pushReplacement(new MaterialPageRoute(builder: (context) {
                              return new VerifyOTPPage();
                            }));
                          },
                          child: Text(
                            "CONTINUE",
                            style: TextStyle(fontSize: 20.0),
                          ),
                        )),
                  ),
                ),

              ])),
    );
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
        appBar: new AppBar(

          backgroundColor: Colors.white,
          elevation: 0,
          leading: new IconButton(
            icon: new Icon(
              Icons.arrow_back_ios,
              color: Colors.black,
            ),
            onPressed: () => Navigator.of(context).pop(),
          ),
        ),
        body: _buildPageContent());
  }
}
