import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:pendaalu/screens/dashboard_screen.dart';
import 'package:pendaalu/screens/register_screen.dart';
import 'package:pendaalu/constant.dart';
import 'package:pendaalu/screens/splash_screen.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  int? groupValue = 1;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: GestureDetector(
        onTap: () => FocusManager.instance.primaryFocus?.unfocus(),
        child: Container(
          width: double.infinity,
          height: double.infinity,
          decoration: BoxDecoration(
            gradient: LinearGradient(colors: <Color> [
              Color(0xFF46C1BE),
              Color(0xFF45CAF5),
            ], begin: Alignment.bottomLeft, end: Alignment.topRight),
          ),
          child: TweenAnimationBuilder(
            child: Column(
              children: [
                buildBackIcon(),
                buildTopText(),
                SizedBox(
                  height: 2,
                ),
                buildUserTextField(),
                SizedBox(
                  height: 20,
                ),
                buildPasswordTextField(),
                SizedBox(
                  height: 20,
                ),
                buildForgotPasswordText(),
                SizedBox(height: 15),
                buildLoginBotton(),
                SizedBox(height: 20),
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
            },
          ),
        ),
      ),
    );
  }

  // Back Icon Component
  buildBackIcon() {
    return Row(
      children: [
        Padding(
          padding: const EdgeInsets.only(left: 5),
          child: IconButton(
            hoverColor: Colors.white,
            onPressed: () => Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => SplashScreen(),
              ),
            ),
            icon: Icon(
              Icons.arrow_back_ios,
              color: Colors.white,
            ),
          ),
        ),
      ],
    );
  }

  // Top Text Component
  buildTopText() {
    return Container(
      width: 300,
      height: 60,
      child: Center(
        child: Text(
          "Welcome",
          style: TextStyle(
              fontWeight: FontWeight.bold, color: mainColor, fontSize: 35),
        ),
      ),
    );
  }

  // User TextField Component
  buildUserTextField() {
    return Container(
      width: 300,
      height: 55,
      child: TextField(
        style: TextStyle(color: Colors.white),
        showCursor: true,
        cursorColor: mainColor,
        decoration: InputDecoration(
          prefixIcon: Icon(Icons.person, size: 20,),
          labelText: "Email",
          hintText: "user@gmail.com ",
          hintStyle: TextStyle(color: Colors.grey, fontSize: 14),
          labelStyle: TextStyle(
              color: Colors.white70, fontSize: 13, fontWeight: FontWeight.w400),
          enabledBorder: OutlineInputBorder(
              borderSide: BorderSide(color: Colors.grey, width: 1.3),
              borderRadius: BorderRadius.circular(15)),
          floatingLabelStyle: TextStyle(
            color: mainColor,
            fontSize: 16,
          ),
          focusedBorder: OutlineInputBorder(
            borderSide: BorderSide(color: Colors.grey, width: 1.3),
            borderRadius: BorderRadius.circular(15),
          ),
        ),
      ),
    );
  }

  // Password TextField Component
  buildPasswordTextField() {
    return Container(
      width: 300,
      height: 55,
      child: TextField(
        obscureText: true,
        style: TextStyle(color: Colors.white),
        showCursor: true,
        cursorColor: mainColor,
        decoration: InputDecoration(
          prefixIcon: Icon(Icons.lock, size: 20,),
          labelText: "Password",
          labelStyle: TextStyle(
              color: Colors.white70, fontSize: 13, fontWeight: FontWeight.w400),
          enabledBorder: OutlineInputBorder(
              borderSide: BorderSide(color: Colors.grey, width: 1.3),
              borderRadius: BorderRadius.circular(15)),
          floatingLabelStyle: TextStyle(
            color: mainColor,
            fontSize: 16,
          ),
          focusedBorder: OutlineInputBorder(
            borderSide: BorderSide(color: Colors.grey, width: 1.3),
            borderRadius: BorderRadius.circular(15),
          ),
        ),
      ),
    );
  }

  // Forgot Password Component
  buildForgotPasswordText() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Container(
          width: 200,
          height: 30,
          child: Center(
            child: Text(
              "Don\'t have an account?",
              style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.w400,
                color: Colors.white70,
              ),
            ),
          ),
        ),
        Container(
          width: 60,
          height: 30,
          child: Center(
            child: InkWell(
              onTap: () => Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => RegisterScreen(),
                  )),
              child: Text(
                "Register",
                style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.w400,
                    color: mainColor),
              ),
            ),
          ),
        )
      ],
    );
  }

  // Login Botton Component
  buildLoginBotton() {
    return Container(
      width: 280,
      height: 50,
      child: MaterialButton(
        shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.all(Radius.circular(10))),
        color: mainColor,
        child: Text(
          "Login",
          style: TextStyle(
              fontSize: 15,
              fontWeight: FontWeight.bold,
              color: Color(0xff25242D)),
        ),
        onPressed: () => Navigator.pushReplacement(
          context,
          MaterialPageRoute(builder: (context) => DashboardScreen()),
        ),
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
}