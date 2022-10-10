import 'package:expansion_widget/expansion_widget.dart';
import 'package:flutter/material.dart';
import 'package:libotanic/models/plant_class.dart';
import 'package:libotanic/test_info.dart';
import 'package:libotanic/widgets/plant_category_card.dart';
import 'package:libotanic/widgets/lists/plant_class_list.dart';

import '../../models/division.dart';

class DivisionList extends StatelessWidget {
  final Division division;

  const DivisionList({Key? key, required this.division}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    List<PlantClass> classes = TestInfo.classes[division]!;
    return Expanded(
      child: ListView.builder(
        itemCount: classes.length,
        itemBuilder: (context, id) {
          return ExpansionWidget(
            titleBuilder:
                (double animationValue, _, bool isExpanded, toggleFunction) {
              return InkWell(
                  onTap: toggleFunction,
                  child: PlantCategoryCard(category: classes[id]));
            },
            maintainState: true,
            content: PlantClassList(
              plantClass: classes[id],
            ),
          );
        },
      ),
    );
  }
}
