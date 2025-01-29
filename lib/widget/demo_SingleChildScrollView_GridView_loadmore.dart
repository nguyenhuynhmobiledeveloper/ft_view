import 'package:flutter/material.dart';

class LoadMoreInNestedGridView extends StatefulWidget {
  const LoadMoreInNestedGridView({super.key});

  @override
  _LoadMoreInNestedGridViewState createState() =>
      _LoadMoreInNestedGridViewState();
}

class _LoadMoreInNestedGridViewState extends State<LoadMoreInNestedGridView> {
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
    if (_scrollController.position.pixels >=
            _scrollController.position.maxScrollExtent - 100 &&
        !isLoading) {
      _loadMoreItems();
    }
    print("abc ");
  }

  Future<void> _loadMoreItems() async {
    if (isLoading) return;

    setState(() {
      isLoading = true;
    });

    // Simulate a network or database delay
    await Future.delayed(Duration(seconds: 2));

    setState(() {
      items.addAll(List.generate(20, (index) => items.length + index));
      isLoading = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title:const Text('GridView Load More'),
      ),
      body: SingleChildScrollView(
        controller: _scrollController, // Attach controller
        child: Column(
          children: [
            GridView.builder(
              physics: const NeverScrollableScrollPhysics(),
              shrinkWrap: true,
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                crossAxisSpacing: 8.0,
                mainAxisSpacing: 8.0,
              ),
              itemCount: items.length,
              itemBuilder: (context, index) {
                return Card(
                  child: Center(
                    child: Text('Item ${items[index]}'),
                  ),
                );
              },
            ),
            if (isLoading)
             const Padding(
                padding:  EdgeInsets.all(16.0),
                child: CircularProgressIndicator(),
              ),
          ],
        ),
      ),
    );
  }
}
