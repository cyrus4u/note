import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:msh_checkbox/msh_checkbox.dart';
import 'package:note_application_6/constants/custom_color.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  String inputText = '';
  TextEditingController controller = TextEditingController();
  bool isChecked = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: CustomColor.grey,
      body: Center(
        child: Container(
          margin: EdgeInsets.symmetric(horizontal: 12),
          height: 132,
          width: double.infinity,
          decoration: BoxDecoration(
            color: CustomColor.white,
            borderRadius: BorderRadius.circular(15),
          ),
          child: Padding(
            padding: const EdgeInsets.all(12.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                MSHCheckbox(
                  size: 32,
                  value: isChecked,
                  colorConfig: MSHColorConfig.fromCheckedUncheckedDisabled(
                    checkedColor: CustomColor.green,
                  ),
                  style: MSHCheckboxStyle.fillScaleCheck,
                  onChanged: (selected) {
                    setState(() {
                      isChecked = selected;
                    });
                  },
                ),
                Spacer(),
                Column(
                  children: [
                    Text('data'),
                    Text('data'),
                    Row(
                      children: [
                        Container(
                          width: 90,
                          height: 28,
                          decoration: BoxDecoration(
                            color: CustomColor.green,
                            borderRadius: BorderRadius.circular(18),
                          ),
                          child: Padding(
                            padding: const EdgeInsets.symmetric(
                              vertical: 6.0,
                              horizontal: 12,
                            ),
                            child: Row(
                              children: [
                                Text('10:30'),
                                SizedBox(width: 10),
                                Image.asset('images/icon_time.png'),
                              ],
                            ),
                          ),
                        ),
                       SizedBox(width: 10,),
                        Container(
                          width: 90,
                          height: 28,
                          decoration: BoxDecoration(
                            color: CustomColor.greenLight,
                            borderRadius: BorderRadius.circular(18),
                          ),
                          child: Padding(
                            padding: const EdgeInsets.symmetric(
                              vertical: 6.0,
                              horizontal: 12,
                            ),
                            child: Row(
                              children: [
                                Text(
                                  'ویرایش',
                                  style: TextStyle(color: CustomColor.green),
                                ),
                                SizedBox(width: 8),
                                Image.asset('images/icon_edit.png'),
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
                Image.asset('images/workout.png'),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
