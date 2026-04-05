import 'dart:async';
import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: demo_PageController(),
    );
  }
}

class demo_PageController extends StatefulWidget {
  @override
  _demo_PageControllerState createState() => _demo_PageControllerState();
}

class _demo_PageControllerState extends State<demo_PageController> {
  late PageController _pageController;  // Tạo biến PageController
  int _currentPage = 0;
  late Timer _timer;

  final List<Color> _colors = [Colors.red, Colors.green, Colors.blue];

  @override
  void initState() {
    super.initState();
    _pageController = PageController(initialPage: _currentPage);

    _timer = Timer.periodic(const Duration(seconds: 3), (Timer timer) {
      // Sau mỗi 3 giây sẽ sử dụng biến _pageController để thay đổi PageView 1 lần

      if (_currentPage < _colors.length - 1) {
        _currentPage++;
      } else {
        _currentPage = 0;
      }

      _pageController.animateToPage(  // Sử dụng PageController để tự động thay đổi trang trong PageView
        _currentPage,
        duration:const  Duration(milliseconds: 500),
        curve: Curves.easeInOut,
      );

    });
  }

  @override
  void dispose() {
    _timer.cancel();
    _pageController.dispose();
    super.dispose();
  }

  // Always call dispose() to clean up the Timer or PageController.

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        height: 100,
          margin: EdgeInsets.only(top: 66),
        child: PageView.builder(  // Sử dụng Widget PageView , và đưa thuộc tính controller vào
          controller: _pageController,
          itemCount: _colors.length,
          itemBuilder: (context, index) {
            return Container(color: _colors[index]);
          },
        ),
      ),
    );
  }
}
