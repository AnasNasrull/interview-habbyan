import 'package:flutter/material.dart';
import 'package:interview_test/presentation/pages/introduction_screen.dart';
import 'package:interview_test/presentation/provider/auth_provider.dart';
import 'package:interview_test/presentation/utility/colors.dart';
import 'package:interview_test/presentation/widgets/build_button.dart';
import 'package:provider/provider.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final auth = Provider.of<AuthProvider>(context);
    return Center(
      child: Center(
        child: BuildButton(
            backgroundColor: chocolateColor,
            title: "logout",
            onTap: () {
              auth.logout();
              Navigator.pushAndRemoveUntil(
                  context,
                  MaterialPageRoute(
                      builder: (context) => const IntroductionScreen()),
                  (route) => false);
            },
            borderColor: transparent,
            isColorTextTransparent: true),
      ),
    );
  }
}
