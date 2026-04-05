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
          child: Button_Button_width_flex_LayoutBuilder_ConstrainedBox_Container_Row_Textwidth_flex_Container_Text(),
        ),
      ),
    );
  }
}

class Button_Button_width_flex_LayoutBuilder_ConstrainedBox_Container_Row_Textwidth_flex_Container_Text extends StatefulWidget {
  @override
  _Button_Button_width_flex_LayoutBuilder_ConstrainedBox_Container_Row_Textwidth_flex_Container_TextState createState() => _Button_Button_width_flex_LayoutBuilder_ConstrainedBox_Container_Row_Textwidth_flex_Container_TextState();
}

class _Button_Button_width_flex_LayoutBuilder_ConstrainedBox_Container_Row_Textwidth_flex_Container_TextState extends State<Button_Button_width_flex_LayoutBuilder_ConstrainedBox_Container_Row_Textwidth_flex_Container_Text> {
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
              margin: EdgeInsets.all(16),
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
