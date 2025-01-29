import 'package:flutter/material.dart';

class SingleChildScrollViewContainerGridViewLoadMore extends StatefulWidget {
  @override
  _SingleChildScrollViewContainerGridViewLoadMoreState createState() =>
      _SingleChildScrollViewContainerGridViewLoadMoreState();
}

class _SingleChildScrollViewContainerGridViewLoadMoreState extends State<SingleChildScrollViewContainerGridViewLoadMore> {
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
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              height: 400, // Fixed height for the Container
              padding: const EdgeInsets.all(8.0),
              child: NotificationListener<ScrollNotification>(
                onNotification: (ScrollNotification scrollInfo) {
                  // Detect when the user has scrolled to the bottom
                  if (!isLoading &&
                      scrollInfo.metrics.pixels ==
                          scrollInfo.metrics.maxScrollExtent) {
                    fetchMoreItems();
                  }
                  return false;
                },
                child: GridView.builder(
                  physics: const AlwaysScrollableScrollPhysics(), // Enable scrolling within the GridView
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
            const SizedBox(height: 20), // Example additional content
            const Text("Other content below the GridView"),
            Container(
              height: 1000,
              decoration: const BoxDecoration(color: Colors.amberAccent),
            ),
            const Text("Other content below the GridView"),
          ],
        ),
      ),
    );
  }
}

