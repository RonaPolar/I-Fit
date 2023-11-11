import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:ifit/common/utils/app_styles.dart';
import 'package:ifit/common/widgets/main_button.dart';


class VerificationCodeScreen extends StatefulWidget {
  final void Function() onConfirmPressed;

  const VerificationCodeScreen({super.key, required this.onConfirmPressed});

  @override
  State<VerificationCodeScreen> createState() => _VerificationCodeScreenState();
  
}

class _VerificationCodeScreenState extends State<VerificationCodeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Styles.bgColor,
      body: SingleChildScrollView(
        child: SizedBox(
          height: MediaQuery.of(context).size.height,
          child: Column(
            children: [
              Expanded(
                child: ListView(
                  shrinkWrap: true,
                  children: [
                    Container(
                      padding: const EdgeInsets.all(20),
                      child: Column(
                        children: [
                          Text(
                            'Verification Code',
                            style: Styles.headline25,
                          ),
                          const Gap(30),
                          Align(
                            alignment: Alignment.bottomLeft,
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  'We have sent the code verification to',
                                  style: Styles.text15normal,
                                ),
                                Text(
                                  'jua*********@gmail.com',
                                  style: Styles.text15normal.copyWith(
                                    color: Colors.blue,
                                  ),
                                ),
                              ],
                            ),
                          ),
                          const Gap(10),
                          VerificationTextBox(
                            numberOfFields: 4,
                            fieldWidth: 65.0,
                            fieldSpacing: 20.0,
                            onCodeChanged: (code) {
                              // Handle the OTP code here
                            },
                          ),
                          const Gap(15),
                          Text(
                            'Did\'nt receive yet?',
                            style: Styles.text15normal,
                          ),
                          TextButton(
                            onPressed: () {},
                            child: RichText(
                              text: TextSpan(
                                style: Styles.text15bold,
                                children: const <TextSpan>[
                                  TextSpan(
                                    text: 'Resend',
                                    style: TextStyle(
                                      decoration: TextDecoration.underline,
                                    ),
                                  )
                                ],
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
              Container(
                padding: const EdgeInsets.only(
                  right: 20,
                  left: 20,
                  bottom: 30,
                  top: 20,
                ),
                child: Column(
                  children: [
                    MainButton(
                      title: 'Confirm',
                      onPressed: () {
                        // Call the callback function provided by the parent widget
                        widget.onConfirmPressed();
                      },
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}




//Verification Box of Number/Code
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
