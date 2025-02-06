import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(title: Text("Demo ClipRRect")),
        body: Center(
          child: ClipRRect(
            borderRadius: BorderRadius.circular(49.0),
            // child: Image.network(
            //   'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQRHHgPn96P5mGLa1xkZWbfWxmR6RUGOYnFNg&s',
            //   width: 400,
            //   height: 400,
            //   fit: BoxFit.cover,
            // ),
            // child: Image.network('https://picsum.photos/250?image=9')
            // child: Image.network('https://flutter.github.io/assets-for-api-docs/assets/widgets/owl-2.jpg',
            //     width: 400,
            //     height: 400,
            //     fit: BoxFit.cover,
            // )

           child:   Container(
              height: 400, width: 400,
             decoration:const BoxDecoration(color: Colors.black12),
            )
          ),

        ),
      ),
    );
  }
}


// ClipRRect Widget trong Flutter
// ClipRRect là một widget trong Flutter được sử dụng để cắt (clip) các widget con của nó theo một hình dạng hình chữ nhật có góc được bo tròn.
// Điều này hữu ích khi bạn muốn hiển thị các thành phần như hình ảnh hoặc container với viền bo tròn.
//
// Thuộc tính chính của ClipRRect
// borderRadius: Định nghĩa bán kính bo góc (kiểu BorderRadius).
// clipBehavior: Xác định cách cắt widget (mặc định là Clip.antiAlias).
// child: Widget con để áp dụng hiệu ứng cắt.
//
// Giải thích ví dụ
// ClipRRect(borderRadius: BorderRadius.circular(16.0)): Bo góc hình ảnh với bán kính 16 pixel.
// Image.network(): Hiển thị hình ảnh từ URL.
// fit: BoxFit.cover: Bảo đảm hình ảnh hiển thị đầy đủ trong khung đã cắt.
// Kết quả
// Hình ảnh được hiển thị với góc bo tròn 16 pixel, giúp giao diện mềm mại và thẩm mỹ hơn.

