import 'package:flutter/material.dart';

class VerificationTextBox extends StatefulWidget {
  final int numberOfFields;
  final double fieldWidth;
  final double fieldSpacing;
  final ValueChanged<String>? onCodeChanged;

  const VerificationTextBox({
    Key? key,
    required this.numberOfFields,
    required this.fieldWidth,
    required this.fieldSpacing,
    this.onCodeChanged,
  }) : super(key: key);

  @override
  State<VerificationTextBox> createState() => _VerificationTextBoxState();
}

class _VerificationTextBoxState extends State<VerificationTextBox> {
  final List<FocusNode> _focusNodes = [];
  final List<TextEditingController> _controllers = [];

  @override
  void initState() {
    super.initState();

    for (int i = 0; i < widget.numberOfFields; i++) {
      _focusNodes.add(FocusNode());
      _controllers.add(TextEditingController());
    }
  }

  @override
  void dispose() {
    for (int i = 0; i < widget.numberOfFields; i++) {
      _focusNodes[i].dispose();
      _controllers[i].dispose();
    }
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: List.generate(widget.numberOfFields, (index) {
        return Container(
          width: widget.fieldWidth,
          margin: EdgeInsets.only(right: widget.fieldSpacing),
          child: TextFormField(
            controller: _controllers[index],
            focusNode: _focusNodes[index],
            keyboardType: TextInputType.number,
            textAlign: TextAlign.center,
            maxLength: 1,
            onChanged: (value) {
              if (value.isEmpty) {
                if (index > 0) {
                  _focusNodes[index - 1].requestFocus();
                }
              } else if (value.length == 1) {
                FocusScope.of(context).nextFocus();
              } else {
                if (index < widget.numberOfFields - 1) {
                  _focusNodes[index + 1].requestFocus();
                }
              }
              _updateCode();
            },
            style: Theme.of(context).textTheme.headlineSmall,
            decoration: const InputDecoration(
              counterText: "",
              border: OutlineInputBorder(),
            ),
          ),
        );
      }),
    );
  }

  void _updateCode() {
    String code = '';
    for (int i = 0; i < widget.numberOfFields; i++) {
      code += _controllers[i].text;
    }
    widget.onCodeChanged?.call(code);
  }
}
