import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';

class DemoListView extends StatefulWidget {
  const DemoListView({Key? key}) : super(key: key);

  @override
  State<DemoListView> createState() => _DemoListViewState();
}

class _DemoListViewState extends State<DemoListView> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    List<String> listItem = ["a", 'b', 'c', 'd'];

    return Container(
      height: 400,
      child: ListView.builder(
          // Xác định số lượng phần tử trong danh sách.
// Nếu không có, danh sách sẽ cuộn vô hạn.
          itemCount: listItem.length,
          // một item xuất hiện trên màn hình.
          itemBuilder: ((context, index) => ItemBuilder(listItem[index])),
          //Hướng cuộn danh sách (Axis.vertical hoặc Axis.horizontal).
          scrollDirection: Axis.vertical,

//Xác định ListView có chiếm toàn bộ không gian hay không.
// Mặc định: false.
// Nếu true, danh sách chỉ chiếm không gian cần thiết.
          shrinkWrap: false,
// Điều khiển hành vi cuộn của danh sách.
// Một số giá trị phổ biến:
// NeverScrollableScrollPhysics(): Vô hiệu hóa cuộn.
// BouncingScrollPhysics(): Hiệu ứng kéo thả như iOS.
// ClampingScrollPhysics(): Hiệu ứng kéo thả như Android.
          physics: BouncingScrollPhysics(),

// Bắt buộc: ❌
// Kiểu dữ liệu: EdgeInsetsGeometry?
// Xác định khoảng cách lề của danh sách.
          padding: EdgeInsets.all(10),

// Bắt buộc: ❌
// Kiểu dữ liệu: bool
// Nếu true, danh sách sẽ cuộn ngược từ dưới lên.
          reverse: false,

// Bắt buộc: ❌
// Kiểu dữ liệu: ScrollController?
// Dùng để kiểm soát cuộn danh sách.
// controller:

// Bắt buộc: ❌
// Kiểu dữ liệu: double?
// Xác định khoảng cách ngoài màn hình mà danh sách có thể render trước để cuộn mượt hơn.
          cacheExtent: 100,

// Bắt buộc: ❌
// Kiểu dữ liệu: bool?
// Nếu true, ListView sẽ sử dụng PrimaryScrollController mặc định của ứng dụng.
          primary: true,

// Bắt buộc: ❌
// Kiểu dữ liệu: Widget?
// Dùng để ước tính kích thước của một item, giúp cải thiện hiệu suất.
          prototypeItem: ItemBuilder(listItem[0])),
    );
  }
}

Widget ItemBuilder(item) {
  return ListTile(
    leading: Text(item),
    title: Text('----item $item'),
    selectedColor: Colors.amber,
    iconColor: Colors.pink,

    textColor: Colors.blue, // Màu của chữ
    tileColor: Colors.green, // Màu của background title
  );
}

//ListView.builder({
// Key? key,
// Axis scrollDirection = Axis.vertical,
// bool reverse = false, ScrollController?
// controller, bool? primary,
// ScrollPhysics? physics,
// bool shrinkWrap = false,
// EdgeInsetsGeometry? padding,
// double? itemExtent,
// Widget? prototypeItem,
// required Widget Function(BuildContext, int) itemBuilder,
// int? Function(Key)? findChildIndexCallback,
// int? itemCount,
// bool addAutomaticKeepAlives = true,
// bool addRepaintBoundaries = true,
// bool addSemanticIndexes = true,
// double? cacheExtent,
// int? semanticChildCount,
// DragStartBehavior dragStartBehavior = DragStartBehavior.start,
// ScrollViewKeyboardDismissBehavior keyboardDismissBehavior = ScrollViewKeyboardDismissBehavior.manual,
// String? restorationId,
// Clip clipBehavior = Clip.hardEdge
// })
