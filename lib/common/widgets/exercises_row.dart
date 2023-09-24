import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:ifit/common/utils/app_styles.dart';

class ExercisesRow extends StatelessWidget {
  final Map eObjOrSObj; // Either an exercise or a set object
  final Function(Map obj) onPressed;

  const ExercisesRow({
    Key? key,
    required this.eObjOrSObj,
    required this.onPressed,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    if (eObjOrSObj.containsKey("image")) {
      // It's an exercise
      final eObj = eObjOrSObj as Map<String, dynamic>;
      return Container(
        margin: const EdgeInsets.symmetric(vertical: 8),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(5),
              child: Image.asset(
                eObj["image"].toString(),
                width: 60,
                height: 60,
                fit: BoxFit.cover,
              ),
            ),
            const SizedBox(width: 15),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    eObj["title"].toString(),
                    style: Styles.text2.copyWith(fontWeight: FontWeight.bold),
                  ),
                  Text(
                    eObj["value"].toString(),
                    style: TextStyle(
                      color: Styles.fadeTextColor,
                      fontSize: 12,
                    ),
                  ),
                ],
              ),
            ),
            IconButton(
              onPressed: () => onPressed(eObj),
              icon: const Icon(Icons.navigate_next),
            )
          ],
        ),
      );
    } else if (eObjOrSObj.containsKey("set")) {
      // It's a set
      final sObj = eObjOrSObj as Map<String, dynamic>;
      final exercisesArr = sObj["set"] as List<Map<String, dynamic>>? ?? [];

      return Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisSize: MainAxisSize.min,
        children: [
          const Gap(10),
          Text(
            sObj["name"].toString(),
            style: const TextStyle(
              color: Colors.black,
              fontSize: 16,
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(height: 8),
          ListView.builder(
            padding: EdgeInsets.zero,
            physics: const NeverScrollableScrollPhysics(),
            shrinkWrap: true,
            itemCount: exercisesArr.length,
            itemBuilder: (context, index) {
              final eObj = exercisesArr[index];
              return ExercisesRow(
                eObjOrSObj: eObj,
                onPressed: onPressed,
              );
            },
          ),
        ],
      );
    }

    return Container();
  }
}
