import 'package:flutter/material.dart';


class demo_ConstrainedBox extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('ConstrainedBox Example'),
        ),
        body: Center(

          // ConstrainedBox: cho phép bạn đặt các giới hạn về chiều rộng và chiều cao của widget con.
          // widget sẽ không thể mở rộng hoặc thu nhỏ ngoài các giới hạn đã đặt trong BoxConstraints. 
          // Đây là một công cụ hữu ích để kiểm soát bố cục trong Flutter.
          child: ConstrainedBox(
            constraints: BoxConstraints(
              minWidth: 200,
              maxWidth: 300,
              minHeight: 100,
              maxHeight: 200,
            ),
            child: Container(
              color: Colors.blueAccent,
              child: const Center(
                child: Text(
                  'Constrained Box Widget',
                  style: TextStyle(color: Colors.white, fontSize: 16),
                  textAlign: TextAlign.center,
                ),
              ),
            ),
          ),
        ),
      );
  
  }
}
