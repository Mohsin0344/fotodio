import 'package:flutter/material.dart';
import 'package:flutter_onboard/flutter_onboard.dart';
import 'package:fotodio/Screens/ImagePickerScreen.dart';
import 'package:provider/provider.dart';
import 'package:page_transition/page_transition.dart';

import 'login.dart';


class OnBoardScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: HomeScreen(),
    );
  }
}

class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return CustomUI();
  }
}

class BasicUI extends StatelessWidget {
  final PageController _pageController = PageController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: OnBoard(
        onBoardData: onBoardData,
        pageController: _pageController,
        onSkip: () {
          print('skipped');
        },
        onDone: () {
          print('done tapped');
          Navigator.push(context,
            PageTransition(
                type: PageTransitionType.leftToRight,
                child: LoginScreen()
            ),
          );
        },
      ),
    );
  }
}

class CustomUI extends StatelessWidget {
  final PageController _pageController = PageController();
  @override
  Widget build(BuildContext context) {
    return Provider<OnBoardState>(
      create: (_) => OnBoardState(),
      child: Scaffold(
        body: OnBoard(
          pageController: _pageController,
          onSkip: () {
            print('skipped');
          },
          onDone: () {
            print('done tapped');
          },
          onBoardData: onBoardData,
          titleStyles: TextStyle(
            color: Color(0xffFF245E),
            fontSize: 18,
            fontWeight: FontWeight.w900,
            letterSpacing: 0.15,
          ),
          descriptionStyles: TextStyle(
            fontSize: 16,
            color: Colors.brown.shade300,
          ),
          pageIndicatorStyle: PageIndicatorStyle(
            width: 100,
            inactiveColor: Color(0xffFF245E),
            activeColor: Color(0xffFF245E),
            inactiveSize: Size(8, 8),
            activeSize: Size(12, 12),
          ),
          skipButton: FlatButton(
            onPressed: () {
              print('skipped');
              Navigator.push(context,
                PageTransition(
                    type: PageTransitionType.leftToRight,
                    child: LoginScreen()
                ),
              );
            },
            child: Text(
              "Skip",
              style: TextStyle(color: Color(0xffFF245E)),
            ),
          ),
          nextButton: Consumer<OnBoardState>(
            builder: (BuildContext context, OnBoardState state, Widget child) {
              return InkWell(
                onTap: () => _onNextTap(state,context),
                child: Container(
                  width: 230,
                  height: 50,
                  alignment: Alignment.center,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(30),
                    gradient: LinearGradient(
                      colors: [Colors.redAccent, Color(0xffFF245E)],
                    ),
                  ),
                  child: Text(
                    state.isLastPage ? "Done" : "Next",
                    style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              );
            },
          ),
        ),
      ),
    );
  }

  void _onNextTap(OnBoardState onBoardState, context) {
    if (!onBoardState.isLastPage) {
      _pageController.animateToPage(
        onBoardState.page + 1,
        duration: Duration(milliseconds: 250),
        curve: Curves.easeInOutSine,
      );
    } else {
      print("done");
      Navigator.push(context,
        PageTransition(
            type: PageTransitionType.leftToRight,
            child: LoginScreen()
        ),
      );
    }
  }
}

final List<OnBoardModel> onBoardData = [
  OnBoardModel(
    title: "Set your own goals and get better",
    description: "Goal support your motivation and inspire you to work harder",
    imgUrl: "images/image.png",
  ),
  OnBoardModel(
    title: "Track your progress with statistics",
    description:
    "Analyse personal result with detailed chart and numerical values",
    imgUrl: 'images/image2.png',
  ),
  OnBoardModel(
    title: "Create photo comparisons and share your results",
    description:
    "Take before and after photos to visualize progress and get the shape that you dream about",
    imgUrl: 'images/image3.png',
  ),
];