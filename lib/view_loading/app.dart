import 'package:demo_ft_widget/view_loading/app_loading.dart';
import 'package:flutter/material.dart';
import 'package:loader_overlay/loader_overlay.dart';

final GlobalKey<NavigatorState> navigatorKey =
    GlobalKey<NavigatorState>(); // Tạo ra 1 GlobalKey Kiểu NavigatorState

class EffectLoading extends StatefulWidget {
  const EffectLoading({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return _EffectLoadingState();
  }
}

class _EffectLoadingState extends State<EffectLoading> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return GlobalLoaderOverlay(
        useDefaultLoading: false,
        overlayWidget: Center(
          child: Stack(
            alignment: Alignment.center,
            children: [
              Container(
                  width: 100,
                  height: 100,
                  padding: EdgeInsets.all(20),
                  decoration: BoxDecoration(color: Color(0xff2A3D4F)),
                  child: AppLoading.spinkit),
              // Nút đóng
              Positioned(
                top: 0,
                right: 0,
                child: GestureDetector(
                  onTap: () {
                    navigatorKey.currentContext!.loaderOverlay.hide();
                  },
                  child: Container(
                    decoration: BoxDecoration(
                      color: Colors.red,
                      shape: BoxShape.circle,
                    ),
                    padding: EdgeInsets.all(4),
                    child: Icon(Icons.close, color: Colors.white, size: 16),
                  ),
                ),
              ),
            ],
          ),
        ),
        child: MaterialApp(
          navigatorKey: navigatorKey, // Đây chính là sử dụng GlobalKeys
          debugShowCheckedModeBanner: false,
          theme: ThemeData(
              // fontFamily: Fonts.SFPro
              // fontFamily: Fonts.regular
              ),
          home: Scaffold(
              appBar: AppBar(
                title: const Text('Home'),
              ),
              body: const DemoStatelessWidget()),
        ));
  }
}

class DemoStatelessWidget extends StatelessWidget {
  const DemoStatelessWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return (Center(
      child: Container(
        width: 300,
        height: 300,
        child: Column(
          children: [
            InkWell(
                onTap: () {
                  navigatorKey.currentContext!.loaderOverlay
                      .show(); // Hiện hiệu ứng đợi ở bất cứ đâu
                },
                child: Container(
                  height: 100,
                  width: 100,
                  color: Colors.amber,
                )),
           const SizedBox(
              height: 100,
            ),
            InkWell(
                onTap: () {
                  navigatorKey.currentContext!.loaderOverlay
                      .hide(); // Ẩn hiệu ứng đợi ở bất cứ đâu
                },
                child: Container(
                  height: 100,
                  width: 100,
                  color: Colors.blue,
                )),
          ],
        ),
      ),
    ));
  }
}
