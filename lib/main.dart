import 'package:animated_splash_screen/animated_splash_screen.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:fotodio/Screens/ImagePickerScreen.dart';
import 'package:fotodio/Screens/onBoardScreen.dart';
import 'package:page_transition/page_transition.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(SplashScreen());
}
class SplashScreen extends StatefulWidget {
  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  Widget build(BuildContext context) {
    return  MaterialApp(
      home: AnimatedSplashScreen(
      duration: 2000,
      splash:  Container(
          height: double.infinity,
          width: double.infinity,
          decoration: BoxDecoration(
            image: DecorationImage(
              image: AssetImage('images/logo.jpg'),
              fit: BoxFit.fitHeight
            )
          ),
        ),
      splashIconSize: 200,
      nextScreen: ImagePickerScreen(),
      splashTransition: SplashTransition.slideTransition,
      pageTransitionType: PageTransitionType.leftToRight,
      //backgroundColor: Color(0xffFFFFFF),
      ),
    );
  }
}
