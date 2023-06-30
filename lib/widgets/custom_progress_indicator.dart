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
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          StepProgressIndicator(
            totalSteps: total,
            customColor:(index) {
              if (index % 2 == 0) {
                return Palette.peachColor;
              } else {
                return Colors.white30;
              }
            },
            padding: 6.0,
          ),
        ],
      ),
    );
  }
}
