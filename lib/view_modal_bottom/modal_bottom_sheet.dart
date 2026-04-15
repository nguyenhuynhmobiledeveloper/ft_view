import 'package:flutter/material.dart';
import 'package:modal_bottom_sheet/modal_bottom_sheet.dart';





class modal_bottom_sheet extends StatelessWidget {
  void _showCustomBottomSheet(BuildContext context) {
    showCupertinoModalBottomSheet(
      context: context,
      builder: (context) =>  SizedBox(
        height: 300, // Specify the desired height
        child: BottomSheetContent(),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Modal Bottom Sheet Example")),
      body: Column(
        children: [
          ElevatedButton(
          onPressed: () => _showCustomBottomSheet(context),
          child: Text("Show Bottom Sheet"),
        ),
        
        ElevatedButton(
          onPressed: () => _showFullScreenModal(context),
          child: Text("Show full Bottom Sheet"),
        ),
        ]
      ),
    );
  }
}

void _showFullScreenModal(BuildContext context) {
  showCupertinoModalBottomSheet(
    context: context,
    expand: true, // Makes it full-screen
    builder: (context) => FullScreenContent(),
  );
}

// Dạng modal bottom sheet full màn hình
class FullScreenContent extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Full Screen Modal')),
      body: Center(child: Text('This is a full-screen modal!')),
    );
  }
}

class BottomSheetContent extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Material(

      child: SafeArea(
        top: false,
        child: ListView(
          padding: EdgeInsets.all(16.0),
          children: [
            ListTile(
              leading: Icon(Icons.person),
              title: Text('Profile'),
              onTap: () => Navigator.pop(context),
            ),
            ListTile(
              leading: Icon(Icons.settings),
              title: Text('Settings'),
              onTap: () => Navigator.pop(context),
            ),
            ListTile(
              leading: Icon(Icons.logout),
              title: Text('Logout'),
              onTap: () => Navigator.pop(context),
            ),
          ],
        ),
      ),
    );
  }
}
