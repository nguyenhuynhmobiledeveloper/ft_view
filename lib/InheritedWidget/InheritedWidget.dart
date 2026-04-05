import 'package:flutter/material.dart';




class MyAppInheritedWidget extends StatelessWidget {
  const MyAppInheritedWidget({super.key});
  // Widget này là gốc cho ứng dụng của bạn

  @override // Viết lại method : phương thức , Property : thuộc tính
  Widget build(BuildContext context) {
  return MaterialApp(
      home: MyHomePage(isLoading: false, counter: 0, 
       child: MyCenterWidget(), // code thêm dòng này fix muón cha rebuild nhưng con không bị rebuild lại 
      ),
    );
  }
}


class MyHomePage extends StatefulWidget {
  final bool isLoading;
  final int counter;
    final Widget child;  // code thêm dòng này

  const MyHomePage({
    required this.isLoading,
    required this.counter,
    required this.child,  // code thêm dòng này
  });

  @override
  State<MyHomePage> createState() {
    return MyHomePageState();
  }
}

class MyHomePageState extends State<MyHomePage> {
  late bool _isLoading;
  late int _counter;

  @override
  void initState() {
    super.initState();
    _isLoading = widget.isLoading;
    _counter = widget.counter;
  }

  @override
  Widget build(BuildContext context) {
    print('rebuild MyHomePage');
    return Scaffold(
      appBar: AppBar(title: Text('InheritedWidget Demo')),
      body: MyInheritedWidget(
        isLoading: _isLoading,
        counter: _counter,
        // child: MyCenterWidget(),  // Widget con của InheritedWidget -- sử dụng state của widget cha mà không thông qua Contructor 
          child: widget.child,          // code thêm dòng này fix muón cha rebuild nhưng con không bị rebuild lại 
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: onFloatingButtonClicked,
      ),
    );
  }

  void onFloatingButtonClicked() {
    print('Button clicked!. Call setState method');
    setState(() {
      _counter++;
      if (_counter % 2 == 0) {
        _isLoading = false;
      } else {
        _isLoading = true;
      }
    });
  }
}


// Lấy giá trị của Widget cha mà không thông qua Constructor 
class CounterWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    print('rebuild CounterWidget');
    final myInheritedWidget = MyInheritedWidget.of(context);

    if (myInheritedWidget == null) {
      return Text('MyInheritedWidget was not found');
    }

    return myInheritedWidget.isLoading
        ? CircularProgressIndicator()
        : Text('${myInheritedWidget.counter}');
  }
}

// Widget trung gian cũng không cần constructor để hứng rồi truyền xuống cho thằng con 
class MyCenterWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    print('rebuild MyCenterWidget');
    return Center(
      child: CounterWidget(),
    );
  }
}

// Tạo ra 1 cái InheritedWidget : nơi chứa data và các widget con có thể trở tới để gọi lấy các state 1 cách dễ dàng 
// thông qua MyInheritedWidget.of(context);
class MyInheritedWidget extends InheritedWidget {
  final int counter;
  final bool isLoading;
  final Widget child;

  MyInheritedWidget({
    required this.isLoading,
    required this.counter,
    required this.child,
  }) : super(child: child);

  @override
  bool updateShouldNotify(MyInheritedWidget oldWidget) {
    // return false;
    return isLoading != oldWidget.isLoading || counter != oldWidget.counter;
}


  

  static MyInheritedWidget? of(BuildContext context) {
    return context.dependOnInheritedWidgetOfExactType<MyInheritedWidget>();
  }
}


/**
 Hàm updateShouldNotify được gọi ngay sau khi InheritedWidget bị rebuild.
  Nếu hàm updateShouldNotify return true thì một khi InheritedWidget rebuild, 
  nó cũng bắt các widget con đang phụ thuộc vào nó phải rebuild. 
  Ngược lại, nếu hàm updateShouldNotify return false thì nó sẽ không rebuild mấy thằng con phụ thuộc nó. 
  Như thế nào được gọi là phụ thuộc?. Các widget con của MyInheritedWidget, 
  nếu sử dụng hàm MyInheritedWidget.of(context) thì ta sẽ nói Widget đó sẽ phụ thuộc vào MyInheritedWidget.
 */