import 'package:flutter/material.dart';

class DemoText extends StatelessWidget {
  const DemoText({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(title: const Text('Limit Lines Example')),
        body:const Center(
          child: Text(
            'This is an example of a Flutter text widget. '
                'You can limit the number of lines using the maxLines property.',
            maxLines: 2, // Limit the text to 2 lines
            overflow: TextOverflow.ellipsis, // Add "..." if the text overflows
            // TextOverflow.ellipsis : Thêm dâu ba chấm ở cuối dòng
            style: TextStyle(fontSize: 16),
          ),
        ),
      ),
    );
  }
}




