import 'package:flutter/material.dart';

class demo_SingleChildScrollView_GridView_loadmore extends StatefulWidget {
  const demo_SingleChildScrollView_GridView_loadmore({super.key});

  @override
  _demo_SingleChildScrollView_GridView_loadmoreState createState() =>
      _demo_SingleChildScrollView_GridView_loadmoreState();
}

class _demo_SingleChildScrollView_GridView_loadmoreState extends State<demo_SingleChildScrollView_GridView_loadmore> {
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
        controller: _scrollController, // Attach controller  // Gắn hàm lắng nghe ở trong SingleChildScrollView
        child: Column(
          children: [
            GridView.builder(
              physics: const NeverScrollableScrollPhysics(),  // Vô Hiệu hóa hoàn toàn khả năng cuộn để có thể nhận hiệu ứng cuộn của SingleChildScrollView
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
