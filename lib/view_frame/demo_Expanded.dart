import 'package:flutter/material.dart';

class demo_Expanded extends StatelessWidget {
  const demo_Expanded({super.key});

  // Flex widget : bao gồn có Row, Column,  Flex, Expanded hoặc Flexible

  // Expanded : Chiếm toàn bộ không gian trống có sẵn trong một Row, Column hoặc Flex.
// Là một lớp con của Flexible.
// Buộc widget con phải chiếm toàn bộ không gian trống có sẵn.
// Không cho phép widget con có kích thước nhỏ hơn không gian được phân bổ.

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Column(
        children: [
          Row(
              children: [
                Expanded(
                  child: Container(
                    color: Colors.blue,
                    height: 50,
                  ),
                ),
                Expanded(
                  child: Container(
                    color: Colors.red,
                    height: 50,
                  ),
                ),
              ],
            ),
// Flexible là một widget con của Flex trong Flutter,
            // Flexible
// Cung cấp không gian linh hoạt cho widget con nhưng không ép buộc widget con chiếm toàn bộ không gian trống.
// Widget con có thể có kích thước nhỏ hơn không gian phân bổ nếu nó muốn.

            Row(
              children: [
                Flexible(
                  flex: 2,
                  // fit : FlexFit.tight, // Buộc widget con chiếm toàn bộ không gian phân bổ
                  fit: FlexFit.loose,  // Cho phép widget con có kích thước nhỏ hơn không gian phân bổ nếu nó muốn
                  child: Container(
                    color: Colors.green,
                    // width: 50,
                    height: 50,
                  ),
                ),
                Flexible(
                  flex: 1,
                  fit: FlexFit.loose, 
                  child: Container(
                    color: Colors.orange,
                    width: 100,
                    height: 50,
                  ),
                ),
              ],
            )
        ],
      )
    );
  }
}


