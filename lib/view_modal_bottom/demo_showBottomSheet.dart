import 'package:flutter/material.dart';

class demo_showBottomSheet extends StatelessWidget {
  const demo_showBottomSheet({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Center(
        child: ElevatedButton(
          child: const Text('demo_showBottomSheet'),
          onPressed: () {
            // Lấy ScaffoldState từ context để đảm bảo showBottomSheet hoạt động
            showBottomSheet(
              context: context,
              builder: (context) {
                return BottomSheet(
                  onClosing: () {
                    print("BottomSheet đóng lại");
                  },
                  builder: (context) {
                    return Container(
                      height: 200,
                      child: Center(
                        child: Text("BottomSheet không có modal"),
                      ),
                    );
                  },
                );
              },
            );
          },
        ),
      ),
    );
  }
}