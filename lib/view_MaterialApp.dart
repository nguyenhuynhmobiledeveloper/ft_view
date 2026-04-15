import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp()); // Tạo 1 đối tượgn MyApp()
}

final GlobalKey<ScaffoldMessengerState> messengerKey =
    GlobalKey<ScaffoldMessengerState>();


class MyApp extends StatelessWidget {
  const MyApp({super.key});
  // Widget này là gốc cho ứng dụng của bạn

  @override // Viết lại method : phương thức , Property : thuộc tính
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',   // Tiêu đề của ứng dụng, thường xuất hiện trên thanh tác vụ
      // Định nghĩa giao diện chính của ứng dụng.
      // Mặc định: ThemeData.light()
      theme: ThemeData(
      primarySwatch: Colors.blue,
        textTheme: TextTheme(bodyLarge: TextStyle(fontSize: 18)),
      ),
// Chủ đề khi chế độ tối được bật.
// Mặc định: null
      darkTheme: ThemeData.dark(),

      //Điều chỉnh ứng dụng sử dụng chủ đề sáng, tối hoặc theo hệ thống.
//       Giá trị:
// ThemeMode.light → Luôn dùng theme sáng.
// ThemeMode.dark → Luôn dùng theme tối.
// ThemeMode.system → Theo cài đặt hệ thống.

      themeMode: ThemeMode.system,


      debugShowCheckedModeBanner : false ,//Ẩn/hiện biểu ngữ “Debug” ở góc trên bên phải màn hình khi chạy chế độ debug.
      // home: const MyHomePage(), // Đây chính là cái ruột App :  MyHomePage : Lại là 1 widget : Đây chính là tạo ra đối tượng MyHomePage từ class MyHomePage
      home: HomeScreen(),

      // routes: {
          // '/': (context) => HomeScreen(),
          // '/about': (context) => AboutScreen(),
        // },
// Màn hình đầu tiên được chọn 
initialRoute: '/', 

//Xử lý điều hướng động khi một route không được khai báo trong routes
// onGenerateRoute: (settings) {
//         if (settings.name == '/profile') {
//           // return MaterialPageRoute(builder: (context) => ProfileScreen());
//         }
//         return null;
//       },

// // Xử lý khi route không được tìm thấy.
// onUnknownRoute: (settings) {
        // return MaterialPageRoute(builder: (context) => NotFoundScreen());
//       },


// Cấu hình ngôn ngữ 
//Mô tả: Ngôn ngữ hiện tại của ứng dụng.
locale: Locale('vi', 'VN'),

// Danh sách các ngôn ngữ ứng dụng hỗ trợ.

supportedLocales: [
        Locale('en', 'US'),
        Locale('vi', 'VN'),
      ],
//Các delegate chịu trách nhiệm tải dữ liệu ngôn ngữ.
      localizationsDelegates: [
      
      ],

//Danh sách các observer để theo dõi trạng thái điều hướng.
      navigatorObservers: [
        // MyNavigatorObserver(),
      ],

      // Cung cấp quyền truy cập vào ScaffoldMessenger toàn cục.
        scaffoldMessengerKey: messengerKey,

       );
  }
}


class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const Placeholder();
  }
}