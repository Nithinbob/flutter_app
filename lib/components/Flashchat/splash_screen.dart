import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'welcome_screen.dart';

class SplashScreen extends StatefulWidget {
  static const String id = 'splash_Screen';
  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen>
    with SingleTickerProviderStateMixin {
  AnimationController controller;

  Animation anim;

  @override
  void initState() {
    super.initState();
    controller = AnimationController(
        vsync: this, duration: Duration(seconds: 1),);

    anim=CurvedAnimation(parent: controller,curve: Curves.easeInCubic);
    controller.forward();

    controller.addListener(() {
      setState(() {});
      print(anim.value);

       if (anim.isCompleted) Navigator.pushNamed(context, WelcomeScreen.id);

//  OR


     // anim.addStatusListener((status) {
     //
     //    if (status==AnimationStatus.completed) {
     //      Navigator.pushNamed(context, WelcomeScreen.id);
     //      status = AnimationStatus.dismissed;
     //    }
     //   else  Navigator.pushNamed(context, SplashScreen.id);
     //
     //   print(status);
     // });

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
        backgroundColor: Colors.white,
        body: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Center(
              child: GestureDetector(
                onTap: () {
                  Navigator.pushNamed(context, WelcomeScreen.id);
                },
                child: Container(
                  child: Hero(
                    tag: 'logo',
                    child: Image.asset('images/sup.jpg'),
                  ),
                  width: anim.value * 400,
                  height: anim.value * 400,
                ),
              ),
            ),
            Center(
              child: Text(
                '${(anim.value*100).toInt()} %',
                style: TextStyle(fontSize: 45,color: Colors.red),
              ),
            )
          ],
        ));
  }
}
