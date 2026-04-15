import 'package:demo_ft_widget/all_view.dart';
import 'package:demo_ft_widget/date_time_intl/date_picker.dart';
import 'package:demo_ft_widget/view_ScrollView/demo_SingleChildScrollView_loadmore.dart';
import 'package:demo_ft_widget/view_alert/demo_AlertDialog.dart';
import 'package:demo_ft_widget/view_frame/demo_Align.dart';
import 'package:demo_ft_widget/view_BottomNavigationBar/demo_BottomAppBar.dart';
import 'package:demo_ft_widget/view_frame/demo_ClipRRect.dart';
import 'package:demo_ft_widget/view_frame/demo_ClipRRect_example.dart';
import 'package:demo_ft_widget/view_frame/demo_Column.dart';
import 'package:demo_ft_widget/view_frame/demo_ConstrainedBox.dart';
import 'package:demo_ft_widget/view_frame/demo_Container.dart';
import 'package:demo_ft_widget/view_button/demo_GestureDetector.dart';
import 'package:demo_ft_widget/view_GridView/demo_GridView_loadmore.dart';
import 'package:demo_ft_widget/view_frame/demo_Expanded.dart';
import 'package:demo_ft_widget/view_frame/demo_Scaffold_all.dart';
import 'package:demo_ft_widget/view_image/demo_Image.dart';
import 'package:demo_ft_widget/view_list_view/demo_ListView.dart';
import 'package:demo_ft_widget/view_frame/demo_Row.dart';
import 'package:demo_ft_widget/view_alert/demo_SnackBar.dart';

import 'package:demo_ft_widget/view_frame/demo_Stack.dart';
import 'package:demo_ft_widget/view_measure/Measure_view_by_GlobalKey.dart';
import 'package:demo_ft_widget/view_modal_bottom/demo_showBottomSheet.dart';
import 'package:demo_ft_widget/view_modal_bottom/modal_bottom_sheet.dart';
import 'package:demo_ft_widget/view_modal_bottom/modal_bottom_sheet_scroll.dart';
import 'package:demo_ft_widget/view_text/view_RichText.dart';
import 'package:demo_ft_widget/view_text/view_hyperLinkText.dart';
import 'package:demo_ft_widget/view_text_field/HideKeyboardExample.dart';
import 'package:demo_ft_widget/view_text_field/demo_TextField.dart';
import 'package:demo_ft_widget/view_frame/demo_Scaffold.dart';
import 'package:demo_ft_widget/view_text_field/demo_TextField_advance.dart';
import 'package:demo_ft_widget/view_modal_bottom/demo_showModalBottomSheet.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:demo_ft_widget/view_frame/demo_Scaffold_basic.dart';
import 'package:demo_ft_widget/view_ScrollView/demo_SingleChildScrollView.dart';

import 'view_GridView/demo_Container_NotificationListener_GridView_loadmore.dart';
import 'view_list_view/demo_Listview_ScrollController.dart';
import 'view_GridView/demo_SingleChildScrollView_Container_NotificationListener_GridView_loadmore.dart';
import 'view_GridView/demo_SingleChildScrollView_GridView_loadmore.dart';
import 'view_loading/demo_CircularProgressIndicator.dart';
import 'view_text/demo_Text.dart';
import 'view_text/demo_TextPainter.dart';
// import 'demo_GridView.dart';

void main() async {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
            brightness: Brightness.light, primaryColor: Colors.blueGrey),

        // routes: routes, // Nhận 1 danh sách các màn hình
        // initialRoute: '/', // Màn hình mặc định được lên đầu tiên
        home:
            // const DemoDropDownButton2()   // View DropDownButton2
            // const LoadingButton()  // View button loadding
            // const ListViewScrollControllerLoadMore()  // View Danh sách list có loadmore
            // NotificationListenerExample(),
            // DemoBottomNavigationBar()  // View bottom tab bar ở dưới màn hình BottomNavigationBar
            // EffectLoading()  // View loading toàn màn hình
            // ModalBottomSheet()  // View modal bottom sheet sử dụng thư viện modal_bottom_sheet
            // TinCoderView(), // View code có nguồn từ tin coder
            // ButonLoading_Stack_Positioned() // View button loading sử dụng Stack và Positioned
            // Button_width_flex_ConstrainedBox_Container_Row_Text() // View button Text có giới hạn chiều rộng khi text dài sử dụng ConstrainedBox
            // Button_width_flex_Container_Row_Text(title: "Initial Title") // View button Text có giới hạn chiều rộng khi text dài sử dụng Container
            // Button_width_flex_Container_Text(title: "Initial Title"), // View button Text có giới hạn chiều rộng khi text dài sử dụng Container
            //  Button_Button_width_flex_LayoutBuilder_ConstrainedBox_Container_Row_Textwidth_flex_Container_Text()
            // ListView_ScrollController_loadmore()  // View Danh sách list có loadmore
            // demo_NotificationListener()  // View NotificationListener
            // demo_PageController()  // View PageController page View với tự động cuộn sau 1 khoảng thời gian nhất định
      // demo_AnimatedSwitcher() // View Timer
   
            // const DatePicker()
            // demo_showModalBottomSheet()
            // modal_bottom_sheet()
            // modal_bottom_sheet_scroll()
            // view_RichText()
            // HideKeyboardExample()
            // demo_Scaffold_all()
            // demo_showBottomSheet()
            // demo_Expanded()
            // demo_ConstrainedBox(),
            // demo_Row()
            // demo_SingleChildScrollView_loadmore()
            // Measure_view_by_GlobalKey()

            view_hyperLinkText()



        );
  }
}


Map<String, WidgetBuilder> get routes => {
      '/': (context) => const AllView(),
      '/Container': (context) => const DemoContainer(),
      '/Image': (context) => const DemoImage(),
      '/Column': (context) => const DemoColumn(),
      '/Row': (context) => const demo_Row(),
      '/Stack': (context) => const DemoStack(),
      '/ListView': (context) => const DemoListView(),
      '/TextField': (context) => const DemoTextField(),
      '/GestureDetector': (context) => const DemoGestureDetector(),
      '/BottomAppBar': (context) => const DemoBotomAppBar(),
      '/AlertDialog': (context) => const DialogExample(),
      '/showModalBottomSheet': (context) => const demo_showModalBottomSheet(),
      '/SingleChildScrollView': (context) =>
          const SingleChildScrollViewExample(),
      '/SingleChildScrollView_GridView_loadmore': (context) =>
          const demo_SingleChildScrollView_GridView_loadmore(),
      '/SingleChildScrollView_Container_NotificationListener_GridView_loadmore':
          (context) =>
              SingleChildScrollViewContainerNotificationListenerGridViewLoadMore(),
      '/Container_NotificationListener_GridView_loadmore': (context) =>
          ContainerNotificationListenerGridviewLoadMore(),
      '/GridView_loadmore': (context) => const GridViewLoadMore(),
      '/Align': (context) => const DemoAlign(),
      '/CircularProgressIndicator': (context) => const CircularLoadingExample(),
      '/Text': (context) => const DemoText(),
      '/TextPainter': (context) => const DemoTextPainter(),
    };
