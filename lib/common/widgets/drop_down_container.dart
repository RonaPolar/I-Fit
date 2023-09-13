import 'package:flutter/material.dart';
import 'package:ifit/common/utils/app_styles.dart';

class DropDownContainer extends StatefulWidget {
  final List<DropdownMenuItem<String>> items;
  final String hintText;
  final IconData icon;
  final void Function(String?) onChanged;
  final String? selectedValue;

  const DropDownContainer({super.key, 
    required this.items,
    required this.hintText,
    required this.icon,
    required this.onChanged,
    this.selectedValue,
    });

  @override
  State<DropDownContainer> createState() => _DropDownContainerState();
}

class _DropDownContainerState extends State<DropDownContainer> {
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Styles.boxtextField,
        borderRadius: BorderRadius.circular(15),
      ),
      child: Row(
        children: [
          Expanded(
            child: DropdownButtonFormField<String>(
              decoration: InputDecoration(
                contentPadding: const EdgeInsets.only(top: 13, right: 10),
                border: InputBorder.none,
                prefixIcon: Icon(widget.icon),
              ),
              value: widget.selectedValue,
              items: widget.items,
              hint: Text(
                widget.hintText,
                style: TextStyle(color: Styles.fadeTextColor), 
              ),
              onChanged: (newValue) {
                setState(() {
                  widget.onChanged(newValue);
                });
              },
            ),
          ),
        ],
      ),
    );
  }
}
