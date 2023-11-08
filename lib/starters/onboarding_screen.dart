import 'package:flutter/material.dart';
import 'package:shop/user/signup.dart';

class OnboardingScreen extends StatefulWidget {
  @override
  _OnboardingScreenState createState() => _OnboardingScreenState();
}

class _OnboardingScreenState extends State<OnboardingScreen> {
  PageController _pageController = PageController();
  int _currentPage = 0;

  final List<String> onboardingImagePaths = [
    'images/o1.jpg',
    'images/o2.jpg',
    'images/o3.jpg',
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: PageView.builder(
        controller: _pageController,
        itemCount: onboardingImagePaths.length,
        onPageChanged: (int page) {
          setState(() {
            _currentPage = page;
          });
        },
        itemBuilder: (context, index) {
          return Stack(
            fit: StackFit.expand,
            children: [
              Expanded(
                child: Image.asset(
                  onboardingImagePaths[index],
                  fit: BoxFit.cover, // To make the image fully fit the screen.
                ),
              ),
              Positioned(
                bottom: 20,
                right: 20,
                child: ElevatedButton(
                 style: ElevatedButton.styleFrom(backgroundColor: Colors.black),
                  onPressed: () {
                    if (_currentPage == onboardingImagePaths.length - 1) {
                      Navigator.of(context).push(
        MaterialPageRoute(
          builder: (context) => SignUp()
        ),
      );
                    } else {
                      _pageController.nextPage(
                        duration: Duration(milliseconds: 500),
                        curve: Curves.ease,
                      );
                    }
                  },
                  child: Text(_currentPage == onboardingImagePaths.length - 1 ? 'Get Started' : 'Next'),
                ),
              ),
            ],
          );
        },
      ),
    );
  }
}
