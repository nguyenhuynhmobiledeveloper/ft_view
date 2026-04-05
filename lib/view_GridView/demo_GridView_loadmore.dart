import 'package:flutter/material.dart';

class GridViewLoadMore extends StatefulWidget {
  const GridViewLoadMore({super.key});

  @override
  _GridViewLoadMoreState createState() => _GridViewLoadMoreState();
}

class _GridViewLoadMoreState extends State<GridViewLoadMore> {
  List<int> items = List.generate(20, (index) => index); // Initial data
  bool isLoading = false;
  final ScrollController _scrollController = ScrollController();

  @override
  void initState() {
    super.initState();
    _scrollController.addListener(_scrollListener); // Add scroll listener
  }

  @override
  void dispose() {
    _scrollController.dispose(); // Clean up the controller
    super.dispose();
  }

  void _scrollListener() {
    if (_scrollController.position.pixels ==
        _scrollController.position.maxScrollExtent) {
      // User has scrolled to the bottom
      _loadMoreItems();
    }
  }

  Future<void> _loadMoreItems() async {
    if (isLoading) return; // Prevent multiple simultaneous loads

    setState(() {
      isLoading = true;
    });

    // Simulate a network or database delay
    await Future.delayed(Duration(seconds: 2));

    // Add more items
    setState(() {
      items.addAll(List.generate(20, (index) => items.length + index));
      isLoading = false;
    });
  }

  // Sử dụng ScrollController để có thể lắng nghe sự kiện cuộn tới cuối trang và loadmore thêm dữ liệu
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('GridView Load More'),
      ),
      body: GridView.builder(   // Không để thuộc tính physics : nó cũng tụ có cái cuộn 
        controller: _scrollController, // Attach the scroll controller
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2, // Number of columns
          crossAxisSpacing: 8.0,
          mainAxisSpacing: 8.0,
        ),
        itemCount: items.length + (isLoading ? 1 : 0), // Add 1 for loading indicator
        itemBuilder: (context, index) {
          if (index < items.length) {
            // Render regular items
            return Card(
              child: Center(
                child: Text('Item ${items[index]}'),
              ),
            );
          } else {
            // Render loading indicator
            return const  Center(
              child: CircularProgressIndicator(),
            );
          }
        },
      ),
    );
  }
}
