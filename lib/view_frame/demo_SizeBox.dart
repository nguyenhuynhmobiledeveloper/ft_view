import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

// SizedBox là một widget trong Flutter dùng để tạo một hộp có kích thước cụ thể hoặc để
// điều chỉnh kích thước của một widget con bên trong nó.

// width	double? // 	Chiều rộng của SizedBox. Nếu để null, nó sẽ không giới hạn chiều rộng.
// height	double?	// Chiều cao của SizedBox. Nếu để null, nó sẽ không giới hạn chiều cao.
// child	Widget?	// Widget con bên trong SizedBox. Nếu không có, SizedBox chỉ dùng để tạo khoảng trống.

// Một số trường hợp sử dụng SizedBox phổ biến

// 1. Tạo khoảng trống giữa các widget
// SizedBox(height: 20), // Tạo khoảng cách 20 pixel theo chiều dọc
// SizedBox(width: 10),  // Tạo khoảng cách 10 pixel theo chiều ngang

// 2. Giới hạn kích thước của một widget
// SizedBox(
// width: 100,
// height: 50,
// child: ElevatedButton(
// onPressed: () {},
// child: Text("Click Me"),
// ),
// )

// 3. Tạo một hộp trống không có child
// SizedBox.shrink(); // Tạo SizedBox có kích thước bằng 0

// 4. Làm giãn widget theo chiều rộng hoặc chiều cao
// SizedBox.expand(); // Chiếm toàn bộ không gian sẵn có





class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(title: const Text("SizedBox Example")),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const  Text("Trên đây là khoảng trống 20px"),

              const SizedBox(height: 20), // Tạo khoảng trống 20px

              Container(
                width: 200,
                height: 100,
                color: Colors.blue,
                alignment: Alignment.center,
                child:const Text("Box 1", style: TextStyle(color: Colors.white)),
              ),

              const SizedBox(height: 30), // Tạo khoảng trống 30px

              SizedBox(
                width: 200,
                height: 100,
                child: ElevatedButton(
                  onPressed: () {},
                  child:const Text("Click Me"),
                ),
              ),

              const SizedBox(height: 20), // Tạo khoảng trống 20px

              const  Text("Dưới đây là một hộp có kích thước 100x50"),

              const SizedBox(height: 10), // Khoảng cách 10px

              SizedBox(
                width: 100,
                height: 50,
                child: Container(
                  color: Colors.green,
                  alignment: Alignment.center,
                  child:const Text("Box 2", style: TextStyle(color: Colors.white)),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
