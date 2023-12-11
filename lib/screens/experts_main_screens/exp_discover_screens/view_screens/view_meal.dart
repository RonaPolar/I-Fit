import 'package:dotted_dashed_line/dotted_dashed_line.dart';
import 'package:fluentui_icons/fluentui_icons.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:ifit/common/utils/app_styles.dart';
import 'package:ifit/common/widgets/favorites_button.dart';
import 'package:ifit/common/widgets/text_field_container.dart';
import 'package:ifit/screens/clients_main_screens/discover_screens/expert_screens/expert_profile.dart';
import 'package:readmore/readmore.dart';

class ViewMealDetails extends StatefulWidget {
  final Map dObj;
  
  const ViewMealDetails({super.key, required this.dObj});

  @override
  State<ViewMealDetails> createState() => _ViewMealDetailsState();
}

class _ViewMealDetailsState extends State<ViewMealDetails> {

  List itemsArr = [
    {
      "item": "Wheat Flour",
      "value": "100 gram",
    },
    {
      "item": "Sugar",
      "value": "100 gram",
    },
    {
      "item": "Sugar",
      "value": "3 tbsp",
    },
    {
      "item": "Baking Soda",
      "value": "2 tsp",
    },
    {
      "item": "Eggs",
      "value": "2x",
    },
  ];

  List stepArr = [
      {"no": "01", "title": "Step 01",
      "detail": "Prepare all of the ingredients that needed"},
      {"no": "02", "detail": "Mix flour, sugar, salt, and baking powder"},
      {
        "no": "03",
        "detail":
            "In a seperate place, mix the eggs and liquid milk until blended"
      },
      {
        "no": "04",
        "detail":
            "Put the egg and milk mixture into the dry ingredients, Stir untul smooth and smooth"
      },
      {"no": "05", "detail": "Prepare all of the ingredients that needed"},
    ];

  
  List discoverExperts = [
    {
      "name": "Dr. Octavius Brine",
      "image": "assets/images/experts/expert2.png",
      "profession": "Nutritionist",
      "rate": "3.9",
      "mealCreated": "2",
      "workoutCreated": "5",
      "descriptions": "I'm a licensed Nutritionist working in GoFit center at Mandaluyong and has 12 years of experience at the field. If you like my programs I created, you can email or visit me.",
    },
  ];


  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.red,
      child: NestedScrollView(
        headerSliverBuilder: (context, innerBoxIsScrolled) {
          return [
            SliverAppBar(
              backgroundColor: Colors.transparent,
              centerTitle: true,
              // pinned: true,
              elevation: 0,
              expandedHeight: 300,
              leading: InkWell(
                onTap: () {
                  Navigator.pop(context);
                },
                child: Container(
                  margin: const EdgeInsets.all(12),
                  height: 30,
                  width: 30,
                  alignment: Alignment.center,
                  child: const Icon(
                    FluentSystemIcons.ic_fluent_chevron_left_filled,
                    size: 20,
                    color: Colors.black,
                  ),
                ),
              ),
              
              flexibleSpace: Container(
                padding: const EdgeInsets.only(top: 80, bottom: 10),
                width: double.maxFinite,
                child: Image.asset(widget.dObj["image"].toString()),
              ),
            ),
          ];
        },
        body: Container(
          decoration: BoxDecoration(
              color: Styles.bgColor,
              borderRadius: const BorderRadius.only(
                  topLeft: Radius.circular(25), topRight: Radius.circular(25))),
          child: Scaffold(
            backgroundColor: Colors.transparent,
            body: SingleChildScrollView(
              child: Column(
                children: [
                  const Gap(10),
                  Container(
                    width: 50,
                    height: 4,
                    decoration: BoxDecoration(
                        color: Colors.grey,
                        borderRadius: BorderRadius.circular(3)),
                  ),

                  const Gap(20),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 15),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  widget.dObj["name"].toString(),
                                  style: Styles.text18.copyWith(
                                      fontWeight: FontWeight.w700),
                                ),
                                RichText(
                                  text: TextSpan(
                                    children: [
                                     TextSpan(
                                        text: 'by ',
                                        style: Styles.text12
                                      ),
                                      TextSpan(
                                        text: "${discoverExperts[0]["name"]}",
                                        style: Styles.text12.copyWith(
                                          color: Colors.blue,
                                        ),
                                        recognizer: TapGestureRecognizer()
                                          ..onTap = () {
                                            var exObj = discoverExperts[0] as Map? ?? {};
                                           Navigator.push(context,
                                              MaterialPageRoute(
                                                builder: (context) => ExpertProfile(exObj: exObj)),);
                                          },
                                      ),
                                    ],
                                  ),
                                ),  
                              ],
                            ),
                            Container(
                                padding: EdgeInsets.zero,
                                child: const FavoriteButton()),
                          ],
                        ),
                      ),
                    ],
                  ),

                  
                  const Gap(15),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 15),
                        child: Text(
                        'Nutritions',
                        style:  Styles.text18.copyWith(
                            fontWeight: FontWeight.w700),
                        ),
                      ),
                      const Gap(10),
                      SingleChildScrollView(
                        scrollDirection: Axis.horizontal,
                        padding: const EdgeInsets.symmetric(horizontal: 15),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Container(
                              padding: const EdgeInsets.symmetric(
                              vertical: 10, horizontal: 10),
                              decoration: BoxDecoration(
                                color: Styles.secondColor.withOpacity(0.3),
                                borderRadius: BorderRadius.circular(12),
                              ),
                              child: Row(
                                children: [
                                  const Icon(Icons.star_sharp, color: Colors.red,),
                                  Text("${widget.dObj["rate"].toString()} stars"),
                                ],
                              ),
                            ),
                            const Gap(5), 
                            NutritionDescriptions(
                              imagePath: "assets/icons/calories.png", 
                              label: "${widget.dObj["kcal"].toString()} calories"), 
                            const Gap(5),  
                            NutritionDescriptions(
                              imagePath: "assets/icons/fat.png", 
                              label: "${widget.dObj["fats"].toString()} fats"),
                            const Gap(5),
                            NutritionDescriptions(
                              imagePath: "assets/icons/sugar.png", 
                              label: "${widget.dObj["sugar"].toString()} sugar"),
                            const Gap(5),
                            NutritionDescriptions(
                              imagePath: "assets/icons/protein.png", 
                              label: "${widget.dObj["proteins"].toString()} proteins"),
                          ],
                        ),
                      ),
                      

                      const Gap(20),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 15),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              'Descriptions',
                              style:  Styles.text18.copyWith(
                                  fontWeight: FontWeight.w700),
                              ),
                            const Gap(10),
                            ReadMoreText(
                            "Pancakes are some people's favorite breakfast, who doesn't like pancakes? Especially with the real honey splash on top of the pancakes, of course everyone loves that!",
                            style: Styles.seeMore.copyWith(
                              fontWeight: FontWeight.normal
                            ),
                            trimLines: 3,
                            colorClickableText: Colors.blue,
                            trimMode: TrimMode.Line,
                            trimCollapsedText: '  Show more',
                            trimExpandedText: ' Show less',
                            moreStyle:  Styles.seeMore.copyWith(
                                color: Colors.blue),
                            lessStyle:  Styles.seeMore.copyWith(
                                color: Colors.blue),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),

                  const Gap(30),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal:15),
                    child: Column(
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              "You'll Need",
                              style:  Styles.text18.copyWith(
                                  fontWeight: FontWeight.w700),
                            ),
                            Text(
                              "${itemsArr.length} Items",
                              style: Styles.normal.copyWith(
                                  fontWeight: FontWeight.w700),
                            )
                          ],
                        ),
                        const Gap(5),
                        ListView.builder(
                            padding: EdgeInsets.zero,
                            physics: const NeverScrollableScrollPhysics(),
                            shrinkWrap: true,
                            itemCount: itemsArr.length,
                            itemBuilder: (context, index) {
                              var yObj = itemsArr[index] as Map? ?? {};
                              return Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Row(
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                    children: [
                                      Text( yObj["item"].toString(),
                                        style: Styles.normal.copyWith(
                                          ),
                                        ),
                                      Text( yObj["value"].toString(),
                                        style: Styles.normal.copyWith(
                                          ),
                                        ),
                                    ],
                                  ),
                                ],
                              );
                            }),
                      ],
                    ),
                  ),

                  const Gap(20),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 15),
                    child: Column(
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              "Step by Step",
                              style:  Styles.text18.copyWith(
                                  fontWeight: FontWeight.w700),
                            ),
                            Text(
                              "${stepArr.length} Sets",
                              style:  Styles.normal.copyWith(
                                  fontWeight: FontWeight.w700),
                            )
                          ],
                        ),
                        const Gap(10),
                        ListView.builder(
                          padding: EdgeInsets.zero,
                          physics: const NeverScrollableScrollPhysics(),
                          shrinkWrap: true,
                          itemCount: stepArr.length,
                          itemBuilder: (context, index) {
                            var sObj = stepArr[index] as Map? ?? {};
                            return MealStepsDottedLine(
                              sObj: sObj,
                              isLast: stepArr.last == sObj,
                            );
                          }),
                      ],
                    ),
                  ),

                  Padding(
                    padding: const EdgeInsets.all(15),
                    child: Container(
                      padding: const EdgeInsets.all(5),
                      decoration: BoxDecoration(
                        color: Styles.secondColor.withOpacity(0.3),
                        borderRadius: BorderRadius.circular(20),
                      ),
                      child: DisplayTextContainer(
                          
                          icon: FluentSystemIcons.ic_fluent_people_regular,
                          hitText: "${widget.dObj["clients"].toString()} clients", obscureText: false,),
                    ),
                  ),
                ], //Main children
              ),
            ),
          ),
        ), //Main top
      ),
    );
  }
}


// Nutrition Descriptions Widget
class NutritionDescriptions extends StatelessWidget {
  final String imagePath;
  final String label;

  const NutritionDescriptions({
    Key? key,
    required this.imagePath,
    required this.label,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 10),
      decoration: BoxDecoration(
        color: Styles.secondColor.withOpacity(0.3),
        borderRadius: BorderRadius.circular(12),
      ),
      child: Row(
        children: [
          Image.asset(
            imagePath,
            scale: 10,
            fit: BoxFit.contain,
          ),
          const Gap(2),
          Text(label),
        ],
      ),
    );
  }
}



class MealStepsDottedLine extends StatelessWidget {
  final Map sObj;
  final bool isLast;
  const MealStepsDottedLine({super.key, required this.sObj, this.isLast = false});

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Container(
              width: 18,
              height: 18,
              decoration: BoxDecoration(
                color: Styles.secondColor.withOpacity(0.5),
                borderRadius: BorderRadius.circular(9),
              ),
              alignment: Alignment.center,
              child: Container(
              width: 16,
              height: 16,
              decoration: BoxDecoration(
                border: Border.all(color: Colors.white, width: 3),
                borderRadius: BorderRadius.circular(8),
              ),) ,
            ),
            if (!isLast)
              DottedDashedLine(
                  height: 70,
                  width: 0,
                  dashColor: Styles.secondColor.withOpacity(0.5),
                  axis: Axis.vertical)
          ],
        ),
        const Gap(5), //gap between text and line
        Expanded(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              //waterArry
              Text(
                "Step ${ sObj["no"].toString()}",
                style: Styles.normal.copyWith(
                  color: Styles.secondColor),
                ),
              Text(
                sObj["detail"].toString(),
                style: Styles.seeMore.copyWith(
                 fontWeight: FontWeight.normal),
                ),
              const Gap(5),
            ],
          ),
        )
      ],
    );
  }
}
