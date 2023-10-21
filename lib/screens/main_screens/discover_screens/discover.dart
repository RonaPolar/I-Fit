import 'package:fluentui_icons/fluentui_icons.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:ifit/common/utils/app_styles.dart';
import 'package:ifit/common/widgets/search.dart';
import 'package:ifit/screens/main_screens/program_tracker_screens/my_program/my_program.dart';

class DiscoverScreen extends StatefulWidget {
  const DiscoverScreen({super.key});

  @override
  State<DiscoverScreen> createState() => _DiscoverScreenState();
}

class _DiscoverScreenState extends State<DiscoverScreen> {
TextEditingController txtSearch = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Styles.bgColor,
      appBar: AppBar(
        backgroundColor: Colors.white,
        centerTitle: true,
        elevation: 0,
        title: Container(
          height: 35,
          width: double.maxFinite,
          decoration: BoxDecoration(
              color: Colors.grey.shade200,
              borderRadius: BorderRadius.circular(10)),
          alignment: Alignment.center,
          child: SearchContainer(controller: txtSearch, hintText: "Search")
        ),
        actions: [
          InkWell(
            onTap: () {
            Navigator.of(context).push(
                MaterialPageRoute(
                builder: (context) => const MyProgramScreen()));
            },
            child: Container(
              margin: const EdgeInsets.symmetric(horizontal:15, vertical: 10),
              height: 35,
              width: 35,
              alignment: Alignment.center,
              decoration: BoxDecoration(
                  color: Colors.grey.shade200,
                  borderRadius: BorderRadius.circular(10)),
              child: const Icon(FluentSystemIcons.ic_fluent_person_regular,
                size: 20,
                color: Colors.black,
              ),
            ),
          ),
        ],
      ),
      body: ListView(
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.all(15),
                child: Text(
                    "Experts",
                    style: Styles.title
                  ),
              ),

              const Gap(15),
              Container(
                padding: const EdgeInsets.all(15),
                width: double.maxFinite,
                decoration: BoxDecoration(
                  border: Border.all(
                    color: Colors.black45
                  )
                ),
                child: Text(
                    "New Arrival",
                    style: Styles.title
                  ),
              ),

              const Gap(15),
              Container(
                padding: const EdgeInsets.all(15),
                width: double.maxFinite,
                decoration: BoxDecoration(
                  border: Border.all(
                    color: Colors.black45
                  )
                ),
                child: Text(
                    "Popular",
                    style: Styles.title
                  ),
              ),

              const Gap(15),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal:15),
                child: Text(
                  "Daily Discover",
                  style: Styles.title
                ),
              ),


            ],//main Children
          ),
        ],

      ),
    );
  }
}
