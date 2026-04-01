import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: SwitchDemo(),
    );
  }
}

class SwitchDemo extends StatefulWidget {
  const SwitchDemo({super.key});

  @override
  _SwitchDemoState createState() => _SwitchDemoState();
}

class _SwitchDemoState extends State<SwitchDemo> {
  bool isOn = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Center(
        child: GestureDetector(
          onTap: () {
            setState(() {
              isOn = !isOn;
            });
          },
          child: AnimatedContainer(
            duration: const Duration(milliseconds: 300),
            width: 80,
            height: 40,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(20),
              color: isOn ? Colors.pink[300] : Colors.grey[300],
            ),
            child: Stack(
              alignment: Alignment.center,
              children: [
                //  vị trí của chữ on ở đường track ( đường ray)
                Positioned(
                  left: isOn ? 20 : 10,
                  child: Text(
                    "ON",
                    style: TextStyle(
                      color: isOn ? Colors.white : Colors.grey[600],
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),

                // Vị trí của hình tròn thumb (ngón tay ở giữa di chuyển)
                AnimatedPositioned(
                  duration: const Duration(milliseconds: 300),
                  right: isOn ? 10 : 40,
                  child: Container(
                    width: 30,
                    height: 30,
                    decoration: BoxDecoration(
                      color: Colors.white,
                      shape: BoxShape.circle,
                      boxShadow: [
                        BoxShadow(
                          color: Colors.black26,
                          blurRadius: 4,
                          spreadRadius: 1,
                          offset: Offset(0, 2),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}