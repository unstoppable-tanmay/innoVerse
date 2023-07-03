import 'package:flutter/material.dart';

class Star extends StatelessWidget {
  const Star({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
        width: 20,
        height: 20,
        decoration: ShapeDecoration(
          shape: StarBorder(
              innerRadiusRatio: .4,
              pointRounding: .5,
              points: 5,
              valleyRounding: .2),
          color: Colors.white,
        ));
  }
}
