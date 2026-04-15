import 'package:flutter/material.dart';

class demo_SingleChildScrollView_loadmore extends StatefulWidget {
  @override
  _demo_SingleChildScrollView_loadmoreState createState() => _demo_SingleChildScrollView_loadmoreState();
}

// Khi làm việc với dữ liệu lớn, CustomScrollView hoặc ListView với SliverList có thể hiệu quả hơn.

class _demo_SingleChildScrollView_loadmoreState extends State<demo_SingleChildScrollView_loadmore> {
  final List<int> _items = List.generate(20, (index) => index);
  final ScrollController _scrollController = ScrollController();
  bool _isLoading = false;

  @override
  void initState() {
    super.initState();

// Lắng nghe sự kiện cuộn tới cuối cùng của ScrollView
    // Gắn listener để bắt sự kiện khi cuộn đến cuối 
    _scrollController.addListener(() {
      if (_scrollController.position.pixels ==
              _scrollController.position.maxScrollExtent &&
          !_isLoading) {
        _loadMoreItems();
      }
    });
  }

  Future<void> _loadMoreItems() async {
    setState(() {
      _isLoading = true;
    });

    // Giả lập thời gian load dữ liệu
    await Future.delayed(const Duration(seconds: 1));

    final List<int> newItems =
        List.generate(10, (index) => _items.length + index);
    setState(() {
      _items.addAll(newItems);
      _isLoading = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Load More Example"),
      ),
      body: SingleChildScrollView(
        controller: _scrollController,
        child: Column(
          children: [
            ListView.builder(
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              itemCount: _items.length,
              itemBuilder: (context, index) {
                return ListTile(
                  title: Text('Item ${_items[index]}'),
                );
              },
            ),
            if (_isLoading)
              const Padding(
                padding: EdgeInsets.all(16.0),
                child: CircularProgressIndicator(),
              ),
          ],
        ),
      ),
    );
  }

  @override
  void dispose() {
    _scrollController.dispose();
    super.dispose();
  }
}
