import 'package:flutter/material.dart';
import 'package:xlo/screens/home/home_screen.dart';

class BaseScreen extends StatefulWidget {
  @override
  _BaseScreenState createState() => _BaseScreenState();
}

class _BaseScreenState extends State<BaseScreen> {
  final PageController _pageController = PageController();
  @override
  Widget build(BuildContext context) {
    //_pageController.jumpToPage(2);

    return Scaffold(
      body: PageView(
        controller: _pageController,
        physics: const NeverScrollableScrollPhysics(),
        children: <Widget>[
          HomeScreem(),
          Container(color: Colors.blue),
          Container(color: Colors.green),
          Container(color: Colors.blue),
          Container(color: Colors.red)
        ],
      ),
    );
  }
}
