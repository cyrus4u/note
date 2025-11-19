import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:note_application_6/add_task_screen.dart';
import 'package:note_application_6/constants/custom_color.dart';
import 'package:note_application_6/home_screen.dart';
import 'package:note_application_6/task.dart';
import 'package:note_application_6/task_type.dart';
import 'package:note_application_6/type_enum.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Hive.initFlutter();
  Hive.registerAdapter(TaskAdapter());
  Hive.registerAdapter(TaskTypeAdapter());
  Hive.registerAdapter(TaskTypeEnumAdapter());

  await Hive.openBox<Task>('taskBox');

  runApp(Application());
}

class Application extends StatelessWidget {
  const Application({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        fontFamily: 'SM',
        textTheme: TextTheme(
          headlineMedium: TextStyle(color: CustomColor.white, fontSize: 16),
        ),
      ),
      home: HomeScreen(),
    );
  }
}
