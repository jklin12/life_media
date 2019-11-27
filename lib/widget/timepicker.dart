import 'package:flutter/material.dart';
import 'package:datetime_picker_formfield/datetime_picker_formfield.dart';
import 'package:intl/intl.dart';

class BasicDateField extends StatelessWidget {
  final format = DateFormat("yyyy-MM-dd");

  @override
  Widget build(BuildContext context) {
    return Column(crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
      Text(
        'Pilih Tanggal Lahir',
        style: TextStyle(fontSize: 15.0, fontWeight: FontWeight.w500),
      ),
      DateTimeField(
        format: format,
        onShowPicker: (context, currentValue) {
          return showDatePicker(
              context: context,
              firstDate: DateTime(1900),
              initialDate: currentValue ?? DateTime(2000),
              lastDate: DateTime(2100));
        },
      ),
    ]);
  }
}
