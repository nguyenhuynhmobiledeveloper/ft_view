import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class DatePicker extends StatefulWidget {
  const DatePicker({super.key});

  @override
  State<DatePicker> createState() => _DatePickerState();
}

class _DatePickerState extends State<DatePicker> {

Future<void> _selectDate(BuildContext context) async {
  DateTime? picked = await showDatePicker(
    context: context,
    initialDate: DateTime.now(),
    firstDate: DateTime(2000),
    lastDate: DateTime(2101),
  );
  if (picked != null) {
    print("Ngày đã chọn: ${picked.toLocal()}");
  }
}


void _showCupertinoDatePicker(BuildContext context) {
  showCupertinoModalPopup(
    context: context,
    builder: (BuildContext builder) {
      return Container(
        height: 250,
        color: Colors.white,
        child: Column(
          children: [
            Expanded(
              child: CupertinoDatePicker(
                mode: CupertinoDatePickerMode.date,
                initialDateTime: DateTime.now(),
                onDateTimeChanged: (DateTime newDate) {
                  print("Ngày đã chọn: $newDate");
                },
              ),
            ),
            CupertinoButton(
              child: Text('Chọn'),
              onPressed: () => Navigator.pop(context),
            )
          ],
        ),
      );
    },
  );
}

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      appBar: AppBar(title: const Text('Date picker')),
      body: Column(
        children: [
          InkWell(
            onTap: () => {_selectDate(context)},
            child: Container(
              height: 100,
              width: 100,
              child:const Text('Open DatePicker'),
            ),
          )
        ],
      ),
    );
  }
}