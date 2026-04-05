import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

// Một class luôn trả ra 1 view loading để có thể sử dụng ở bất kỳ đâu trong app mà không cần phải khởi tạo lại đối tượng
class AppLoading {
  // 1 biến static để có thể gọi trực tiếp mà không cần phải khởi tạo đối tượng
  static final spinkit = SpinKitFadingCircle(
    itemBuilder: (BuildContext context, int index) {
      return DecoratedBox(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          color: index.isEven ? Colors.white : Colors.white,
        ),
      );
    },
  );
}
