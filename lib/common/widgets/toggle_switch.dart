import 'package:animated_toggle_switch/animated_toggle_switch.dart';
import 'package:flutter/material.dart';
import 'package:ifit/common/utils/app_styles.dart';

class ToggleSwitch extends StatefulWidget {
  const ToggleSwitch({super.key,});

  @override
  State<ToggleSwitch> createState() => _ToggleSwitchState();
}

class _ToggleSwitchState extends State<ToggleSwitch> {
  bool positive = false; // Added variable to track the toggle state

  @override
  Widget build(BuildContext context) {
    return CustomAnimatedToggleSwitch<bool>(
      current: positive,
      values: const [false, true],
      spacing: 0.0,
      indicatorSize: const Size.square(30.0),
      animationDuration: const Duration(milliseconds: 200),
      animationCurve: Curves.linear,
      onChanged: (b) => setState(() => positive = b),
      iconBuilder: (context, local, global) {
        return const SizedBox();
      },
      cursors: const ToggleCursors(defaultCursor: SystemMouseCursors.click),
      onTap: (_) => setState(() => positive = !positive),
      iconsTappable: false,
      wrapperBuilder: (context, global, child) {
        final Color switchColor = positive ? Styles.secondColor : Colors.grey; // Define the color

        return Stack(
          alignment: Alignment.center,
          children: [
            Positioned(
              left: 10.0,
              right: 10.0,
              height: 20.0,
              child: DecoratedBox(
                decoration: BoxDecoration(
                  color: switchColor, // Use the defined color
                  borderRadius: const BorderRadius.all(
                    Radius.circular(50.0),
                  ),
                ),
              ),
            ),
            child,
          ],
        );
      },
      foregroundIndicatorBuilder: (context, global) {
        return SizedBox.fromSize(
          size: const Size(8, 8),
          child: const DecoratedBox(
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.all(
                Radius.circular(50.0),
              ),
              boxShadow: [
                BoxShadow(
                  color: Colors.black38,
                  spreadRadius: 0.05,
                  blurRadius: 1.1,
                  offset: Offset(0.0, 0.8),
                ),
              ],
            ),
          ),
        );
      },

    );
  }
}
