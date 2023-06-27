import 'package:flutter/material.dart';

class CustomContainer extends StatelessWidget{
  final Color color;
  final String text;
  const CustomContainer({
    required this.color,
    required this.text,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      color: color,
      child: Text(text),
    );
  }

}