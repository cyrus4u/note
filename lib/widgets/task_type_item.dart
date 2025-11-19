import 'package:flutter/material.dart';
import 'package:note_application_6/constants/custom_color.dart';
import 'package:note_application_6/data/task_type.dart';

class TaskTypeItemList extends StatelessWidget {
  TaskTypeItemList({
    super.key,
    required this.taskType,
    required this.index,
    required this.selectedItemList,
  });
  TaskType taskType;
  int index;
  int selectedItemList;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: (selectedItemList == index)
            ? CustomColor.green
            : CustomColor.white,
        border: Border.all(
          color: (selectedItemList == index)
              ? CustomColor.green
              : CustomColor.grey,
          width: (selectedItemList == index) ? 3 : 2,
        ),
        borderRadius: BorderRadius.circular(15),
      ),
      margin: EdgeInsets.all(8),
      width: 140,
      child: Column(
        children: [
          Image.asset(taskType.image),
          Text(
            taskType.title,
            style: TextStyle(
              fontSize: (selectedItemList == index) ? 20 : 18,
              color: (selectedItemList == index)
                  ? CustomColor.white
                  : Colors.black,
            ),
          ),
        ],
      ),
    );
  }
}
