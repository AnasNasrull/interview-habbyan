import 'package:flutter/material.dart';
import 'package:interview_test/presentation/utility/colors.dart';

class BuildButton extends StatelessWidget {
  const BuildButton({
    super.key,
    required this.backgroundColor,
    required this.title,
    required this.onTap,
    required this.borderColor,
    required this.isColorTextTransparent,
  });

  final Color backgroundColor;
  final String title;
  final void Function() onTap;
  final Color borderColor;
  final bool isColorTextTransparent;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: MediaQuery.of(context).size.width * 0.4,
        height: 49,
        decoration: BoxDecoration(
            color: backgroundColor,
            borderRadius: BorderRadius.circular(12),
            border: Border.all(color: borderColor),
            boxShadow: const [
              BoxShadow(
                blurRadius: 2,
                spreadRadius: 0,
                offset: Offset(0, 0.5),
              )
            ]),
        child: Center(
          child: Text(
            title,
            style: TextStyle(
              fontWeight: FontWeight.w400,
              color:
                  isColorTextTransparent == true ? whiteColor : chocolateColor,
              fontSize: 14.6,
            ),
          ),
        ),
      ),
    );
  }
}
