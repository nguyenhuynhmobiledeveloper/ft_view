import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(title: Text("Button with Conditional Max Width")),
        body: Center(
          child: DynamicButton(),
        ),
      ),
    );
  }
}

class DynamicButton extends StatefulWidget {
  @override
  _DynamicButtonState createState() => _DynamicButtonState();
}

class _DynamicButtonState extends State<DynamicButton> {
  String buttonText = "Click Me";

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        setState(() {
          buttonText = buttonText == "Click Me"
              ? "This is a very long dynamic title that might overflow!"
              : "Click Me";
        });
      },
      child: LayoutBuilder(
        builder: (context, constraints) {
          double maxWidth = 300; // Giới hạn chiều rộng khi text dài
          bool isTextLong = buttonText.length > 20;  // Kể cả đẻ > 2 vào đây vẫn đạt được hiệu ứng , vì "Click Me" không sài tới 300 nên nó vẫn nhỏ tý

          return ConstrainedBox(
            constraints: isTextLong
                ? BoxConstraints(maxWidth: maxWidth)
                : BoxConstraints(), // Không giới hạn chiều rộng khi text ngắn
            child: Container(
              decoration: BoxDecoration(
                border: Border.all(color: Colors.blueAccent),
                borderRadius: BorderRadius.circular(8),
              ),
              padding: EdgeInsets.symmetric(horizontal: 16, vertical: 8),
              child: Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Flexible(
                    child: Text(
                      buttonText,
                      style: TextStyle(fontSize: 16),
                      overflow: isTextLong ? TextOverflow.ellipsis : null,
                    ),
                  ),
                  SizedBox(width: 8),
                  Icon(Icons.edit, size: 18),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
