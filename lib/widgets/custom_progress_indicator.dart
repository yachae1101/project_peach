import 'package:flutter/material.dart';
import 'package:step_progress_indicator/step_progress_indicator.dart';
import 'package:project_peach/widgets/palette.dart';



class CustomProgressIndicator extends StatelessWidget {
  final int index;
  final int total;

  const CustomProgressIndicator({
    required this.index,
    required this.total,
  });

  @override
  Widget build(BuildContext context) {
    return StepProgressIndicator(
      totalSteps: total,
      currentStep: index,
      size:5,
      padding: 0,
      selectedColor: Palette.peachColor,
      unselectedColor: Palette.lightGrey,
    );
  }
}
