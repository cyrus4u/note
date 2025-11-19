import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:note_application_6/constants/custom_color.dart';
import 'package:note_application_6/screens/home_screen.dart';
import 'package:note_application_6/data/task.dart';
import 'package:note_application_6/data/task_type.dart';
import 'package:note_application_6/widgets/task_type_item.dart';
import 'package:note_application_6/utility/utility.dart';
import 'package:time_pickerr/time_pickerr.dart';

class EditTaskScreen extends StatefulWidget {
  EditTaskScreen({super.key, required this.task});
  Task task;

  @override
  State<EditTaskScreen> createState() => _EditTaskScreenState();
}

class _EditTaskScreenState extends State<EditTaskScreen> {
  FocusNode negahban1 = FocusNode();
  FocusNode negahban2 = FocusNode();
  TextEditingController? controllerTaskTitle;
  TextEditingController? controllerTaskSubTitle;
  DateTime? _time;
  int _selectedTaskTypeItem = 0;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    controllerTaskTitle = TextEditingController(text: widget.task.title);
    controllerTaskSubTitle = TextEditingController(text: widget.task.subTitle);
    negahban1.addListener(() {
      setState(() {});
    });
    negahban2.addListener(() {
      setState(() {});
    });
    var index = getTaskTypeList().indexWhere((element) {
      return element.taskTypeEnum == widget.task.taskType.taskTypeEnum;
    });
    _selectedTaskTypeItem = index;
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
                    String taskTitle = controllerTaskTitle!.text;
                    String taskSubTitle = controllerTaskSubTitle!.text;
                    if (_time == null) {
                      ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(content: Text("لطفاً زمان را انتخاب کنید")),
                      );
                      return;
                    }
                    editTask(taskTitle, taskSubTitle);
                    Navigator.of(context).pop();
                  },
                  child: Text(
                    'ویرایش کردن تسک',
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

  editTask(String taskTitle, String taskSubTitle) {
    widget.task.title = taskTitle;
    widget.task.subTitle = taskSubTitle;
    widget.task.time = _time!;
    widget.task.taskType = getTaskTypeList()[_selectedTaskTypeItem];
    // print("Added: ${widget.task.taskType.title}");
    widget.task.save();
  }
}

