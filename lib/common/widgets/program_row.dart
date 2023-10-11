import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:ifit/common/utils/app_styles.dart';
import 'package:ifit/common/widgets/main_button.dart';


//What To Eat and Train Next - Category
class What2Container extends StatefulWidget {
final Map wObj;
final Function(Map obj) onPressed;


  const What2Container({super.key, required this.wObj, required this.onPressed});

  @override
  State<What2Container> createState() => _What2ContainerState();
}

class _What2ContainerState extends State<What2Container> {
  @override
  Widget build(BuildContext context) {
    final String name = widget.wObj["name"].toString();
    final String foodNumber = widget.wObj["foodNumber"]?.toString() ?? '';
    final String workoutNumber = widget.wObj["workoutNumber"]?.toString() ?? '';

    return Container(
      margin: const EdgeInsets.symmetric(vertical: 8, horizontal: 2),
      padding: const EdgeInsets.symmetric(vertical: 15, horizontal: 15),
      decoration: BoxDecoration(
        color: Styles.secondColor.withOpacity(0.6),
        borderRadius: BorderRadius.circular(20),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  name,
                  style: Styles.text15bold
                ),
                if (foodNumber.isEmpty) // Display kcal and categories if available
                Text(
                  "$workoutNumber Programs",
                  style: Styles.normal.copyWith(
                    fontSize: 12,
                  ),
                ),
                if (foodNumber.isNotEmpty) // Display kcal and categories if available
                Text(
                  "$foodNumber Programs",
                  style: Styles.normal.copyWith(
                    fontSize: 12,
                  ),
                ),
                
                const Gap(10),
                SizedBox(
                    width: 110,
                    height: 30,
                      child: MainButton(
                        title: "View More",
                        buttonColor: Styles.primaryColor,
                        onPressed: () => widget.onPressed(widget.wObj),
                      textStyle: Styles.seeMore.copyWith(
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                      ),
                    )),  
              ],
            ),
          ),
          Stack(
            alignment: Alignment.center,
            children: [
              Container(
                width: 70,
                height: 70,
                decoration: BoxDecoration(
                  color: Colors.white.withOpacity(0.3),   
                  borderRadius: BorderRadius.circular(40),
                ),
              ),
                ClipRRect(
                  child: Image.asset(
                    widget.wObj["image"].toString(),
                    width: 80,
                    height: 100,
                    fit: BoxFit.contain,
                  ),
                ),
            ],
          ),
        ],
        
      ),
    );
  }
}

