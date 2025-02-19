import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        body: Center(
          child: Stack(
            children: [
              Container(
                width: 300,
                height: 300,
                color: Colors.blueAccent, // Màu nền của Stack
              ),
              Positioned(
                left: (300 - 100) / 2, // Căn giữa theo chiều ngang
                top: (300 - 100) / 2,   // Căn giữa theo chiều dọc
                child: Container(
                  width: 100,
                  height: 100,
                  color: Colors.red, // Widget được Positioned
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}


// Cách căn giữa 1 View con nằm giữa Stack



// 🔥 Cách khác sử dụng Align thay vì Positioned
// Một cách đơn giản hơn là sử dụng Align thay vì Positioned,
// vì Align có thể đặt widget vào vị trí trung tâm dễ dàng hơn:

// Stack(
// children: [
// Align(
// alignment: Alignment.center,
// child: Container(
// width: 100,
// height: 100,
// color: Colors.red,
// ),
// ),
// ],
// )

// 💡 Nếu bạn bắt buộc phải dùng Positioned, hãy dùng cách đầu tiên.
// Nhưng nếu chỉ cần căn giữa đơn giản, Align hoặc Center là lựa chọn tốt hơn! 🚀
