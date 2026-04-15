import 'package:flutter/material.dart';
import 'package:modal_bottom_sheet/modal_bottom_sheet.dart';




class modal_bottom_sheet_scroll extends StatelessWidget {
  void _showCustomBottomSheet(BuildContext context) {
    showMaterialModalBottomSheet(
      context: context,
      builder: (context) => Container(
        height: 500, // Set the desired height
        padding: EdgeInsets.all(16),
        child: BottomSheetContent(),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Modal Bottom Sheet Example")),
      body: Center(
        child: ElevatedButton(
          onPressed: () => _showCustomBottomSheet(context),
          child: Text("Show Bottom Sheet"),
        ),
      ),
    );
  }
}

class BottomSheetContent extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          "Static Header",
          style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
        ),
        SizedBox(height: 10),
        Text("This section is static and doesn't scroll."),
        SizedBox(height: 20),
        // Chỉ được cuộn ở trong 1 kích thước giới hạn
        Expanded(
          child: SingleChildScrollView(
            controller: ModalScrollController.of(context),
            child: Column(
              children: List.generate(
                20,
                (index) => ListTile(
                  leading: Icon(Icons.list),
                  title: Text('Scrollable Item ${index + 1}'),
                  onTap: () => print('Tapped on Item ${index + 1}'),
                ),
              ),
            ),
          ),
        ),
        SizedBox(height: 20),
        Text(
          "Static Footer",
          style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
        ),
        Text("This section is also static."),
      ],
    );
  }
}
