import 'package:flutter/material.dart';
import 'dart:async';
import 'package:intl/intl.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  late String? _timeString;
  ValueNotifier<String> valueNotifier = ValueNotifier("");

  @override
  void initState() {
    _timeString = _formatDateTime(DateTime.now());
    Timer.periodic(const Duration(seconds: 1), (Timer t) => _getTime());
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Center(
        child: Text(
          '$_timeString',
          style: Theme.of(context).textTheme.headline4,
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          valueNotifier.value = _timeString!;
          showDialog(
              context: context,
              builder: (BuildContext context) {
                return SimpleDialog(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(8),
                  ),
                  children: <Widget>[
                    ValueListenableBuilder(
                      valueListenable: valueNotifier,
                      builder: (context, value, child) {
                        return Center(
                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Text(
                              value.toString(),
                              style: const TextStyle(
                                fontWeight: FontWeight.w500,
                                letterSpacing: 2.5,
                                fontSize: 48,
                              ),
                            ),
                          ),
                        );
                      },
                    ),
                  ],
                );
              });
        },
        child: const Icon(Icons.add),
      ),
    );
  }

  void _getTime() {
    final DateTime now = DateTime.now();
    final String formattedDateTime = _formatDateTime(now);
    setState(() {
      _timeString = formattedDateTime;
    });
  }

  String _formatDateTime(DateTime dateTime) {
    return DateFormat('hh:mm:ss').format(dateTime);
  }
}
