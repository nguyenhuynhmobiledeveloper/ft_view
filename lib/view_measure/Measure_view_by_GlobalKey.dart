import 'package:flutter/material.dart';

class Measure_view_by_GlobalKey extends StatefulWidget {
  @override
  _Measure_view_by_GlobalKeyState createState() => _Measure_view_by_GlobalKeyState();
}

class _Measure_view_by_GlobalKeyState extends State<Measure_view_by_GlobalKey> {
 

 // Tạo một GlobalKey và gắn nó cho widget mà bạn muốn đo chiều cao.
  final GlobalKey _widgetKey = GlobalKey();

  double _widgetHeight = 0.0;

  void _measureWidget() {

    // WidgetsBinding.instance.addPostFrameCallback: Chờ sau khi widget đã được vẽ trên màn hình để đo kích thước.
    WidgetsBinding.instance.addPostFrameCallback((_) {
      // Sử dụng thuộc tính RenderBox để truy xuất kích thước của widget sau khi nó được vẽ.
      final RenderBox renderBox =
          _widgetKey.currentContext?.findRenderObject() as RenderBox;
      if (renderBox != null) {
        setState(() {
          _widgetHeight = renderBox.size.height;
        });
      }
    });
  }

  // Kích thước của widget chỉ chính xác sau khi khung hình đã được dựng.
// Bạn có thể đo cả width bằng cách truy cập RenderBox.size.width.

  @override
  void initState() {
    super.initState();
    _measureWidget();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Measure Widget Height'),
      ),
      body: Column(
        children: [
          Container(
            key: _widgetKey,
            color: Colors.blue,
            padding: EdgeInsets.all(16),
            child: Text(
              'This widget height will be measured',
              style: TextStyle(color: Colors.white),
            ),
          ),
          SizedBox(height: 16),
          Text('Measured Height: $_widgetHeight pixels'),
        ],
      ),
    );
  }
}
