import 'package:flutter/material.dart';

void main() {
  runApp(const TextFieldAdvance());
}

class TextFieldAdvance extends StatelessWidget {
  const TextFieldAdvance({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(title:const Text("Demo TextField")),
        body: Padding(
          padding:const EdgeInsets.all(20.0),
          child: Column(
            children: [
              CustomTextField(),
            ],
          ),
        ),
      ),
    );
  }
}

class CustomTextField extends StatefulWidget {
  @override
  _CustomTextFieldState createState() => _CustomTextFieldState();
}

class _CustomTextFieldState extends State<CustomTextField> {
  final TextEditingController _controller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: 300,  // Đặt chiều rộng
        height: 60,  // Đặt chiều cao
        padding:const EdgeInsets.symmetric(horizontal: 10), // Khoảng cách viền
        decoration: BoxDecoration(
          border: Border.all(color: Colors.grey), // Viền ngoài
          borderRadius: BorderRadius.circular(10), // Bo góc
        ),
        child: TextField(
          controller: _controller,
          textAlignVertical: TextAlignVertical.center, // Căn giữa dọc
          decoration: InputDecoration(
            hintText: "Nhập văn bản...",
            hintStyle:const TextStyle(color: Colors.grey),
            border: InputBorder.none, // Ẩn viền mặc định của TextField
      
            // Căn giữa nội dung
            contentPadding:const EdgeInsets.symmetric(vertical: 15.0, horizontal: 10.0),
      
            // Prefix Icon có thể nhấn được
            prefixIcon: GestureDetector(
              onTap: () {
                print("Bạn đã nhấn vào prefixIcon (tìm kiếm)!");
              },
              child:const Icon(Icons.search, color: Colors.blue),
            ),
      
            // Suffix Icon có thể nhấn để xóa nội dung
            suffixIcon: GestureDetector(
              onTap: () {
                _controller.clear(); // Xóa nội dung nhập vào
                print("Bạn đã nhấn vào suffixIcon (xóa)!");
              },
              child:const Icon(Icons.clear, color: Colors.red),
            ),
          ),
        ),
      ),
    );
  }
}
