import 'package:d2/my_dialog.dart';
import 'package:flutter/material.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  String? _selectedId;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text("Test"),
        ),
        body: ListView(padding: const EdgeInsets.all(32.0), children: [
          Container(
              padding: const EdgeInsets.all(10.0),
              child: DropdownButton<String>(
                hint: const Text("Pick a thing"),
                value: _selectedId,
                onChanged: (String? value) {
                  setState(() {
                    _selectedId = value!;
                  });
                },
                items:
                    <String>['One', 'Two', 'Three', 'Four'].map((String value) {
                  return DropdownMenuItem<String>(
                    value: value,
                    child: Text(value),
                  );
                }).toList(),
              )),
        ]),
        floatingActionButton: FloatingActionButton(
          child: const Icon(Icons.add),
          tooltip: "New Dialog",
          onPressed: () {
            showDialog(
                context: context,
                builder: (BuildContext context) {
                  return MyDialog(
                    onValueChange: _onValueChange,
                    initialValue: _selectedId!,
                  );
                });
          },
        ));
  }

  void _onValueChange(String value) {
    setState(() {
      _selectedId = value;
    });
  }
}

