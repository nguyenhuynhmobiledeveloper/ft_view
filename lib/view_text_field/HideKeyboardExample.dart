import 'package:flutter/material.dart';

// Cách để click ra bên ngoài là ẩn bàn phím
import 'package:flutter/material.dart';

class HideKeyboardExample extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        print('hiden keyboard');
        FocusScope.of(context).unfocus(); // Hides the keyboard
      },
      child: Scaffold(
        appBar: AppBar(title: Text('Tap Outside to Hide Keyboard')),
        body: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            children: [
              TextField(
                decoration: InputDecoration(labelText: 'Enter text'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}


