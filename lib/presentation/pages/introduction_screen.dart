import 'package:flutter/material.dart';
import 'package:interview_test/presentation/pages/bottom_navigation_bar.dart';
import 'package:interview_test/presentation/pages/login_screen.dart';
import 'package:interview_test/presentation/pages/register_screen.dart';
import 'package:interview_test/presentation/utility/colors.dart';
import 'package:interview_test/presentation/widgets/build_button.dart';

class IntroductionScreen extends StatelessWidget {
  const IntroductionScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          SizedBox(
            width: double.infinity,
            height: MediaQuery.of(context).size.height * 0.6,
            child: Image.asset(
              "assets/images/background.png",
              fit: BoxFit.fitWidth,
            ),
          ),
          Positioned(
            top: 50,
            right: 15,
            child: TextButton(
              onPressed: () {
                Navigator.pushAndRemoveUntil(
                    context,
                    MaterialPageRoute(
                        builder: (context) => BottomNavigationBarPages()),
                    (route) => false);
              },
              child: const Text(
                "SKIP",
                style: TextStyle(
                  fontSize: 18,
                  color: whiteColor,
                  fontWeight: FontWeight.w700,
                ),
              ),
            ),
          ),
          DraggableScrollableSheet(builder: (context, schrollController) {
            return SingleChildScrollView(
              child: Container(
                width: double.infinity,
                height: MediaQuery.of(context).size.height * 0.5,
                padding:
                    const EdgeInsets.symmetric(vertical: 20, horizontal: 0),
                decoration: const BoxDecoration(
                  color: whiteColor,
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(20),
                    topRight: Radius.circular(20),
                  ),
                ),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Image.asset(
                      "assets/icon/logo.png",
                      width: 150,
                      height: 150,
                    ),
                    const Text(
                      "Making Memories",
                      style:
                          TextStyle(fontWeight: FontWeight.w700, fontSize: 32),
                      textAlign: TextAlign.center,
                    ),
                    const Text(
                      "of Those Giving Their Best",
                      style:
                          TextStyle(fontWeight: FontWeight.w400, fontSize: 18),
                      textAlign: TextAlign.center,
                    ),
                    Expanded(
                        child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        BuildButton(
                          isColorTextTransparent: true,
                          backgroundColor: chocolateColor,
                          title: "Sign Up",
                          borderColor: transparent,
                          onTap: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => RegisterScreen()),
                            );
                          },
                        ),
                        BuildButton(
                          isColorTextTransparent: false,
                          backgroundColor: whiteColor,
                          title: "Login",
                          borderColor: chocolateColor,
                          onTap: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => LoginScreen(),
                              ),
                            );
                          },
                        )
                      ],
                    ))
                  ],
                ),
              ),
            );
          }),
        ],
      ),
    );
  }
}
