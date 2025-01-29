
import 'package:flutter/material.dart';

class DemoClipRRect extends StatefulWidget {
  const DemoClipRRect({Key? key}) : super(key: key);

  @override
  State<DemoClipRRect> createState() => _DemoClipRRectState();
}

class _DemoClipRRectState extends State<DemoClipRRect> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Container(
            child: Column(children: [
          Container(
              height: 50,
              color: Colors.green[50],
              child: Row(children: [
                Container(
                  margin: const EdgeInsets.only(left: 20, top: 10),
                  child: const Icon(
                    Icons.arrow_back_ios,
                    color: Colors.green,
                    size: 30.0,
                  ),
                ),

                Container(
                    width: 300,
                    child: const Center(
                        child: Text(
                            style: TextStyle(
                                color: Colors.amber,
                                fontSize: 30,
                                fontWeight: FontWeight.w900),
                            "Nhóm được mời"))) // Bởi vì chưa set height , width cho thằng cha
              ])),
          Container(
            height: 1,
            color: Colors.amber,
          ),
          Row(
            children: [
              ClipRRect(
                borderRadius: BorderRadius.circular(8.0),
                child:const  Image(
                  height: 70,
                  width: 70,
                  image: NetworkImage(
                      'https://flutter.github.io/assets-for-api-docs/assets/widgets/owl.jpg'),
                ),
              ),
              Container(
                child: const Column(
                  children: [
                    Text('Mua bán có tâm'),
                    Row(
                      children: [Text("8K Fan"), Text("+10 bài viết mới nhất")],
                    )
                  ],
                ),
              )
            ],
          )
        ])),
      ),
    );
  }
}
