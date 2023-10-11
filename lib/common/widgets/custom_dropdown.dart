
import 'package:flutter/material.dart';
import 'package:ifit/common/utils/app_styles.dart';

class CustomDropdown extends StatefulWidget {
  final TextStyle? textStyle;
  final List<String> items;
  final String? selectedValue;
  final void Function(String?) onChanged;
  final String? hintText; 

  const CustomDropdown({
    Key? key,
    required this.items,
    required this.onChanged,
    this.selectedValue, // Make selectedValue optional
    this.hintText,
    this.textStyle, // Make hintText optional
  }) : super(key: key);

  @override
  State<CustomDropdown> createState() => _CustomDropdownState();
}

class _CustomDropdownState extends State<CustomDropdown> {
  String? _currentValue;

  @override
  void initState() {
    super.initState();
    _currentValue = widget.selectedValue;
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 10),
      height: 30,
      decoration: BoxDecoration(
        color: Styles.secondColor.withOpacity(0.6),
        borderRadius: BorderRadius.circular(15),
      ),
      
      child: DropdownButtonHideUnderline(
        child: DropdownButton(
          items: widget.items
              .map((name) => DropdownMenuItem(
                    value: name,
                    child: Text(
                      name,
                      style: widget.textStyle ?? Styles.text15bold,
                    ),
                  ))
              .toList(),
          onChanged: (newValue) {
            setState(() {
              _currentValue = newValue;
              widget.onChanged(newValue);
            });
          },
          icon: const Icon(Icons.expand_more, color: Colors.black,),
          value: _currentValue,
          hint: widget.hintText != null
              ? Text(
                  widget.hintText!,
                  textAlign: TextAlign.center,
                  style: widget.textStyle ?? Styles.text15bold,
                )
              : null, // Use the provided hintText if not null
        ),
      ),
    );
  }
}
