import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';



class view_hyperLinkText extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(title: Text('Hyperlink Example')),
        body: Center(
          child: RichText(
            text: TextSpan(
              text: 'This is normal text, and ',
              style: TextStyle(color: Colors.black, fontSize: 16),
              children: [
                TextSpan(
                  text: 'this is a hyperlink',
                  style: TextStyle(
                    color: Colors.blue,
                    fontSize: 16,
                    decoration: TextDecoration.underline,
                  ),

                  // Thuộc tính khi click vào text đang giả là hyperlink
                  recognizer: TapGestureRecognizer()
                    ..onTap = () {
                      // Action when the hyperlink is tapped
                      print('Hyperlink tapped!');
                      // For example, navigate to another page or open a URL
                    },
                ),
                TextSpan(
                  text: ' in the middle of normal text.',
                  style: TextStyle(color: Colors.black, fontSize: 16),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
