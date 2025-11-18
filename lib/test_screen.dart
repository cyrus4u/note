import 'package:flutter/material.dart';

class TestScreen extends StatefulWidget {
  const TestScreen({super.key});

  @override
  State<TestScreen> createState() => _TestScreenState();
}

class _TestScreenState extends State<TestScreen> {
  int value = 0;
  ValueNotifier notifier = ValueNotifier(0);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ValueListenableBuilder(
              valueListenable: notifier,
              builder: (context, value, child) {
                return Text('$value', style: TextStyle(fontSize: 20));
              },
            ),
            ElevatedButton(
              onPressed: () {
                notifier.value = notifier.value + 1;
              },
              child: Text('add', style: TextStyle(fontSize: 20)),
            ),
          ],
        ),
      ),
    );
  }
}
