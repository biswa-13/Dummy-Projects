import 'package:fluter_a_to_z/auth/loginPage.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(
    LandingPage()
  );
}

class LandingPage extends StatefulWidget {
  @override
  _LandingPageState createState() => _LandingPageState();
}

class _LandingPageState extends State<LandingPage> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "login Page Demo",
      debugShowCheckedModeBanner: false,
      home: LoginPage(),
      theme: ThemeData(
        primarySwatch: Colors.orange,
      ),
    );
  }
}
// class LandingPage extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {

//   }
// }

