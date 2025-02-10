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
          child: DynamicButton(title: "Initial Title"),
        ),
      ),
    );
  }
}

class DynamicButton extends StatefulWidget {
  final String title;

  const DynamicButton({Key? key, required this.title}) : super(key: key);

  @override
  _DynamicButtonState createState() => _DynamicButtonState();
}

class _DynamicButtonState extends State<DynamicButton> {
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
        height: 50,
        constraints: const BoxConstraints(maxWidth:  200 ),
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8), // Container không cần thuộc tính width nó sẽ tự nhận theo chiều rộng của cái Text bên trong ruột
        decoration: BoxDecoration(
          border: Border.all(color: Colors.blueAccent),
          borderRadius: BorderRadius.circular(8),
        ),
        child: Text(
          buttonText,
          style:const TextStyle(fontSize: 16),
          maxLines: 1,
          overflow: TextOverflow.ellipsis,
        ),
      ),
    );
  }
}
