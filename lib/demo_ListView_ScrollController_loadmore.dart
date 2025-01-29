import 'package:flutter/material.dart';

class ListViewScrollControllerLoadMore extends StatefulWidget {
  const ListViewScrollControllerLoadMore({super.key});

  @override
  _ListViewScrollControllerLoadMoreState createState() => _ListViewScrollControllerLoadMoreState();
}

class _ListViewScrollControllerLoadMoreState extends State<ListViewScrollControllerLoadMore> {
  // Initial list of items
  List<int> _items = List.generate(20, (index) => index);
  bool _isLoading = false;

  // Function to simulate loading more data
  Future<void> _loadMore() async {
    if (_isLoading) return;

    setState(() {
      _isLoading = true;
    });

    // Simulate a delay for loading new data
    await Future.delayed(Duration(seconds: 2));

    // Add new items to the list
    setState(() {
      _items.addAll(List.generate(20, (index) => _items.length + index));
      _isLoading = false;
    });
  }


  late ScrollController _scrollController;
  @override
  void initState() {
    super.initState();
     _scrollController = ScrollController();

    _scrollController.addListener(() {
      if (_scrollController.position.pixels ==
          _scrollController.position.maxScrollExtent) {
        _loadMore();
      }
    });
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Load More Example'),
      ),
      body: ListView.builder(
        controller: _scrollController,
        itemCount: _items.length + 1, // Add 1 for the loading indicator
        itemBuilder: (context, index) {
          if (index < _items.length) {
            return ListTile(
              title: Text('Item ${_items[index]}'),
            );
          } else {
            // Display loading indicator at the end
            if (_isLoading) {
              return const  Center(
                child: Padding(
                  padding:  EdgeInsets.all(8.0),
                  child: CircularProgressIndicator(),
                ),
              );
            } else {
              return TextButton(
                onPressed: _loadMore,
                child: const Text('Load More'),
              );
            }
          }
        },
      ),
    );
  }
}

// void main() {
//   runApp(MaterialApp(
//     home: ListViewScrollControllerLoadMore(),
//   ));
// }
