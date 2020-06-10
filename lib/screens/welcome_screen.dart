import 'package:flash_chat/screens/login_screen.dart';
import 'package:flash_chat/screens/registration_screen.dart';
import 'package:flutter/material.dart';
import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:flash_chat/components/rounded_button.dart';


class WelcomeScreen extends StatefulWidget {
  static const String id = 'welcome-screen';
  @override
  _WelcomeScreenState createState() => _WelcomeScreenState();
}

class _WelcomeScreenState extends State<WelcomeScreen> with SingleTickerProviderStateMixin {

  AnimationController controller;
  Animation animation1,animation2;

  @override
  void initState() {
    super.initState();

    controller = AnimationController(
      vsync: this,
      duration: Duration(seconds: 1),
    );
    animation1 = CurvedAnimation(parent: controller, curve: Curves.easeIn);
//    animation1.addStatusListener((status) {
//      if(status == AnimationStatus.completed){
//        controller.reverse(from: 1.0);
//      } else if(status == AnimationStatus.dismissed){
//        controller.forward();
//      }
//    });
    animation2 = ColorTween(begin: Colors.blueGrey, end: Colors.white).animate(controller);
    controller.forward();
    controller.addListener(() {
      setState(() {});
      //print(controller.value);
    });
  }
  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: animation2.value,
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 24.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[

            Row(
              children: <Widget>[
                Hero(
                  tag: 'logo',
                  child: Container(
                    child: Image.asset('images/logo.png'),
                    height: 90 + animation1.value * 10,
                  ),
                ),
                ColorizeAnimatedTextKit(
                    //repeatForever: true,
                  totalRepeatCount: 2,
                    pause: Duration(milliseconds: 1),
                    text: [
                      "Flash Chat"
                    ],
                    textStyle: TextStyle(
                      fontSize: 45.0,
                      fontWeight: FontWeight.w900,
                      color: Colors.amber,
                    ),
                    colors: [
                      Colors.yellow,
                      Colors.red,
                      Colors.yellow,
                    ],
                    textAlign: TextAlign.start,
                    alignment: AlignmentDirectional.topStart // or Alignment.topLeft
                ),
//                Text(
//                  'Flash Chat',
//                  style: TextStyle(
//                    fontSize: 45.0,
//                    fontWeight: FontWeight.w900,
//                  ),
//                ),
              ],
              //mainAxisAlignment: MainAxisAlignment.center,

            ),
            SizedBox(
              height: 48.0,
            ),
            RoundedButton(title: 'Log in',colour: Colors.lightBlueAccent,onPressed:() {Navigator.pushNamed(context, LoginScreen.id);},),
            RoundedButton(title: 'Register',colour: Colors.blueAccent,onPressed:() {Navigator.pushNamed(context, RegistrationScreen.id);},),
          ],
        ),
      ),
    );
  }
}

