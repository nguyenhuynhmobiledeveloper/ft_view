import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';

// Ví dụ 1 :

import 'package:flutter/material.dart';



// 🔥 Stack trong Flutter
// Stack trong Flutter là một widget dùng để xếp chồng các widget con lên nhau theo chiều dọc hoặc ngang. Các widget con trong Stack có thể được định vị bằng cách sử dụng Positioned hoặc Align.
//
// 📌 Các thuộc tính của Stack
// 1. alignment
//  Xác định vị trí mặc định của các widget con trong Stack nếu không có Positioned.
//  Giá trị: Alignment (ví dụ: Alignment.topLeft, Alignment.center, ...).

// 2. textDirection
//  Hướng văn bản trong Stack (hữu ích khi sử dụng trong các ngôn ngữ từ phải sang trái như tiếng Ả Rập).
//  Giá trị: TextDirection.ltr hoặc TextDirection.rtl.

// 3. fit
//  Xác định cách các widget con mở rộng để lấp đầy không gian có sẵn.
//  Giá trị: StackFit.loose, StackFit.expand, StackFit.passthrough.

// 4. clipBehavior
//  Xác định cách Stack cắt bớt nội dung con vượt quá kích thước của nó.
//  Giá trị: Clip.none, Clip.hardEdge, Clip.antiAlias, Clip.antiAliasWithSaveLayer.

// 5. children
//  Danh sách các widget con của Stack, có thể là bất kỳ widget nào.


class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(title: Text("Stack Example")),
        body: Center(
          child: Stack(
            alignment: Alignment.center,
            textDirection: TextDirection.ltr,
            fit: StackFit.loose,
            clipBehavior: Clip.antiAlias,
            children: [
              // Layer 1: Hình chữ nhật nền
              Container(
                width: 300,
                height: 300,
                color: Colors.blueAccent,
              ),

              // Layer 2: Vòng tròn ở giữa
              Container(
                width: 150,
                height: 150,
                decoration: const BoxDecoration(
                  color: Colors.redAccent,
                  shape: BoxShape.circle,
                ),
              ),

              // Layer 3: Text ở giữa
            const  Positioned(
                top: 20,
                child: Text(
                  "Flutter Stack",
                  style: TextStyle(color: Colors.white, fontSize: 20, fontWeight: FontWeight.bold),
                ),
              ),

              // Layer 4: Icon ở góc dưới phải
            const Positioned(
                bottom: 10,
                right: 10,
                child: Icon(Icons.star, size: 40, color: Colors.yellow),
              ),
            ],
          ),
        ),
      ),
    );
  }
}


class DemoStack extends StatefulWidget {
  const DemoStack({Key? key}) : super(key: key);

  @override
  State<DemoStack> createState() => _DemoStackState();
}

class _DemoStackState extends State<DemoStack> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Container(
          height: double.infinity,
          width: double.infinity,
          color: Color.fromARGB(255, 70, 147, 77),
          child: Stack(
            // Stack là widget cho phép các widget bên trong chồng đè nên nhau , cái viết trước thì nằm ở dưới, --> cái viết đầu tiên thì ở dưới cùng
            alignment: AlignmentDirectional.topStart,
            textDirection: TextDirection.ltr,
            fit: StackFit.loose,
            clipBehavior: Clip.hardEdge,

            children: [
              Container(
                height: 100,
                width: 100,
                color: Colors.yellow,

                padding: EdgeInsets.all(40),
                // margin: EdgeInsets.all(40),  // Đây vẫn là margin so với cách widget ngoài Stack
                child: Text("xin chào"),
              ),

              // Cái widget đầu tiên lúc nào cũng là cái widget nền
              Positioned(
                  top: 10,
                  left: 10,
                  child: Container(
                      height: 50,
                      width: 50,
                      color: Colors
                          .blue)), // Positioned : Quyết định vị trí của nó so với Stack : So với thằng widget đầu tiên
              Positioned(
                  top: 20,
                  left: 20,
                  child: Container(height: 50, width: 50, color: Colors.red)),
              Text("xin chào"),
            ],
          )),
    );
  }
}


// Cách thuộc tính của Stack
//Stack Stack({
//   Key? key,
//   AlignmentGeometry alignment = AlignmentDirectional.topStart,
//   TextDirection? textDirection,
//   StackFit fit = StackFit.loose,
//   Clip clipBehavior = Clip.hardEdge,
//   List<Widget> children = const <Widget>[],
// })

// Positioned Positioned({
//   Key? key,
//   double? left,
//   double? top,
//   double? right,
//   double? bottom,
//   double? width,
//   double? height,
//   required Widget child,
// })


