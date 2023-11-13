import 'package:fluentui_icons/fluentui_icons.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:ifit/common/utils/app_styles.dart';
import 'package:ifit/common/widgets/confirmation_dialog.dart';
import 'package:ifit/common/widgets/main_button.dart';
import 'package:ifit/common/widgets/text_field_container.dart';
import 'package:ifit/screens/clients_main_screens/main_bottom_bar.dart';

class ExpertContact extends StatefulWidget {
  const ExpertContact({super.key});

  @override
  State<ExpertContact> createState() => _ExpertContactState();
}

class _ExpertContactState extends State<ExpertContact> {
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
          'Contact Us',
          style: Styles.headline20,
        ),
      ),
      body: Column(
        children: [
          Expanded(
            child: SingleChildScrollView(
              child: Padding(
                padding: const EdgeInsets.all(15),
                child: Column(
                  children: [
                    Column(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "For any questions and suggestions, you can contact me at the following: ",
                          style: Styles.title),
                        const Gap(20),
                        const TextfieldContainer(
                          hitText: 'Enter your Name',
                          icon: FluentSystemIcons.ic_fluent_person_regular,
                          obscureText: false,
                        ),
                        const Gap(15),
                        const TextfieldContainer(
                          hitText: 'Enter your Email',
                          icon: FluentSystemIcons.ic_fluent_mail_regular,
                          obscureText: false,
                        ),
                        const Gap(15),
                        Container(
                          height: 200,
                          decoration: BoxDecoration(
                            color: Styles.boxtextField,
                            borderRadius: BorderRadius.circular(15),
                          ),
                          child: SingleChildScrollView(
                            child: TextField(
                              maxLines: null,
                              decoration: InputDecoration(
                                contentPadding: const EdgeInsets.all(5),
                                enabledBorder: InputBorder.none,
                                focusedBorder: InputBorder.none,
                                hintText: 'Enter Message',
                                hintStyle: TextStyle(
                                  color: Styles.fadeTextColor,
                                ),
                              ),
                            ),
                          ),
                        )
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(15),
            child: MainButton(
                title: "Send Now",
                onPressed: () {
                  showDialog(
                      context: context,
                      builder: (BuildContext context) {
                        return ConfirmationDialog(
                          onYesPressed: () {
                            Navigator.of(context).push(MaterialPageRoute(
                              builder: (context) => const DiscoverNavbar()));
                          },
                        );
                      });
                }),
          )
        ],
      ),
    );
  }
}
