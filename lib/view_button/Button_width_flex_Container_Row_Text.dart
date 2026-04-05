import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(title:const Text("Dynamic Button")),
        body: const Center(
          child: Button_width_flex_Container_Row_Text(title: "Initial Title"),
        ),
      ),
    );
  }
}

class Button_width_flex_Container_Row_Text extends StatefulWidget {
  final String title;

  const Button_width_flex_Container_Row_Text({Key? key, required this.title}) : super(key: key);

  @override
  _Button_width_flex_Container_Row_TextState createState() => _Button_width_flex_Container_Row_TextState();
}

class _Button_width_flex_Container_Row_TextState extends State<Button_width_flex_Container_Row_Text> {
  String buttonText = "";

  @override
  void initState() {
    super.initState();
    buttonText = widget.title;
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        setState(() {
          buttonText = buttonText == "Initial Title" ? "Dynamic New Title -------------------------!" : "Initial Title";
        });
      },
      child: Container(
        // height: 50,
        constraints: const BoxConstraints(maxWidth:  200 ),
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8), // Container không cần thuộc tính width nó sẽ tự nhận theo chiều rộng của cái Text bên trong ruột
        decoration: BoxDecoration(
          border: Border.all(color: Colors.blueAccent),
          borderRadius: BorderRadius.circular(8),
        ),
        child: Row(
          // mainAxisAlignment: MainAxisAlignment.start,
          // crossAxisAlignment: CrossAxisAlignment.center,  // 2 thuộc tính trên trong ví dụ này không tác động đến
          mainAxisSize: MainAxisSize.min,  // Cần có  mainAxisSize để Row chỉ chiếm phần width vừa đủ để hiện hết nội dung con của nó
          children: [
            const Icon(Icons.check, color: Colors.blueAccent),
            Flexible(   // Để cho Text chiếm hết phần nội dung còn lại -- hiệu ứng hoàn toàn khác Expanded
              child: Text(
                buttonText,
                style:const TextStyle(fontSize: 16),
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

