import 'package:flutter/material.dart';

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text('My App'),
        ),
        body: const Center(
            child: const Text(
          'Hello Flutter!\n Hello World!',
          style: TextStyle(
            //
            fontSize: 20.0, // Kích thước của text
            fontFamily: 'Roboto',
            fontFamilyFallback: [
              'Arial',
              'Sans-serif'
            ], // Font fallback nếu font chính không tồn tại
            fontWeight: FontWeight.bold, // Độ đậm của text
            fontStyle: FontStyle.italic, // Kiểu font của text
            //
            color: Colors.blue, // Màu của chữ
            backgroundColor: Colors.yellow, // Màu sắc nền của text
            //
            height: 2.0, // Chiều cao của text
            // lineHeight: 2.0, // Chiều cao của dòng  // Không có thuộc tính lineHeight
            letterSpacing: 2.0, // Khoảng cách giữa các chữ cái
            wordSpacing: 4.0, // Khoảng cách giữa các từ

            //
            overflow: TextOverflow
                .ellipsis, // Cách xử lý văn bản khi nó vượt quá kích thước hiển thị.
            //
            decoration: TextDecoration.underline,
            decorationColor: Colors.red, // Màu sắc của đường gạch dưới
            decorationThickness: 2.0, // Độ dày của đường gạch dưới
            decorationStyle: TextDecorationStyle.dotted, // Kiểu đường gạch dưới
            //

            shadows: const [
              // Bóng của text
              Shadow(
                color: Colors.black,
                offset: Offset(2, 2),
                blurRadius: 1,
              ),
              Shadow(
                color: Colors.green,
                offset: Offset(2, 2),
                blurRadius: 3,
              )
            ],
          ),
        )),
      ),
    );
  }
}
