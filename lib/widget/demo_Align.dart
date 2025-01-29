
import 'package:flutter/material.dart';

class DemoAlign extends StatefulWidget {
  const DemoAlign({Key? key}) : super(key: key);

  @override
  State<DemoAlign> createState() => _DemoAlignState();
}

class _DemoAlignState extends State<DemoAlign> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Container(
            child: Column(children: [

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
             const Column(
               children: [
                 Text('Mua bán có tâm'),
                 Row(
                   children: [Text("8K Fan"), Text("+10 bài viết mới nhất")],
                 )
               ],
             )
            ],
          ),
              Center(
                child: Container(
                  height: 120.0,
                  width: 120.0,
                  color: Colors.blue[50],
                  child: const Align(
                    alignment: Alignment.topRight,
                    child: FlutterLogo(
                      size: 60,
                    ),
                  ),
                ),
              ),
              const SizedBox(height: 5,),
              Center(
                child: Container(
                  height: 120.0,
                  width: 120.0,
                  color: Colors.blue[50],
                  child: const Align(
                    alignment: Alignment(0.2, 0.6),
                    child: FlutterLogo(
                      size: 60,
                    ),
                  ),
                ),
              ),
              const SizedBox(height: 5,),
              Center(
                child: Container(
                  height: 120.0,
                  width: 120.0,
                  color: Colors.blue[50],
                  child: const Align(
                    alignment: FractionalOffset(0.2, 0.6),
                    child: FlutterLogo(
                      size: 60,
                    ),
                  ),
                ),
              )


        ])),
      ),
    );
  }
}
