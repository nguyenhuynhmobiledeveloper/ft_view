import 'package:flutter/material.dart';


class MyApp extends StatelessWidget {
  const MyApp({super.key});
  // Widget này là gốc cho ứng dụng của bạn

  @override // Viết lại method : phương thức , Property : thuộc tính
  Widget build(BuildContext context) {
  return MaterialApp(
      home: MyHomePage(isLoading: false, counter: 0),
    );
  }
}

class MyHomePage extends StatefulWidget {
  final bool isLoading;
  final int counter;

  const MyHomePage({
    required this.isLoading,
    required this.counter,
  });

  @override
  State<MyHomePage> createState() {
    return MyHomePageState();
  }
}

class MyHomePageState extends State<MyHomePage> {
  late bool _isLoading;
  late int _counter;

  @override
  void initState() {
    super.initState();
    _isLoading = widget.isLoading;
    _counter = widget.counter;
  }

  @override
  Widget build(BuildContext context) {
    print('rebuild MyHomePage');
    return Scaffold(
      appBar: AppBar(title: Text('Not Use InheritedWidget')),
      body: Center(
        child: CounterWidget(
          isLoading: _isLoading,
          counter: _counter,
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: onFloatingButtonClicked,
      ),
    );
  }

  void onFloatingButtonClicked() {
    print('Button clicked!. Call setState method');
    setState(() {
      _counter++;
      if (_counter % 2 == 0) {
        _isLoading = false;
      } else {
        _isLoading = true;
      }
    });
  }
}

class CounterWidget extends StatelessWidget {
  final bool isLoading;
  final int counter;

  const CounterWidget({
    required this.isLoading,
    required this.counter,
  });

  @override
  Widget build(BuildContext context) {
    return isLoading ? CircularProgressIndicator() : Text('$counter');
  }
}
