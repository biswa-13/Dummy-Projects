//import 'dart:html';
//import 'dart:ui';

import 'package:fluter_a_to_z/auth/signUpPage.dart';
import 'package:flutter/material.dart';
import 'package:async/async.dart';
import 'package:http/http.dart' as http;

class LoginPage extends StatefulWidget {
  @override
  _LoginPageState createState() => _LoginPageState();
}
// SignUp: https://flutter.smarttersstudio.com/test/signup.php?email=bichhubiswa@gmail.com&password=7205284238&gender=1&name=Biswa&phone=7205284238
// result: {"result":true}
// login: https://flutter.smarttersstudio.com/test/login.php?user=bichhubiswa@gmail.com&pass=7205284238
// result: {"result":true,"id":"139"}

class _LoginPageState extends State<LoginPage> {
  double _padding = 20.0;
  GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey();
  TextEditingController _uidController = new TextEditingController();
  TextEditingController _pwdController = new TextEditingController();
  bool isObscured = true;
  var _pwdStrength = 0.0;
  Color _progrsColor = Colors.transparent;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffoldKey,
      body: SingleChildScrollView(
        //child: Center(
        child: Padding(
          padding: EdgeInsets.all(_padding),
          child: Column(
            children: <Widget>[
              loginUsingText_1(),
              putSizedBox(0.0, 15.0),
              loginOptions_2(),
              alterNetText_3(),
              putSizedBox(0.0, 15.0),
              loginUsingUnamePwd_4(),
              putSizedBox(0.0, 120.0),
              signUpTextInfo_5()
            ],
          ),
        ),
        // ),
      ),
      drawer: signUpDrawerScreen_i(),
      // floatingActionButton: signUpBtn_a(),
      backgroundColor: Color.fromRGBO(40, 46, 69, 1.0),
    );
  }

  loginMethod(loginType) {
    print("loginMethod() is called...");
    print("Login Using -->" + loginType);
    //this.comingSoonMsg();
  }

  Widget loginUsingText_1() {
    return Padding(
      padding: EdgeInsets.only(top: 20.0, bottom: 15.0),
      child: Text(
        "Login Using",
        style: TextStyle(
            //color: Color.fromRGBO(133, 138, 156, 1.0),
            color: Color.fromRGBO(255, 182, 85, 1.0),
            fontSize: 30.0,
            //fontStyle: FontStyle.italic,
            fontWeight: FontWeight.w400),
      ),
    );
  }

  Widget loginOptions_2() {
    return Center(
        child: Row(
      children: <Widget>[
        Padding(
          padding: EdgeInsets.only(left: 20.0),
          child: loginUsingGmail_2_1(),
        ),
        Padding(
          padding: EdgeInsets.only(left: 20.0, right: 20.0),
          child: loginUsingGmail_2_2(),
        ),
        loginUsingGmail_2_3()
      ],
    ));
  }

  Widget loginUsingGmail_2_1() {
    return Column(
      children: <Widget>[
        GestureDetector(
          onTap: () {
            final snackBar = SnackBar(
                content: Text(
                  "Feature Coming Soon...",
                  textAlign: TextAlign.center,
                ),
                backgroundColor: Colors.orangeAccent);
            _scaffoldKey.currentState.showSnackBar(snackBar);
          },
          child: Container(
            decoration:
                BoxDecoration(color: Colors.white, shape: BoxShape.circle),
            padding: EdgeInsets.all(16),
            width: 70,
            height: 70,
            child: Image.asset("assets/images/gmail1.png"),
          ),
        ),
        Padding(
          padding: EdgeInsets.only(top: 5.0),
          //child: Text("Gmail", style: TextStyle(color: Color.fromRGBO(221, 75, 64, 1.0)),)  ,
          child: Text(
            "Gmail",
            style: TextStyle(
                color: Colors.blueAccent, fontWeight: FontWeight.bold),
          ),
        )
      ],
    );
  } // loginUsingGmail_2_1

  Widget loginUsingGmail_2_2() {
    return Column(
      children: <Widget>[
        GestureDetector(
          onTap: () {
            final snackBar = SnackBar(
                content: Text(
                  "Feature Coming Soon...",
                  textAlign: TextAlign.center,
                ),
                backgroundColor: Colors.orangeAccent);
            _scaffoldKey.currentState.showSnackBar(snackBar);
          },
          child: Container(
            decoration:
                BoxDecoration(color: Colors.white, shape: BoxShape.circle),
            padding: EdgeInsets.all(16),
            width: 70,
            height: 70,
            child: Image.asset("assets/images/facebook1.png"),
          ),
        ),
        Padding(
          padding: EdgeInsets.only(top: 5.0),
          //child: Text("Facebook", style: TextStyle(color: Color.fromRGBO(255, 255, 255, 1.0), fontWeight: FontWeight.bold),)  ,
          child: Text(
            "Facebook",
            style: TextStyle(
                color: Colors.blueAccent, fontWeight: FontWeight.bold),
          ),
        )
      ],
    );
  } // loginUsingGmail_2_2

  Widget loginUsingGmail_2_3() {
    return Column(
      children: <Widget>[
        GestureDetector(
          onTap: () {
            final snackBar = SnackBar(
                content: Text(
                  "Feature Coming Soon...",
                  textAlign: TextAlign.center,
                ),
                backgroundColor: Colors.orangeAccent);
            _scaffoldKey.currentState.showSnackBar(snackBar);
          }, //loginMethod("otp"),
          child: Container(
            decoration:
                BoxDecoration(color: Colors.white, shape: BoxShape.circle),
            padding: EdgeInsets.all(16),
            width: 70,
            height: 70,
            child: Image.asset("assets/images/otp.png"),
          ),
        ),
        Padding(
          padding: EdgeInsets.only(top: 5.0),
          //child: Text("OTP", style: TextStyle(color: Color.fromRGBO(39, 156, 215, 1.0), fontWeight: FontWeight.bold), )  ,
          child: Text(
            "OTP",
            style: TextStyle(
                color: Colors.blueAccent, fontWeight: FontWeight.bold),
          ),
        )
      ],
    );
  } // loginUsingGmail_2_3

  Widget alterNetText_3() {
    // return Row(
    //   children: <Widget>[
    //  return  Expanded(
    //     child:
    return Padding(
      padding: EdgeInsets.only(left: 10.0, right: 10.0, top: 30.0),
      child: Text(
        "- OR -",
        style: TextStyle(
            color: Color.fromRGBO(255, 182, 85, 1.0),
            fontStyle: FontStyle.italic,
            fontWeight: FontWeight.bold,
            fontSize: 15.0),
      ),
    );
    //);
    //   ],
    // );
  } // alterNetText_3()

  Widget loginUsingUnamePwd_4() {
    return Column(
      children: <Widget>[
        loginUidPwd_textField_4_1(),
        putSizedBox(0.0, 10.0),
        loginUidPwd_pwdField_4_2(),
        putSizedBox(0.0, 5.0),
        showPasswordStrength(),
        putSizedBox(0.0, 15.0),
        loginUidPwd_actnBtns_4_3()
      ],
    );
  } //loginUsingUnamePwd_4()

  Widget loginUidPwd_textField_4_1() {
    return Card(
      //color: Colors.transparent,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
      child: TextFormField(
        controller: this._uidController,
        keyboardType: TextInputType.emailAddress,
        decoration: InputDecoration(
            prefixIcon: Icon(Icons.mail),
            hintText: "Email or Mobile No.",
            suffixIcon: Icon(
              Icons.mobile_screen_share,
            ),
            border: InputBorder.none),
      ),
    );
  } // loginUidPwd_textField_4_1()

  Widget loginUidPwd_pwdField_4_2() {
    return Card(
        //color: Colors.transparent,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
        child: Column(
          children: <Widget>[
            TextFormField(
              controller: this._pwdController,
              keyboardType: TextInputType.emailAddress,
              obscureText: this.isObscured,
              onChanged: (value) {
                print("value.lengt -->" + value.length.toString());
                setState(() {
                  if (value.length > 0 && value.length <= 8) {
                    this._pwdStrength = ((value.length * 12.5) / 100);
                    this._progrsColor = Colors.greenAccent;
                  } else if (value.length == 0) {
                    this._pwdStrength = 0.0;
                    this._progrsColor = Colors.transparent;
                  } else {
                    this._progrsColor = Colors.limeAccent;
                    this._pwdStrength = 1.0;
                  }
                  print("this._pwdStrength -->" + this._pwdStrength.toString());
                  print("this._progrsColor -->" + this._progrsColor.toString());
                });
              },
              decoration: InputDecoration(
                  prefixIcon: Icon(Icons.vpn_key),
                  hintText: "Password.",
                  suffixIcon: GestureDetector(
                      onTap: () {
                        print("icon clicked...");
                        setState(() {
                          this.isObscured = !this.isObscured;
                        });
                      },
                      child: this.isObscured
                          ? Icon(Icons.visibility)
                          : Icon(Icons.visibility_off)),
                  // IconButton(icon: Icon(Icons.visibility), onPressed: (){print("icon clicked...");}),
                  border: InputBorder.none),
            ),
          ],
        ));
  } // loginUidPwd_textField_4_1()

  Widget showPasswordStrength() {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: LinearProgressIndicator(
          value: this._pwdStrength, backgroundColor: this._progrsColor),
    );
  }

  loginUidPwd_actnBtns_4_3() {
    return Container(
        child: InkWell(
                  child: RaisedButton(
      onPressed: () {
          print("_uidController.value.toString() -->" +
              _uidController.text.toString());
          print("_pwdController.value.toString() -->" +
              _pwdController.text.toString().length.toString());
          var valid = false;
          var msg = "";
          setState(() {
            if (_uidController.text.length == 0 ||
                _pwdController.text.length == 0) {
              msg = "Fields Can Not Left Blank.";
            } else if (_pwdController.text.length < 8) {
              valid = false;
              msg = "Minimum Password Length Should Be 8.";
            } else {
              valid = true;
            }
          });

          if (valid) {
            //this.validateLogin();
            String uid = _uidController.text;
            String pwd = _pwdController.text;
            var url =
                "https://flutter.smarttersstudio.com/test/login.php?user=$uid&pass=$pwd";
            print("url -->" + url);
            http.get(url).then((response) {
              print("result -->" + response.body.toString());
            });
          } else {
            final snackBar = SnackBar(
              content: Text(
                msg,
                textAlign: TextAlign.center,
              ),
              backgroundColor: Colors.redAccent,
            );
            _scaffoldKey.currentState.showSnackBar(snackBar);
          }
      },
      color: Colors.transparent, //Color.fromRGBO(39, 156, 215, 1.0),
      //elevation: 30.0,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(40)),
      child: Icon(
          Icons.check,
          size: 40.0,
          color: Colors.orangeAccent[200],
      ),
    ),
        ));
  }

  validateLogin() {
    print("validateLogin() called...");
    String uid = _uidController.text;
    String pwd = _pwdController.text;
    var url =
        "https://flutter.smarttersstudio.com/test/login.php?user=$uid&pass=$pwd";
    print("url -->" + url);
    http.get(url).then((response) {
      print("result -->" + response.body.toString());
    });
  }

  Widget putSizedBox(width, height) {
    return SizedBox(
      width: width,
      height: height,
    );
  } //  putSizedBox()

  Widget signUpDrawerScreen_i() {
    return Drawer();
  } //signUpDrawerScreen_i()

  Widget signUpTextInfo_5() {
    return Row(
      children: <Widget>[
        FlatButton(
            onPressed: () {
              print("FlatButton");              
              Navigator.push(context, MaterialPageRoute(builder: (BuildContext context) => SignUpPage()));
            },
            child: Text(
              "Don't Have an Account ",
              style: TextStyle(color: Colors.orangeAccent[200]),
            )),
        Icon(Icons.arrow_forward, color: Colors.orangeAccent[200])
      ],
    );
  } // signUpTextInfo_5()

  Widget signUpBtn_a() {
    return FloatingActionButton(
        backgroundColor: Colors.transparent,
        onPressed: () {}, //openSignUpDrawer(),
        child: Center(
            child: Icon(
          Icons.pan_tool,
          color: Colors.blueAccent,
        )));
  } // signUpBtn_a()
}
