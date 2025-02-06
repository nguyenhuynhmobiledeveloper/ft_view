import 'package:demo_ft_widget/demo_NotificationListener.dart';
import 'package:demo_ft_widget/widget/widget_main.dart';
import 'package:flutter/material.dart';


import 'ButtonLoading.dart';
import 'demo_ListView_ScrollController_loadmore.dart';
import 'drop_down/demo_DropdownButton2.dart';

void main() async {

    runApp(const DemoWidget());    // folder widget

  // runApp(const MyApp());


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
          brightness: Brightness.light,
          primaryColor: Colors.blueGrey),
      home:
          // const DemoDropDownButton2()
          // const LoadingButton()
          // const ListViewScrollControllerLoadMore()
          NotificationListenerExample(),

    );
  }
}
