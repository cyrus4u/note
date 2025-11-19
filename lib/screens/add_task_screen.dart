import 'dart:ffi';

import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:note_application_6/constants/custom_color.dart';
import 'package:note_application_6/screens/home_screen.dart';
import 'package:note_application_6/data/task.dart';
import 'package:note_application_6/data/task_type.dart';
import 'package:note_application_6/widgets/task_type_item.dart';
import 'package:note_application_6/utility/utility.dart';
import 'package:time_pickerr/time_pickerr.dart';

class AddTaskScreen extends StatefulWidget {
  const AddTaskScreen({super.key});

  @override
  State<AddTaskScreen> createState() => _AddTaskScreenState();
}

class _AddTaskScreenState extends State<AddTaskScreen> {
  FocusNode negahban1 = FocusNode();
  FocusNode negahban2 = FocusNode();
  final TextEditingController controllerTaskTitle = TextEditingController();
  final TextEditingController controllerTaskSubTitle = TextEditingController();
  DateTime? _time;
  int _selectedTaskTypeItem = 0;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    negahban1.addListener(() {
      setState(() {});
    });
    negahban2.addListener(() {
      setState(() {});
    });
  }

  final box = Hive.box<Task>('taskBox');

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Center(
          child: SingleChildScrollView(
            child: Column(
              children: [
                SizedBox(height: 10),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 44),
                  child: Directionality(
                    textDirection: TextDirection.rtl,
                    child: TextField(
                      controller: controllerTaskTitle,
                      focusNode: negahban1,
                      decoration: InputDecoration(
                        contentPadding: EdgeInsets.symmetric(
                          horizontal: 15,
                          vertical: 15,
                        ),
                        labelText: 'عنوان تسک',
                        labelStyle: TextStyle(
                          fontSize: 20,
                          color: negahban1.hasFocus
                              ? CustomColor.green
                              : CustomColor.grey,
                        ),
                        enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.all(Radius.circular(15)),
                          borderSide: BorderSide(
                            color: Color(0xffC5C5C5),
                            width: 3.0,
                          ),
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.all(Radius.circular(15)),
                          borderSide: BorderSide(
                            width: 3,
                            color: CustomColor.green,
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
                SizedBox(height: 50),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 44),
                  child: Directionality(
                    textDirection: TextDirection.rtl,
                    child: TextField(
                      controller: controllerTaskSubTitle,
                      maxLines: 2,
                      focusNode: negahban2,
                      decoration: InputDecoration(
                        contentPadding: EdgeInsets.symmetric(
                          horizontal: 15,
                          vertical: 15,
                        ),
                        labelText: 'توضیحات تسک',
                        labelStyle: TextStyle(
                          fontSize: 20,
                          color: negahban2.hasFocus
                              ? CustomColor.green
                              : CustomColor.grey,
                        ),
                        enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.all(Radius.circular(15)),
                          borderSide: BorderSide(
                            color: Color(0xffC5C5C5),
                            width: 3.0,
                          ),
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.all(Radius.circular(15)),
                          borderSide: BorderSide(
                            width: 3,
                            color: CustomColor.green,
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
                SizedBox(height: 10),
                Directionality(
                  textDirection: TextDirection.rtl,
                  child: CustomHourPicker(
                    title: 'انتخاب زمان',
                    titleStyle: TextStyle(
                      color: CustomColor.green,
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                    ),
                    negativeButtonStyle: TextStyle(
                      color: Colors.red,
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                    ),
                    positiveButtonStyle: TextStyle(
                      color: CustomColor.green,
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                    ),
                    negativeButtonText: 'حذف کن',
                    positiveButtonText: 'انتخاب زمان',
                    elevation: 2,
                    onPositivePressed: (context, time) {
                      _time = time;
                    },
                    onNegativePressed: (context) {},
                  ),
                ),
                Container(
                  height: 200,
                  child: ListView.builder(
                    scrollDirection: Axis.horizontal,
                    itemCount: getTaskTypeList().length,
                    itemBuilder: (context, index) {
                      return InkWell(
                        onTap: () {
                          setState(() {
                            _selectedTaskTypeItem = index;
                          });
                        },
                        child: TaskTypeItemList(
                          taskType: getTaskTypeList()[index],
                          index: index,
                          selectedItemList: _selectedTaskTypeItem,
                        ),
                      );
                    },
                  ),
                ),
                ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: CustomColor.green,
                  ),
                  onPressed: () {
                    String taskTitle = controllerTaskTitle.text;
                    String taskSubTitle = controllerTaskSubTitle.text;
                    if (_time == null) {
                      ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(content: Text("لطفاً زمان را انتخاب کنید")),
                      );
                      return;
                    }

                    addTask(taskTitle, taskSubTitle);
                    Navigator.of(context).pop();
                  },
                  child: Text(
                    'اضافه کردن تسک',
                    style: Theme.of(context).textTheme.headlineMedium!.copyWith(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  addTask(String taskTitle, String taskSubTitle) {
    var task = Task(
      title: taskTitle,
      subTitle: taskSubTitle,
      time: _time!,
      taskType: getTaskTypeList()[_selectedTaskTypeItem],
    );
    // print("Added: ${task.taskType.title}");
    box.add(task);
  }
}

