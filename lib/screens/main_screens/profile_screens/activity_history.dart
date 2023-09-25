import 'package:fluentui_icons/fluentui_icons.dart';
import 'package:flutter/material.dart';
import 'package:ifit/common/utils/app_styles.dart';
import 'package:ifit/common/widgets/more_icon.dart';
import 'package:ifit/screens/main_screens/home_screens/activity_tracker.dart';

class ActivtyHistoryScreen extends StatefulWidget {
  final List<Map> actHistoryArr;


  const ActivtyHistoryScreen({super.key, required this.actHistoryArr});

  @override
  State<ActivtyHistoryScreen> createState() => _ActivtyHistoryScreenState();
}

class _ActivtyHistoryScreenState extends State<ActivtyHistoryScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Styles.bgColor,
      appBar: AppBar(
        backgroundColor: Colors.white,
        centerTitle: true,
        elevation: 0,
        leading: InkWell(
          onTap: () {
            Navigator.pop(context);
          },
          child: Container(
            margin: const EdgeInsets.all(12),
            height: 30,
            width: 30,
            alignment: Alignment.center,
            decoration: BoxDecoration(
                color: Colors.grey.shade200,
                borderRadius: BorderRadius.circular(10)),
            child: const Icon(
              FluentSystemIcons.ic_fluent_chevron_left_filled,
              size: 20,
              color: Colors.black,
            ),
          ),
        ),
        title: Text(
          'Activity History',
          style: Styles.headlineSmall,
        ),
        actions: const [
          MoreIcon(
            options: ['Today', 'This Week', 'This Month'],
          ),
        ],
      ),
      body: ListView.separated(
        padding: const EdgeInsets.symmetric(vertical: 15, horizontal: 25),
        itemBuilder: ((context, index) {
          var actObj = widget.actHistoryArr[index];
          return ActivityHistoryRow(actObj: actObj);
        }), separatorBuilder: (context, index){
        return Divider(color: Colors.grey.withOpacity(0.5), height: 1);
        }, 
        itemCount: widget.actHistoryArr.length
      ),

    );
  }
}
