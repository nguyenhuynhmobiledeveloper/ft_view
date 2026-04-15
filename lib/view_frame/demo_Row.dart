import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';

class demo_Row extends StatefulWidget {
  const demo_Row({Key? key}) : super(key: key);

  @override
  State<demo_Row> createState() => _demo_RowState();
}

class _demo_RowState extends State<demo_Row> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Column(
        children: [
          Container(
            height: 500,
            width: 400,
            color: Colors.green[50],
            child: Row(
                mainAxisAlignment: MainAxisAlignment.start, // Theo chiều ngang
                // crossAxisAlignment: CrossAxisAlignment.start, // Hướng chiều Đứng   // Bắt buộc phải khai báo height cho widget cha
            
            // Xác định widget con của Row sẽ chiến bao nhiêu không gian 
                mainAxisSize: MainAxisSize.max,
                // Mặc định : Row sẽ chiếm hết toàn bộ không gian theo trục chính, kể cả khi các widget con không cần sử dụng hết không gian đó.
                // mainAxisSize: MainAxisSize.min,
                // Row chỉ chiếm đủ không gian vừa đủ để hiển thị các widget con của nó.
                // textDirection: TextDirection.rtl,

                children: [
                 
                  Container(
                      height: 40,
                      width: 40,
                      color: Colors.amber,
                      margin: EdgeInsets.symmetric(vertical: 5, horizontal: 5)),
                  Container(
                    height: 80,
                    width: 80,
                    color: Colors.pink,
                    child: Center(
                        child: Container(
                      margin: EdgeInsets.only(top: 20),
                      height: 30,
                      width: 30,
                      color: Colors.black,
                    )),
                  ),
                  Container(
                      height: 40,
                      width: 40,
                      color: Colors.red,
                      margin: EdgeInsets.symmetric(vertical: 5, horizontal: 5)),
                 
                ]),
          ),

          const Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              // Empty placeholder for the left
              SizedBox.shrink(),

              // Centered child
              Text("Centered Text"),

              // Right-aligned child
              Text("Right Aligned"),
            ],
          ),
          Row(
            children: [
              // Centered child in an Expanded widget
              Expanded(
                child: Center(
                  child: Text("Centered Text"),
                ),
              ),

              // Right-aligned child
              Text("Right Aligned"),
            ],
          )
        ],
      ),
    );
  }
}

// Row({
//   Key? key,
//   MainAxisAlignment mainAxisAlignment = MainAxisAlignment.start,
//   CrossAxisAlignment crossAxisAlignment = CrossAxisAlignment.center,
//   List<Widget> children = const <Widget>[],

//   MainAxisSize mainAxisSize = MainAxisSize.max,
//   TextDirection? textDirection,
//   VerticalDirection verticalDirection = VerticalDirection.down,
//   TextBaseline? textBaseline,
// })

//  Center({
//   Key? key,
//   double? widthFactor,
//   double? heightFactor,
//   Widget? child,
// })
