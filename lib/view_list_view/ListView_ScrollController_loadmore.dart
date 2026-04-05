import 'package:flutter/material.dart';




class ListView_ScrollController_loadmore extends StatefulWidget {
  const ListView_ScrollController_loadmore({super.key});

  @override
  _ListView_ScrollController_loadmoreState createState() => _ListView_ScrollController_loadmoreState();
}

class _ListView_ScrollController_loadmoreState extends State<ListView_ScrollController_loadmore> {

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


  late ScrollController _scrollController; // Biến ScrollController để kiểm soát và lắng nghe việc cuộn View

  @override
  void initState() {
    super.initState();
     _scrollController = ScrollController();  // Gán giá trị cho biến ScrollController

    _scrollController.addListener(() {   // Gán hàm lắng nghe cho thao tác cuộn --> cuộn tới cuối cùng thì load thêm Call API load thêm data
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
        controller: _scrollController,   // Đưa biến _scrollController vào thuộc tính controller của ListView.builder
        itemCount: _items.length + 1, // Add 1 for the loading indicator + thêm số lượng 1 cho View Loading indicator

        itemBuilder: (context, index) {
          if (index < _items.length) {
            return ListTile(
              title: Text('Item ${_items[index]}'),
            );
          } else {   // Hiển thị View loading indicator
            // Display loading indicator at the end
            if (_isLoading) {  // Nếu đang load thì hiện CircularProgressIndicator(),
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


