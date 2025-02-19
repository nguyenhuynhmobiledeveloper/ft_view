import 'package:flutter/material.dart';
import 'dart:async';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);
  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
          brightness: Brightness.light,
          primaryColor: Colors.blueGrey),
      home:  const LoadingButton() );
  }
}


class LoadingButton extends StatefulWidget {
  const LoadingButton({super.key});

  @override
  _LoadingButtonState createState() => _LoadingButtonState();
}

class _LoadingButtonState extends State<LoadingButton>
    with SingleTickerProviderStateMixin {
  bool isLoading = false;

  // Animation controller for rotation
  late AnimationController _controller;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 1),
    )..repeat();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  void startLoading() {
    setState(() {
      isLoading = true;
    });

    // Stop loading after 5 seconds
    Timer(const Duration(seconds: 2), () {
      setState(() {
        isLoading = false;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: isLoading
          ? null
          : () {
        startLoading();
      },
      style: ElevatedButton.styleFrom(
        padding:const EdgeInsets.symmetric(horizontal: 30, vertical: 15),
      ),
      child: isLoading
          ? SizedBox(
        width: 24,
        height: 24,
        child: AnimatedBuilder(
          animation: _controller,
          builder: (context, child) {
            return Transform.rotate(
              angle: _controller.value * 2 * 3.14159,
              child: child,
            );
          },
          child: const Icon(
            Icons.refresh,
            color: Colors.white,
          ),
        ),
      )
          :const Text(
        "Click Me",
        style: TextStyle(fontSize: 18),
      ),
    );
  }
}
