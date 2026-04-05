import 'package:flutter/material.dart';
import 'package:modal_bottom_sheet/modal_bottom_sheet.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Modal Bottom Sheet',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: ModalBottomSheet(),
    );
  }
}

class ModalBottomSheet extends StatelessWidget {
  // Sủ dụng showCupertinoModalBottomSheet để hiển thị modal bottom sheet với hiệu ứng trượt lên từ dưới lên và có thể tuỳ chỉnh nhiều hơn so với showModalBottomSheet của Flutter
  void _showModal(BuildContext context) {
    showCupertinoModalBottomSheet(
      context: context,
      builder: (context) => ModalContent(),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Modal Bottom Sheet Example')),
      body: Center(
        child: ElevatedButton(
          onPressed: () => _showModal(context),
          child: Text('Show Bottom Sheet'),
        ),
      ),
    );
  }
}

class ModalContent extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Material(
      child: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Text('This is a modal bottom sheet', style: TextStyle(fontSize: 18)),
              SizedBox(height: 20),
              ElevatedButton(
                onPressed: () => Navigator.of(context).pop(),
                child: Text('Close'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
