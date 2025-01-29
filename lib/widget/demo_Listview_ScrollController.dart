import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ListViewScrollController extends StatefulWidget {
  const ListViewScrollController({super.key});

  @override
  _ListViewScrollControllerState createState() =>
      _ListViewScrollControllerState();
}

class _ListViewScrollControllerState
    extends State<ListViewScrollController> {
  final ScrollController _scrollController = ScrollController();

  @override
  void initState() {
    super.initState();

    // Optional: Add a listener to handle scroll events
    _scrollController.addListener(() {
      if (_scrollController.position.atEdge) {
        if (_scrollController.position.pixels == 0) {
          print('Scrolled to the top');
        } else {
          print('Scrolled to the bottom');
        }
      }
    });
  }

  @override
  void dispose() {
    _scrollController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    List<String> items = List.generate(50, (index) => 'Item $index');

    return Scaffold(
      appBar: AppBar(title: const Text('Scrollable List with Controller')),
      body: ListView.builder(
        controller: _scrollController, // Attach the controller
        itemCount: items.length,
        itemBuilder: (context, index) {
          return ListTile(
            title: Text(items[index]),
          );
        },
      ),
    );
  }
}
