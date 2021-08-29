import 'package:date_field/date_field.dart';
import 'package:fluter_a_to_z/blog/blogLandingPage.dart';
import 'package:flutter/material.dart';

class SignUpPage extends StatefulWidget {
  @override
  _SignUpPageState createState() => _SignUpPageState();
}

class _SignUpPageState extends State<SignUpPage> {
  TextEditingController _name = new TextEditingController();
  TextEditingController _pwdController = new TextEditingController();
  TextEditingController _email = new TextEditingController();
  TextEditingController _mobile = new TextEditingController();
  GlobalKey _scaffoldKey = new GlobalKey();
  bool isAgree = true;
  bool isObscured = true;
  var _pwdStrength = 0.0;
  Color _progrsColor = Colors.transparent;
  String _gender = "Male";
  bool isTermVisible = false;
  DateTime dob;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // appBar: AppBar(
      //    // title: Center(child: Text("Sign Up Page")),
      //     // leading: IconButton(
      //     //     icon: Icon(Icons.arrow_back),
      //     //     onPressed: () {
      //     //       Navigator.pop(context);
      //     //     }),
      //         backgroundColor:Colors.transparent
      //   ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: signUpContents(),
      ),
      backgroundColor: Color.fromRGBO(40, 46, 69, 1.0),
      key: _scaffoldKey,
    );
  }

  Widget signUpContents() {
    return SingleChildScrollView(
        child: Column(
      children: <Widget>[
        pageTitle_0(),
        nameField_1(),
        genderRadio_2(),
        dob_dateField_2_1(),
        signUpEmail_field_3(),
        signUpmobile_field_4(),
        signUp_pwdField_5(),
        SizedBox(
          height: 5.0,
        ),
        showPasswordStrength(),
        undrtkng_checkbox_7_1(),
        termInfo_7_1(),
        signUpBtn_7(),
        SizedBox(
          height: 20.0,
        ),
        loginTextInfo_8()
      ],
    ));
  } // signUpContents()

  Widget pageTitle_0() {
    //return Center(child: Text("Sign Up Page"));
    return Padding(
      padding: EdgeInsets.only(top: 20.0, bottom: 15.0),
      child: Text(
        "Sign Up Page",
        style: TextStyle(
            //color: Color.fromRGBO(133, 138, 156, 1.0),
            color: Color.fromRGBO(255, 182, 85, 1.0),
            fontSize: 30.0,
            //fontStyle: FontStyle.italic,
            fontWeight: FontWeight.w400),
      ),
    );
  }

  Widget nameField_1() {
    // return Card(
    //   shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20.0)),
    //   child: TextFormField(
    //     keyboardType: TextInputType.text,
    //     decoration: InputDecoration(
    //         suffix: Icon(Icons.face),
    //         labelText: "Enter Your Name",
    //         border: InputBorder.none
    //         ),
    //   ),
    // );
    return Card(
      //color: Colors.transparent,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
      child: TextFormField(
        controller: this._name,
        keyboardType: TextInputType.emailAddress,
        decoration: InputDecoration(
            prefixIcon: Icon(Icons.face),
            hintText: "Enter Your Name",
            border: InputBorder.none),
      ),
    );
  }

  Widget genderRadio_2() {
    return Card(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20.0)),
      child: Row(
        children: <Widget>[
          Padding(
            padding: const EdgeInsets.only(left: 8.0),
            child: Text("Gender: "),
          ),
          Radio(
              value: "Male",
              groupValue: _gender,
              onChanged: (val) {
                setState(() {
                  _gender = val;
                });
              }),
          Text("Male"),
          Radio(
              value: "Female",
              groupValue: _gender,
              onChanged: (val) {
                setState(() {
                  _gender = val;
                });
              }),
          Text("Female"),
        ],
      ),
    );
  } // genderRadio_2()

  Widget dob_dateField_2_1() {
    return Card(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20.0)),
      child: Padding(
        padding: const EdgeInsets.only(left:8.0),
        child: DateField(
            onDateSelected: (dobDt) {
              print("Selected DOB -->" + dobDt.toString());
              setState(() {
                dob = dobDt;
              });
            },
            selectedDate: dob),
      ),
    );
  } // dob_dateField_2_1()

  Widget signUpEmail_field_3() {
    return Card(
      //color: Colors.transparent,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
      child: TextFormField(
        controller: this._email,
        keyboardType: TextInputType.emailAddress,
        decoration: InputDecoration(
            prefixIcon: Icon(Icons.mail),
            hintText: "Enter Your Email",
            suffixIcon: Icon(
              Icons.mobile_screen_share,
            ),
            border: InputBorder.none),
      ),
    );
  } // signUpEmail_field_3()

  Widget signUpmobile_field_4() {
    return Card(
      //color: Colors.transparent,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
      child: TextFormField(
        controller: this._mobile,
        keyboardType: TextInputType.phone,
        decoration: InputDecoration(
            prefixIcon: Icon(Icons.mobile_screen_share),
            hintText: "Enter Your Mobile No",
            border: InputBorder.none),
      ),
    );
  } // signUpEmail_field_3()

  Widget signUp_pwdField_5() {
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
  } // signUp_pwdField_5()

  Widget showPasswordStrength() {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: LinearProgressIndicator(
          value: this._pwdStrength, backgroundColor: this._progrsColor),
    );
  } // showPasswordStrength()

  signUpBtn_7() {
    return Container(
        child: RaisedButton(
      onPressed: () {
        var valid = false;
        var msg = "";
        setState(() {
          if (_name.text.length == 0 ||
              _email.text.length == 0 ||
              _mobile.text.length == 0 ||
              _pwdController.text.length == 0) {
            msg = "Fields Can Not Left Blank.";
          } else if (_pwdController.text.length < 8) {
            valid = false;
            msg = "Minimum Password Length Should Be 8.";
          } else if (_mobile.text.length < 10) {
            valid = false;
            msg = "Mobile Number Should Be 0f 10 Digit.";
          } else if (isAgree == false) {
            valid = false;
            msg = "Select, I Agree With Terms & Conditions.";
          } else {
            valid = true;
          }
        });

        // if (valid) {
        //   String uid = _uidController.text;
        //   String pwd = _pwdController.text;
        //   var url =
        //       "https://flutter.smarttersstudio.com/test/login.php?user=$uid&pass=$pwd";
        //   print("url -->" + url);
        //   http.get(url).then((response) {
        //     print("Fuckkkkkkkkkkkkkkkkkkkkkk uuuuuuuuuuuuuuuu");
        //     print("result -->" + response.body.toString());
        //   });
        // } else {
        //   final snackBar = SnackBar(
        //     content: Text(
        //       msg,
        //       textAlign: TextAlign.center,
        //     ),
        //     backgroundColor: Colors.redAccent,
        //   );
        //   _scaffoldKey.currentState.showSnackBar(snackBar);
        // }
      },
      color: Colors.transparent,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(40)),
      child: Icon(
        Icons.check,
        size: 40.0,
        color: Colors.orangeAccent[200],
      ),
    ));
  }

  Widget undrtkng_checkbox_7_1() {
    return Row(
      children: <Widget>[
        Checkbox(
          value: isAgree,
          onChanged: (val) {
            print("Check Box Val -->" + val.toString());
            setState(() {
              isAgree = val;
            });
          },
        ),
        Text("I Agree With Terms & Conditions."),
        IconButton(
          onPressed: (){setState(() {
            isTermVisible = !isTermVisible;
          });},
          icon: Icon(Icons.error), autofocus: true,color: Colors.orangeAccent[100],
          )
      ],
    );
  }
  Widget termInfo_7_1(){
    return AnimatedOpacity(
      opacity: isTermVisible ? 1.0 : 0.0, 
      duration: Duration(milliseconds: 500),
      child: Card(
        child: Text("Currently there is no Term & Conditions available. "),
      ),
      );
  }

  Widget loginTextInfo_8() {
    return Row(
      children: <Widget>[
        Icon(Icons.arrow_back, color: Colors.orangeAccent[200]),
        FlatButton(
            onPressed: () {
              print("FlatButton");
              // Navigator.push(context, MaterialPageRoute(builder: (BuildContext context) => SignUpPage()));
              //Navigator.pop(context);
              Navigator.push(context, MaterialPageRoute(builder: (BuildContext context) => BlogLandingPage()));
            },
            child: Text(
              " Already Have an Account.",
              style: TextStyle(color: Colors.orangeAccent[200]),
            )),
      ],
    );
  } // loginTextInfo_8()

}
