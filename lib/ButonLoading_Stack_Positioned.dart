import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(title: Text('Loading Button Example')),
        body: Center(
          child: LoadingButton(),
        ),
      ),
    );
  }
}

class LoadingButton extends StatefulWidget {
  @override
  _LoadingButtonState createState() => _LoadingButtonState();
}

class _LoadingButtonState extends State<LoadingButton> {
  bool isLoading = false;

  void handleClick() {
    setState(() {
      isLoading = true;
    });
    Future.delayed( const Duration(seconds: 3), () {
      setState(() {
        isLoading = false;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
       const Text(
          'Click the button to load',
          style: TextStyle(fontSize: 18),
        ),
       const SizedBox(height: 20),
        Stack(
          alignment: Alignment.center,
          children: [
            ElevatedButton(
              onPressed: isLoading ? null : handleClick,
              style: ElevatedButton.styleFrom(
                padding: EdgeInsets.symmetric(horizontal: 24, vertical: 12),
              ),
              child: Text('Click Me'),
            ),
            if (isLoading)
            const  Positioned(
                child: SizedBox(
                  width: 24,
                  height: 24,
                  child: CircularProgressIndicator(
                    color: Colors.white,
                    strokeWidth: 2.5,
                  ),
                ),
              ),
          ],
        ),
      ],
    );
  }
}
