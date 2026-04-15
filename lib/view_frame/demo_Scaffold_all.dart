import 'package:flutter/material.dart';
import 'package:flutter/gestures.dart';

class demo_Scaffold_all extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        // Thanh ứng dụng (AppBar) hiển thị tiêu đề, nút quay lại, biểu tượng, v.v.
        appBar: AppBar(
          // Dùng để thay đổi màu nền của AppBar.
          backgroundColor: Color.fromARGB(0, 60, 38, 38), // Màu của appBar
          foregroundColor: Colors.green, // Màu của title và action

          // Điều chỉnh độ cao của AppBar (tạo hiệu ứng bóng).
          // Giá trị mặc định là 4.0. Đặt 0.0 để loại bỏ bóng.
          // elevation: 1, // Cao độ của AppBar

          // Bên trái của AppBar
          // Là một widget hiển thị bên trái của AppBar, thường dùng để đặt icon điều hướng (menu, back button, v.v.).
          // Nếu không chỉ định, Flutter sẽ tự động hiển thị nút "back" nếu có thể điều hướng ngược lại.
          // leading: IconButton(
          //   icon: Icon(Icons.arrow_back),
          //   onPressed: () {},
          // ),

          // Tên của màn hình ở giữa Appbar
          title: const Text("demo Scafold"),

// Căn giữa tiêu đề trên cả Android và iOS.
          centerTitle: true,

// Cho phép đặt widget tùy chỉnh trong không gian linh hoạt của AppBar.
          // flexibleSpace: Container(
          //   decoration: BoxDecoration(
          //     gradient: LinearGradient(
          //       colors: [Colors.blue, Colors.purple],
          //     ),
          //   ),
          // ),

          //Bên phải AppBar
          // Là danh sách các widget nằm bên phải của AppBar, thường là các nút hành động.
          // actions: [
          //   // action là 1 mảng các icon mà có thể bấm vào thực hiện chức năng gì đó
          //   IconButton(
          //     onPressed: () {},
          //     icon: const Icon(Icons.search),
          //   ),

          //   IconButton(
          //     onPressed: () {},
          //     icon: const Icon(Icons.login),
          //   ),
          // ],

          scrolledUnderElevation: 4.0,
          shadowColor: Theme.of(context).shadowColor,

          // Phần dưới của AppBar
          // bottom: TabBar(
          //   tabs: <Widget>[
          //     Tab(
          //       icon: const Icon(Icons.cloud_outlined),
          //       // text: titles[0],     // Text hoặc child : chỉ được phép dùng 1 trong 2
          //       child: Container(
          //         height: 10,
          //         width: 10,
          //         color: Colors.amber,
          //       ),
          //     ),
          //   ],
          // ),
        ),

        // Nội dung chính của màn hình.
        body: Center(
          child: Text('Hello, Flutter!', style: TextStyle(fontSize: 24)),
        ),

        // Nút hành động nổi (FAB), thường dùng để thực hiện các tác vụ chính.
        floatingActionButton: FloatingActionButton(
          onPressed: () {
            print('Floating Action Button Pressed');
          },
          child: Icon(Icons.add),
          backgroundColor: Colors.red,
        ),

        // Tác dụng: Xác định vị trí của floating action button trên màn hình.
        // Giá trị mặc định: FloatingActionButtonLocation.endFloat
        floatingActionButtonLocation: FloatingActionButtonLocation.endFloat,

        // Thanh điều hướng dưới cùng của ứng dụng.
        bottomNavigationBar: BottomNavigationBar(
          items: [
            BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Home'),
            BottomNavigationBarItem(
                icon: Icon(Icons.settings), label: 'Settings'),
          ],
        ),

        // Ngăn kéo (Drawer) mở từ bên trái, chứa menu hoặc danh sách điều hướng.
        drawer: Drawer(
          child: ListView(
            children: [
              DrawerHeader(
                decoration: BoxDecoration(color: Colors.blue),
                child: Text('Menu',
                    style: TextStyle(color: Colors.white, fontSize: 24)),
              ),
              ListTile(
                leading: Icon(Icons.home),
                title: Text('Home'),
                onTap: () {},
              ),
              ListTile(
                leading: Icon(Icons.settings),
                title: Text('Settings'),
                onTap: () {},
              ),
            ],
          ),
        ),

        //Ngăn kéo mở từ bên phải.
        // Tác dụng: Drawer bên phải của Scaffold, tương tự drawer nhưng ở phía đối diện.
        // Giá trị mặc định: null
        endDrawer: Drawer(
          child: ListView(
            children: [
              DrawerHeader(
                decoration: BoxDecoration(color: Colors.green),
                child: Text('End Menu',
                    style: TextStyle(color: Colors.white, fontSize: 24)),
              ),
              ListTile(
                leading: Icon(Icons.account_circle),
                title: Text('Profile'),
                onTap: () {},
              ),
              ListTile(
                leading: Icon(Icons.logout),
                title: Text('Logout'),
                onTap: () {},
              ),
            ],
          ),
        ),

// Lắng nghe sự kiện mở/đóng drawer.
        onDrawerChanged: (isOpened) => {print('Draw open ')},
        // Lắng nghe sự kiện mở/đóng endDrawer.
        onEndDrawerChanged: (isOpened) => {print('Draw open ')},

// Hiệu ứng animation cho floatingActionButton.
        // Tác dụng: Animator được sử dụng để animate floating action button.
        // Giá trị mặc định: FloatingActionButtonAnimator.scaling
        floatingActionButtonAnimator: FloatingActionButtonAnimator.scaling,

        // Tác dụng: Danh sách các nút được hiển thị cố định ở cuối màn hình, phía trên bottomNavigationBar.
        // Giá trị mặc định: null
        persistentFooterButtons: [
          ElevatedButton(onPressed: () {}, child: Text('Footer Button 1')),
          ElevatedButton(onPressed: () {}, child: Text('Footer Button 2')),
        ],

        // Một trang hiển thị dưới màn hình, thường dùng để hiển thị menu hoặc hộp thoại.
        // Tác dụng: Widget được hiển thị như một sheet ở dưới cùng của Scaffold, phía trên bottomNavigationBar.
        // Giá trị mặc định: null
        bottomSheet: Container(
          height: 100,
          color: Colors.grey[300],
          child: Center(child: Text('Bottom Sheet')),
        ),

        // Tác dụng: Màu nền của Scaffold.
        // Giá trị mặc định: Theme.of(context).scaffoldBackgroundColor
        backgroundColor: Colors.white,

        // Điều chỉnh giao diện khi bàn phím xuất hiện.
        // Nếu true, body sẽ tự động điều chỉnh khi bàn phím xuất hiện.
        // Tác dụng: Xác định liệu Scaffold có tự động resize để tránh bottom inset (như keyboard) hay không.
        // Giá trị mặc định: true
        resizeToAvoidBottomInset: true,

        // Nếu false, appBar sẽ không tự động lùi xuống để tránh vùng trạng thái.
        // Tác dụng: Xác định liệu appBar có được coi là primary scroll view hay không.
        // Giá trị mặc định: true
        primary: true,

        // Tác dụng: Hành vi bắt đầu kéo cho drawer.
        // Giá trị mặc định: DragStartBehavior.start
        drawerDragStartBehavior: DragStartBehavior.start,

// Nếu true, body sẽ mở rộng dưới bottomNavigationBar.
        // Tác dụng: Xác định liệu body có mở rộng dưới bottomNavigationBar hay không.
        // Giá trị mặc định: false
        extendBody: true,

// Nếu true, body sẽ mở rộng sau appBar.
        // Tác dụng: Xác định liệu body có mở rộng dưới appBar hay không.
        // Giá trị mặc định: false
        extendBodyBehindAppBar: false,

        // Màu nền khi mở drawer.
        // Tác dụng: Màu của scrim (lớp phủ mờ) khi drawer được mở.
        // Giá trị mặc định: Colors.black54
        drawerScrimColor: Colors.black54,

        // Độ rộng vùng có thể kéo để mở drawer.
        // Tác dụng: Chiều rộng của vùng có thể kéo để mở drawer từ cạnh màn hình.
        // Giá trị mặc định: 20.0
        drawerEdgeDragWidth: 20.0,

        // Tác dụng: Xác định liệu có cho phép gesture kéo để mở drawer hay không.
        // Giá trị mặc định: true
        drawerEnableOpenDragGesture: true,
        // Tác dụng: Xác định liệu có cho phép gesture kéo để mở endDrawer hay không.
        // Giá trị mặc định: false
        endDrawerEnableOpenDragGesture: true,
        // Tác dụng: ID duy nhất để restore trạng thái của Scaffold khi app được khôi phục.
        // Giá trị mặc định: null
        restorationId: 'scaffold_demo',
      ),
    );
  }
}
