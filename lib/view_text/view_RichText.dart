import 'package:flutter/material.dart';

class view_RichText extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(title: Text("RichText Example")),
        body: Center(
          child: RichText(
            //Căn chỉnh văn bản theo các hướng khác nhau
            textAlign: TextAlign.left,
//Hướng hiển thị văn bản:
            textDirection: TextDirection.rtl,

//Điều chỉnh kích thước chữ theo hệ số.
            textScaleFactor: 1.5,

            // Xác định xem văn bản có được tự động xuống dòng hay không (true hoặc false).
            softWrap: true,

            // Kiểm soát cách văn bản xử lý khi vượt quá không gian hiển thị:
            overflow: TextOverflow.visible,

            // Xác định số dòng tối đa của văn bản.
            maxLines: 2,

            // Định nghĩa ngôn ngữ hiển thị của văn bản.
            locale: Locale('vn'),

// Định dạng khoảng cách giữa các dòng văn bản.
            strutStyle: StrutStyle(fontSize: 10),

            text: TextSpan(
              style: TextStyle(fontSize: 20), // Kích thước mặc định
              children: [
                TextSpan(
                  text: "Chào mừng ",
                  style: TextStyle(
                      color: Colors.blue, fontWeight: FontWeight.bold),
                ),
                TextSpan(
                  text: "đến với ",
                  style: TextStyle(
                      color: Colors.green, fontStyle: FontStyle.italic),
                ),
                TextSpan(
                  text: "Flutter!",
                  style: TextStyle(
                    color: Colors.red,
                    fontWeight: FontWeight.w900,
                    fontSize: 30,
                    shadows: [
                      Shadow(
                        color: Colors.black,
                        offset: Offset(2, 2),
                        blurRadius: 3,
                      )
                    ],
                  ),
                ),

                // Cách dể dấu sao được hiển thị ở phía trên
                TextSpan(
                  style: TextStyle(fontSize: 24, color: Colors.black),
                  children: [
                    TextSpan(text: "Hello "),
                    WidgetSpan(
                      alignment:
                          PlaceholderAlignment.middle, // Căn giữa chiều dọc
                      child: Text(
                        "*",
                        style: TextStyle(fontSize: 30, color: Colors.red),
                      ),
                    ),
                    TextSpan(text: " Flutter"),
                  ],
                ),

                // Cách khác để dấu sao được hiển thị ở phía trên
                WidgetSpan(
                  child: Baseline(
                    baseline: 20, // Điều chỉnh vị trí
                    baselineType: TextBaseline.alphabetic,
                    child: Text(
                      "*",
                      style: TextStyle(fontSize: 30, color: Colors.red),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
