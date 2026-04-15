import 'package:flutter/material.dart';
import 'package:flutter/services.dart';



class demo_TextField_advance extends StatefulWidget {
  @override
  _CustomTextFieldState createState() => _CustomTextFieldState();
}

class _CustomTextFieldState extends State<demo_TextField_advance> {
  final TextEditingController _controller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: 300,  // Đặt chiều rộng
        height: 60,  // Đặt chiều cao
        padding:const EdgeInsets.symmetric(horizontal: 10), // Khoảng cách viền
        margin: const EdgeInsets.only(left : 0 , top: 100, right: 0, bottom : 0),
        decoration: BoxDecoration(
          border: Border.all(color: Colors.grey), // Viền ngoài
          borderRadius: BorderRadius.circular(10), // Bo góc
        
        ),
        child: TextField(
            //Điều khiển giá trị của TextField và lắng nghe thay đổi.
          controller: _controller,
            // Quản lý trạng thái focus của TextField.
            // focusNode: FocusScope.of(context).focusedChild,

            // Căn giữa dọc
            textAlignVertical: TextAlignVertical.center,

            // Định dạng hiển thị của TextField, như placeholder, viền, icon...
          decoration: InputDecoration(
              // Văn bản gợi ý.
            hintText: "Nhập văn bản...",

              // style của hintText
              hintStyle: const TextStyle(color: Colors.grey),
              //Nhãn hiển thị phía trên.
              labelText: "Hãy nhập",

              // Kiểu viền
            border: InputBorder.none, // Ẩn viền mặc định của TextField
      
            // Căn giữa nội dung
            contentPadding:const EdgeInsets.symmetric(vertical: 15.0, horizontal: 10.0),
      
            // Prefix Icon có thể nhấn được
            prefixIcon: GestureDetector(
                // Bắt sự kiện click vào prefixIcon và suffixIcon
              onTap: () {
                print("Bạn đã nhấn vào prefixIcon (tìm kiếm)!");
              },
              child:const Icon(Icons.search, color: Colors.blue),
            ),
      
            // Suffix Icon có thể nhấn để xóa nội dung
            suffixIcon: GestureDetector(
              onTap: () {
                _controller.clear(); // Xóa nội dung nhập vào
                print("Bạn đã nhấn vào suffixIcon (xóa)!");
              },
              child:const Icon(Icons.clear, color: Colors.red),
            ),
          ),

            // Xác định kiểu bàn phím (ví dụ: TextInputType.number cho số, TextInputType.emailAddress cho email...).
            keyboardType: TextInputType.numberWithOptions(),
            //  Xác định hành động trên bàn phím (ví dụ: TextInputAction.done, TextInputAction.next).

            textInputAction: TextInputAction.done,

            // Tùy chỉnh kiểu chữ (màu, font size, font weight...).
            style: TextStyle(),
//  Căn chỉnh văn bản (TextAlign.left, TextAlign.center, TextAlign.right...).
            textAlign: TextAlign.center,

//              Hướng của văn bản (TextDirection.ltr, TextDirection.rtl).
            textDirection: TextDirection.ltr,

//  Tự động focus khi hiển thị (true hoặc false).
            autofocus: true,
//  Bật/tắt tự động sửa lỗi chính tả (true hoặc false).
            autocorrect: true,
//  Bật/tắt gợi ý từ (true hoặc false).
            enableSuggestions: true,
//  Ẩn văn bản (thường dùng cho mật khẩu).
            obscureText: true,
//  Ký tự thay thế khi obscureText được bật (mặc định là *).
            obscuringCharacter: 'a',

            // Giới hạn nhập liệu
//            Giới hạn số ký tự tối đa.
            maxLength: 100,
//  Số dòng tối đa (mặc định là 1, đặt null để không giới hạn).
            maxLines: null,
//  Số dòng tối thiểu.
            minLines: 1,
//  Cho phép TextField mở rộng để lấp đầy không gian cha (cần đặt maxLines: null).
            expands: true,

//           Bật/tắt và kiểm soát hành vi

// Bật/tắt nhập liệu (true hoặc false).
            enabled: true,
//  Chỉ đọc, không cho nhập liệu.
            readOnly: false,
//  Hiển thị hoặc ẩn con trỏ nhập liệu.
            showCursor: true,
//  Màu con trỏ.
            cursorColor: Colors.red,
//  Độ dày con trỏ.
            cursorWidth: 3,
//  Chiều cao con trỏ.
            cursorHeight: 20,
//  Bo góc con trỏ.
            cursorRadius: Radius.circular(2),

            //Xử lý sự kiện
//  Gọi khi giá trị thay đổi.
            onChanged: (value) => {print(value)},
//  Gọi khi nhấn "Enter".
            onSubmitted: (value) => {print(value)},
//  Gọi khi hoàn tất chỉnh sửa.

            // onEditingComplete: (value) => {print(value)},
//  Gọi khi người dùng nhấn vào TextField.
            onTap: () => {print('onTap')},

//             Custom Input - Quy tắc nậho
//  Áp dụng định dạng nhập liệu (ví dụ: FilteringTextInputFormatter.digitsOnly chỉ cho phép nhập số).
            inputFormatters: [FilteringTextInputFormatter.digitsOnly],
//  Kiểm soát các hành động chọn văn bản.
// selectionControls:

//  Đặt giao diện bàn phím (Brightness.light hoặc Brightness.dark).

            keyboardAppearance: Brightness.light 


        ),
      ),
    );
  }
}
