import 'package:flutter/material.dart';

class SearchContainer extends StatelessWidget {
  final TextEditingController controller;
  final String hintText;

  const SearchContainer({super.key, required this.controller, required this.hintText});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: TextField(
            controller: controller,
            decoration: InputDecoration(
              focusedBorder: InputBorder.none,
              enabledBorder: InputBorder.none,
              prefixIcon: const Icon(
                Icons.search, // You can change this to your desired search icon
                size: 25,
              ),
              hintText: hintText,
            ),
          ),
        ),
      ],
    );
  }
}
