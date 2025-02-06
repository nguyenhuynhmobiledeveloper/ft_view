import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: const Text('ClipRect Example'),
        ),
        body: Center(
          child: ClipRect(
            child: Align(
              alignment: Alignment.topLeft,
              widthFactor: 0.5, // Cắt theo chiều ngang (50% kích thước gốc)
              heightFactor: 0.8, // Cắt theo chiều dọc (30% kích thước gốc)
              child: Container(
                width: 300,
                height: 200,
                color: Colors.orange,
                child: const Center(
                  child: Text(
                    'This is a large container with clipped content!',
                    style: TextStyle(color: Colors.black),
                    textAlign: TextAlign.center,
                  ),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}


// Có thể sử dụng ClipRect để ứng dụng cho việc căt View nếu view con to hơn  View cha
// Tránh đưa ra lỗi Render overflow

// Giải thích:
// ClipRect: Cắt nội dung của widget con theo hình chữ nhật.
// Align với widthFactor và heightFactor: Xác định tỷ lệ cắt (ở đây cắt còn 50% chiều rộng và 30% chiều cao).
// Container lớn hơn không gian hiển thị: Nội dung vượt giới hạn sẽ bị cắt.
// Bạn có thể tùy chỉnh widthFactor và heightFactor hoặc bỏ Align để cắt toàn bộ phần không phù hợp với màn hình.