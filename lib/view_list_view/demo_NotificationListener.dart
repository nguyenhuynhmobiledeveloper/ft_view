import 'package:flutter/material.dart';

// Lắng nghe sự kiện cuộ của ListView bằng NotificationListener và xử lý khi cuộn kết thúc (ScrollEndNotification)
class demo_NotificationListener extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('NotificationListener Example')),
      body: NotificationListener<ScrollNotification>(
        // Lắng nghe các thông báo cuộn từ ListView 
        onNotification: (ScrollNotification notification) {
          // Kiểm tra nếu thông báo là ScrollEndNotification (cuộn kết thúc)
          if (notification is ScrollEndNotification) {
            print('Scrolling ended');
          }
          return true; // true để chặn thông báo, false nếu muốn tiếp tục truyền
        },
        child: ListView.builder(
          itemCount: 50,
          itemBuilder: (context, index) => ListTile(
            title: Text('Item $index'),
          ),
        ),
      ),
    );
  }
}


// Trong Flutter, NotificationListener là một widget được sử dụng để lắng nghe và xử lý các thông báo (Notification) được phát ra từ cây widget con của nó. Đây là một phần của hệ thống thông báo (Notification) có sẵn trong Flutter, giúp giao tiếp giữa các widget một cách linh hoạt mà không cần truyền dữ liệu trực tiếp qua tham số.

// Cách hoạt động
// Khi một widget trong cây con phát ra thông báo bằng cách gọi phương thức dispatch(context), tất cả các NotificationListener trong cây widget cha sẽ có cơ hội lắng nghe và xử lý thông báo đó.
// Bạn có thể chỉ định kiểu thông báo mà NotificationListener quan tâm bằng cách đặt tham số generic T extends Notification.
// Ví dụ
// Giả sử chúng ta muốn lắng nghe cuộn của một ListView:

// Một số kiểu Notification phổ biến
// ScrollNotification: Phát sinh khi danh sách hoặc cuộn cuộn.
// Các lớp con như ScrollStartNotification, ScrollEndNotification, UserScrollNotification.
// SizeChangedLayoutNotification: Khi kích thước của widget con thay đổi.
// Lợi ích
// Tăng tính linh hoạt khi giao tiếp giữa các widget trong cây widget.
// Không cần truyền callback hay dữ liệu qua nhiều lớp widget.

// void main() => runApp(MaterialApp(home: demo_NotificationListener()));
