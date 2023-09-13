import 'package:flutter/material.dart';
import 'package:ifit/common/utils/app_styles.dart';

class CheckBoxList extends StatefulWidget {
  final List<String> choices;
  final String questionText;

  const CheckBoxList({
    Key? key,
    required this.choices,
    required this.questionText,

  }) : super(key: key);

  @override
  State<CheckBoxList> createState() => _CheckBoxListState();
}

class _CheckBoxListState extends State<CheckBoxList> {

  List<bool> isCheckedList = [];

  @override
  void initState() {
    super.initState();
    isCheckedList = List<bool>.generate(widget.choices.length, (index) => false);
  }

  @override
  void didUpdateWidget(CheckBoxList oldWidget) {
    super.didUpdateWidget(oldWidget);
    if (widget.choices.length != oldWidget.choices.length) {
      // The number of choices has changed, regenerate isCheckedList
      isCheckedList = List<bool>.generate(widget.choices.length, (index) => false);
    }
  }
  
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          widget.questionText, 
          style:  Styles.text2.copyWith(
            fontWeight: FontWeight.bold),
          ),
        for (int index = 0; index < widget.choices.length; index++)
          CheckboxListTile(
            activeColor: Styles.primaryColor, // Use your desired checkbox color 
            title: Text(
              widget.choices[index],
              style: Styles.text2,
            ),
             dense: true, 
            value: isCheckedList[index],
            onChanged: (bool? value) {
              setState(() {
                isCheckedList[index] = value!;
              });
            },
          ),
      ],
    );
  }
}