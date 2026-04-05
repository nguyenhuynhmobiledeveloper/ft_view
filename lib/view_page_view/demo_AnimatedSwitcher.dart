import 'dart:async';
import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: demo_AnimatedSwitcher(),
    );
  }
}

class demo_AnimatedSwitcher extends StatefulWidget {
  @override
  _demo_AnimatedSwitcherState createState() => _demo_AnimatedSwitcherState();
}

class _demo_AnimatedSwitcherState extends State<demo_AnimatedSwitcher> {
  int _currentIndex = 0;
  late Timer _timer;

  final List<Widget> _views = [
    Container(color: Colors.red),
    Container(color: Colors.green),
    Container(color: Colors.blue),
  ];

  @override
  void initState() {
    super.initState();
    _timer = Timer.periodic(Duration(seconds: 3), (Timer timer) {   // Sau mỗi 3 giấy sẽ được chạy lại 1 lần
      print('object ${timer.tick}');
      setState(() {
        _currentIndex = (_currentIndex + 1) % _views.length;  // setState để render lại UI
      });
    });
  }

  // Sử dụng Timer để setState theo định kỳ periodic
// Always call dispose() to clean up the Timer or PageController.
  @override
  void dispose() {
    _timer.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        height: 100,
        margin: EdgeInsets.only(top: 66),
        child: AnimatedSwitcher(
          duration: const Duration(milliseconds: 500),
          child: _views[_currentIndex],
        ),
      ),
    );
  }
}
