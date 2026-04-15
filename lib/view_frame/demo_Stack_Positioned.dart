import 'package:flutter/material.dart';

class demo_Stack_Positioned extends StatelessWidget {
  const demo_Stack_Positioned({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Demo Stack Positioned')),
      body: Center(
        // Các view nằm chồng đè lên nhau 
          child: Stack(
            children: [
            Container(
              width: 400,
              height: 400,
              color: Colors.blueAccent, // Màu nền của Stack
            ),
            Positioned(
              top: (300 - 100) / 2, // Căn giữa theo chiều dọc
              left: (300 - 100) / 2, // Căn giữa theo chiều ngang
              // right: 50,
              // bottom: 50,
              // Nếu đặt cả , top, right, left , bottom thì kích thước của widget child sẽ bị ignore
              child: Container(
                width: 100,
                height: 100,
                color: Colors.red, // Widget được Positioned
              ),
            ),

       
            ],
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
