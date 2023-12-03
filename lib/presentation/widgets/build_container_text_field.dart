import 'package:flutter/material.dart';
import 'package:interview_test/presentation/utility/colors.dart';

class BuildContainerTextField extends StatelessWidget {
  const BuildContainerTextField({super.key, required this.child});

  final Widget child;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 25),
      decoration: BoxDecoration(
        color: whiteTransparentColor,
        borderRadius: BorderRadius.circular(10),
      ),
      child: child,
    );
  }
}
