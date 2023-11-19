import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:ifit/common/utils/app_styles.dart';

class Message extends StatefulWidget {
  final Map inboxObj;
  const Message({super.key, required this.inboxObj});

  @override
  State<Message> createState() => _MessageState();
}

class _MessageState extends State<Message> {
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
              Icons.close,
              size: 20,
              color: Colors.black,
            ),
          ),
        ),
        title: Text('Message',
        style: Styles.headline20),
      ),
      body: ListView(
        children: [
          Container(
            padding: const EdgeInsets.all(15),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                 Align(
                  alignment: Alignment.centerRight,
                  child: Text(
                    widget.inboxObj["date"].toString(),
                    style: Styles.normal.copyWith(
                      fontSize: 16,
                      color: Colors.black,
                    ),
                  ),
                ),
                const Gap(5),
                SelectableText.rich(
                  TextSpan(
                    children: [
                      TextSpan(
                        text: "${widget.inboxObj["name"].toString()}\n",
                        style: Styles.title,
                      ),
                      TextSpan(
                        text: "${widget.inboxObj["email"].toString()}\n\n\n",
                        style: Styles.text15normal,
                      ),
                      TextSpan(
                        text: "Message:\n\n",
                        style: Styles.title,
                      ),
                      TextSpan(
                        text: widget.inboxObj["message"].toString(),
                        style: Styles.text18,
                      ),
                    ],
                  ),
                ),

              ],//main Children
            ),
          ),
        ],

      ),
    );
  }
}