import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:note_application_6/constants/custom_color.dart';
import 'package:note_application_6/task.dart';
import 'package:note_application_6/task_widget.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  String inputText = '';
  TextEditingController controller = TextEditingController();

  var taskBox = Hive.box<Task>('taskBox');

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: CustomColor.grey,
      body: Center(
        child: ListView.builder(
          itemCount: taskBox.values.length,
          itemBuilder: (context, index) {
            var task = taskBox.values.toList()[index];
            return TaskWidget(task: task);
          },
        ),
      ),
    );
  }
}
