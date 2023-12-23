import 'package:flutter/material.dart';
import 'package:flutter_course/dice_roller.dart';

class GradientContainer extends StatelessWidget {
  const GradientContainer({
    super.key,
    required this.startAlignment,
    required this.endAlignment,
    required this.colors,
  });

  final Alignment startAlignment;
  final Alignment endAlignment;
  final List<Color> colors;

  @override
  Widget build(context) {
    return Container(
      decoration: BoxDecoration(
        gradient: LinearGradient(
          colors: colors,
          begin: startAlignment,
          end: endAlignment,
        ),
      ),
      child: const Center(
        child: DiceRoller(),
      ),
    );
  }
}
