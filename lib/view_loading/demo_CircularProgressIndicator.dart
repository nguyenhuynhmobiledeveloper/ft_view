import 'package:flutter/material.dart';

class CircularLoadingExample extends StatelessWidget {
  const CircularLoadingExample({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Circular Loading Example'),
      ),
      body: const Center(
        child: CircularProgressIndicator(
          color: Colors.blue, // Màu sắc của vòng tròn
          strokeWidth: 6.0,  // Độ dày của vòng tròn
        ),
      ),
    );
  }
}

