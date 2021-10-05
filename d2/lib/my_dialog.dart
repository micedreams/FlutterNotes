import 'package:flutter/material.dart';

class MyDialog extends StatefulWidget {
  const MyDialog({required this.onValueChange, required this.initialValue});

  final String initialValue;
  final void Function(String) onValueChange;

  @override
  State createState() => MyDialogState();
}

class MyDialogState extends State<MyDialog> {
  late String _selectedId;

  @override
  void initState() {
    super.initState();
    _selectedId = widget.initialValue;
  }

  @override
  Widget build(BuildContext context) {
    return SimpleDialog(
      title: const Text("New Dialog"),
      children: <Widget>[
        Container(
            padding: const EdgeInsets.all(10.0),
            child: DropdownButton<String>(
              hint: const Text("Pick a thing"),
              value: _selectedId,
              onChanged: (String? value) {
                setState(() {
                  _selectedId = value!;
                });
                widget.onValueChange(value!);
              },
              items:
                  <String>['One', 'Two', 'Three', 'Four'].map((String value) {
                return DropdownMenuItem<String>(
                  value: value,
                  child: Text(value),
                );
              }).toList(),
            )),
      ],
    );
  }
}
