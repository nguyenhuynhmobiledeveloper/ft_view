
import 'package:flutter/material.dart';

class DemoTextPainter extends StatelessWidget {
  const DemoTextPainter({super.key});

  @override
  Widget build(BuildContext context) {
    String text = 'This is a long piece of text that may occupy multiple lines. '
        'We want to calculate how many lines this text occupies in the current layout.';

    // Set your TextStyle and constraints
    TextStyle textStyle = const TextStyle(fontSize: 16);
    double maxWidth = 300; // Assume a max width for the Text widget

    int numberOfLines = calculateNumberOfLines(text, textStyle, maxWidth);  // Tính toán số dòng của Text được hiển thị

    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Container(
          width: maxWidth,
          child: Text(
            text,
            style: textStyle,
          ),
        ),
        const SizedBox(height: 20),
        Text(
          'Number of lines: $numberOfLines',
          style:const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
        ),
      ],
    );
  }

  int calculateNumberOfLines(String text, TextStyle style, double maxWidth) {
    final TextPainter textPainter = TextPainter(
      text: TextSpan(text: text, style: style),
      textDirection: TextDirection.ltr,
      maxLines: null, // Allows unlimited lines for calculation
    );

    // Layout the text with the given constraints
    textPainter.layout(maxWidth: maxWidth);

    // Calculate the number of lines by dividing total height by line height
    final int lineCount = (textPainter.size.height / textPainter.preferredLineHeight).ceil();
    return lineCount;
  }
}
