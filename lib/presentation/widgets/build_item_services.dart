import 'package:flutter/material.dart';
import 'package:interview_test/presentation/utility/colors.dart';

class BuildItemServices extends StatelessWidget {
  const BuildItemServices(
      {super.key,
      required this.margin,
      required this.title,
      required this.image});

  final EdgeInsets margin;
  final String title;
  final String image;

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
            // width: 194,
            padding: const EdgeInsets.only(left: 14),
            margin: margin,
            decoration: BoxDecoration(
              color: greyColor,
              borderRadius: BorderRadius.circular(8),
            ),
            child: Row(
              children: [
                SizedBox(
                  width: MediaQuery.of(context).size.width * 0.18,
                  child: Text(
                    title,
                    style: const TextStyle(
                        fontWeight: FontWeight.w700, fontSize: 12),
                  ),
                ),
                Image.asset(
                  image,
                  width: 90,
                  height: 132,
                  fit: BoxFit.cover,
                )
              ],
            ))
      ],
    );
  }
}
