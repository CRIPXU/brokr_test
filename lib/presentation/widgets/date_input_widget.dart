import 'package:flutter/material.dart';
import 'package:flutter_datetime_picker_plus/flutter_datetime_picker_plus.dart';

class DateInputWidget extends StatefulWidget {
  final TextEditingController controller;
  final String hintText;
  final String labelText;

  DateInputWidget({
    required this.controller,
    required this.hintText,
    required this.labelText,
  });

  @override
  _DateInputWidgetState createState() => _DateInputWidgetState();
}

class _DateInputWidgetState extends State<DateInputWidget> {
  DateTime selectedDate = DateTime.now();

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(10),
      ),
      child: GestureDetector(
        onTap: () {
          _showDatePicker(context);
        },
        child: AbsorbPointer(
          child: TextField(
            controller: widget.controller,
            decoration: InputDecoration(
              border: const OutlineInputBorder(
                borderRadius: BorderRadius.all(Radius.circular(10)),
              ),
              hintText: widget.hintText,
              helperMaxLines: 45,
              suffixStyle: TextStyle(fontSize: 0),
              errorMaxLines: 45,
              errorStyle: TextStyle(fontSize: 0),
              hintMaxLines: 1,
              floatingLabelBehavior: FloatingLabelBehavior.always,
              labelText: widget.labelText,
              labelStyle: TextStyle(color: Colors.grey),
              contentPadding: const EdgeInsets.symmetric(horizontal: 22),
            ),
          ),
        ),
      ),
    );
  }

  void _showDatePicker(BuildContext context) {
    DatePicker.showDatePicker(
      context,
      showTitleActions: true,
      //minTime: DateTime(2020, 5, 5, 20, 50),
      //maxTime: DateTime(2020, 6, 7, 05, 09),
      theme: DatePickerTheme(
        backgroundColor: Colors.white,
        headerColor: Colors.white,
      ),
      onConfirm: (DateTime dateTime) {
        setState(() {
          selectedDate = dateTime;
          widget.controller.text =
          "${selectedDate.month}-${selectedDate.day}-${selectedDate.year}";
        });
      },
      currentTime: DateTime.now(),
      locale: LocaleType.en,
    );
  }
}
