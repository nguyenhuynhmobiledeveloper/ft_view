import 'package:flutter/material.dart';

class demo_showModalBottomSheet extends StatelessWidget {
  const demo_showModalBottomSheet({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Center(
        child: ElevatedButton(
          child: const Text('showModalBottomSheet'),
          onPressed: () {

            // Hàm mở 1 Bottom Sheet dạng Modal, khi mở sẽ có 1 lớp phủ mờ phía sau
            // và người dùng phải tương tác với Bottom Sheet trước khi có thể tương tác với phần còn lại của ứng dụng.
            // Khi người dùng nhấn vào nút "Show Bottom Sheet", hàm showModalBottomSheet sẽ được gọi
            showModalBottomSheet<void>(
              context: context,
              builder: (BuildContext context) => ModalBottomSheet(context),
            );
          },
        ),
      ),
    );
  }
}

Widget ModalBottomSheet(context) {
  return SizedBox(
    height: 200,
    child: Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        mainAxisSize: MainAxisSize.min,
        children: <Widget>[
          const Text('Modal BottomSheet'),
          ElevatedButton(
            child: const Text('Close BottomSheet'),
            //  Cách đóng Bottom Sheet bằng cách gọi Navigator.pop(context) để đóng nó lại
            // onPressed: () => Navigator.pop(context),

            // Có thể truyền dữ liệu khi đóng showModalBottomSheet bằng Navigator.pop(context, data).
            onPressed: () => Navigator.pop(context, "Dữ liệu trả về"),
          ),
        ],
      ),
    ),
  );
}
