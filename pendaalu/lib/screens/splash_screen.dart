import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:pendaalu/screens/login_screen.dart';
import 'package:pendaalu/screens/register_screen.dart';
import 'package:pendaalu/constant.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  int? groupValue = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: double.infinity,
        height: double.infinity,
        decoration: BoxDecoration(
          gradient: LinearGradient(colors: <Color>[
            Color(0xFF46C1BE), 
            Color(0xFF45CAF5),
          ], begin: Alignment.bottomLeft, end: Alignment.bottomRight),
        ),
        child: TweenAnimationBuilder(
          child: Column(
            children: [
              buildImage(),
              SizedBox(
                height : 20,
              ),
              buildTopText(),
              SizedBox(
                height: 2,
              ),
              buildCupertinoSlidingSegmentedControl(),
            ],
          ),
          tween: Tween<double>(begin: 0, end: 1),
          duration: Duration(milliseconds: 1200),
          builder: (BuildContext context, double _value, child) {
            return Opacity(
              opacity: _value,
              child: Padding(
                padding: EdgeInsets.only(top: _value * 35),
                child: child,
              ), 
            );
          }
        ),
      ),
    );
  }

  // Image Component
  buildImage() {
    return Container(
      child: Image(
        image: AssetImage("assets/images/alumni.png")
      ),
   );
  }

  // Top Text Component
  buildTopText() {
    return Container(
      width: 300,
      height: 80,
      child: Text(
        "Pendaalu",
        textAlign: TextAlign.center,
        style: TextStyle(
          letterSpacing: 2.0,
          fontSize: 30,
          color: Colors.black,
          fontWeight: FontWeight.bold,
        ),
      ),
    );
  }

  // CupertinoSliding Component
  buildCupertinoSlidingSegmentedControl() {
    return CupertinoSlidingSegmentedControl<int>(
      thumbColor: mainColor,
      groupValue: groupValue,
      children: {
        0: registerCur(context),
        1: loginCur(context),
      },
      onValueChanged: (groupValue) => setState(
        () {
          this.groupValue = groupValue;
          isSelected(context);
        },
      ),
    );
  }

  // Register Botton Component
  registerCur(BuildContext context) {
    return Container(
      width: 120,
      height: 48,
      child: Center(
        child: Text(
          "Register",
          style: TextStyle(
            fontSize: 15,
            fontWeight: FontWeight.bold,
            color: groupValue == 0 ? Color(0xff25242D) : mainColor),
        ),
      ),
    );
  }

  // Login Botton Component
  loginCur(BuildContext context) {
    return Container(
      width: 120,
      height: 48,
      child: Center(
        child: Text(
          "Login",
          style: TextStyle(
            fontSize: 15,
            fontWeight: FontWeight.bold,
            color: groupValue == 1 ? Color(0xff25242D) : mainColor),
        ),
      ),
    );
  }

  // Change Screen Methode
  isSelected(BuildContext context) {
    switch (groupValue) {
      case 0:
        return Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => RegisterScreen()),
        );
      case 1:
        return Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => LoginScreen()),
        );
    }
  }
}