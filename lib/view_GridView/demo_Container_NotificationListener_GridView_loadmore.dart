import 'package:flutter/material.dart';

class ContainerNotificationListenerGridviewLoadMore extends StatefulWidget {
  @override
  _ContainerNotificationListenerGridviewLoadMoreState createState() =>
      _ContainerNotificationListenerGridviewLoadMoreState();
}

class _ContainerNotificationListenerGridviewLoadMoreState extends State<ContainerNotificationListenerGridviewLoadMore> {
  List<int> items = List.generate(20, (index) => index); // Initial data
  bool isLoading = false;

  // Simulates fetching data from an API
  Future<void> fetchMoreItems() async {
    if (isLoading) return; // Prevent multiple fetches
    setState(() {
      isLoading = true;
    });

    await Future.delayed(const Duration(seconds: 2)); // Simulate network delay
    List<int> newItems =
    List.generate(10, (index) => items.length + index); // Add 10 more items

    setState(() {
      items.addAll(newItems);
      isLoading = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("GridView Load More Example")),
      body: Container(
        height: 400,
        decoration: const BoxDecoration(color: Colors.amber),
        padding: const EdgeInsets.all(8.0),
        child: NotificationListener<ScrollNotification>(   // Sử dụng notification để lắng nghe thông báo cuộn từ các Widget con
          onNotification: (ScrollNotification scrollInfo) {
            // Detect when the user has scrolled to the bottom
            if (!isLoading &&
                scrollInfo.metrics.pixels == scrollInfo.metrics.maxScrollExtent) {
              fetchMoreItems();
            }
            return false;
          },
          child: GridView.builder(
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2, // Number of items per row
              crossAxisSpacing: 8.0,
              mainAxisSpacing: 8.0,
            ),
            itemCount: items.length + (isLoading ? 1 : 0), // Add 1 for loader
            itemBuilder: (context, index) {
              if (index == items.length) {
                // Loader widget at the bottom
                return const Center(
                  child: CircularProgressIndicator(),
                );
              }
              return Container(
                alignment: Alignment.center,
                color: Colors.blueAccent,
                child: Text(
                  "Item ${items[index]}",
                  style: const TextStyle(color: Colors.white),
                ),
              );
            },
          ),
        ),
      ),
    );
  }
}

void main() => runApp(MaterialApp(
  home: ContainerNotificationListenerGridviewLoadMore(),
));
