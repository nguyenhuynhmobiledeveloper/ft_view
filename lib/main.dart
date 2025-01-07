




import 'package:flutter/material.dart';


import 'drop_down/demo_DropdownButton2.dart';

void main() async {
  // runApp(const MyApp());

  // runApp(const TinCoderMainView()); // tin_coder_view -- view-library
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
          brightness: Brightness.light,
          primaryColor: Colors.blueGrey),
      home: ( const DemoDropDownButton2()),
    );
  }
}
