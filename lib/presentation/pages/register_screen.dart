import 'package:flutter/material.dart';
import 'package:interview_test/presentation/utility/colors.dart';
import 'package:interview_test/presentation/widgets/build_button.dart';
import 'package:interview_test/presentation/widgets/build_container_text_field.dart';

class RegisterScreen extends StatefulWidget {
  const RegisterScreen({Key? key}) : super(key: key);

  @override
  State<RegisterScreen> createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  bool isVisible = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: whiteTransparentColor,
      body: SafeArea(
        child: Stack(
          children: [
            Positioned(
              top: 10,
              left: 10,
              child: IconButton(
                onPressed: () => Navigator.pop(context),
                icon: const Icon(Icons.arrow_back_ios),
              ),
            ),
            Container(
              width: double.infinity,
              height: double.infinity,
              margin: const EdgeInsets.only(top: 70),
              decoration: const BoxDecoration(
                color: whiteColor,
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(25),
                  topRight: Radius.circular(25),
                ),
              ),
              child: Padding(
                padding: const EdgeInsets.all(15.0),
                child: Column(
                  children: [
                    const Spacer(flex: 1),
                    const Text(
                      "Sign Up",
                      style: TextStyle(
                        fontSize: 25,
                        fontWeight: FontWeight.w700,
                        color: blackColor,
                      ),
                    ),
                    const SizedBox(height: 20),
                    const BuildContainerTextField(
                      child: TextField(
                        decoration: InputDecoration(
                          border: InputBorder.none,
                          labelText: "Email / Phone Number",
                        ),
                      ),
                    ),
                    const SizedBox(height: 20),
                    BuildContainerTextField(
                      child: TextField(
                        obscureText: !isVisible,
                        decoration: InputDecoration(
                          border: InputBorder.none,
                          labelText: "Password",
                          suffixIcon: IconButton(
                            onPressed: () {
                              setState(() {
                                isVisible = !isVisible;
                              });
                            },
                            icon: isVisible == true
                                ? const Icon(Icons.visibility)
                                : const Icon(Icons.visibility_off),
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(height: 20),
                    BuildButton(
                      backgroundColor: chocolateColor,
                      title: "Continue",
                      onTap: () {},
                      borderColor: transparent,
                      isColorTextTransparent: true,
                    ),
                    const SizedBox(height: 20),
                    const Text.rich(
                      TextSpan(text: "Already have an account? ", children: [
                        TextSpan(
                            text: "Login",
                            style: TextStyle(
                              color: chocolateColor,
                              fontWeight: FontWeight.w400,
                              fontSize: 14.6,
                            ))
                      ]),
                    ),
                    const Spacer(
                      flex: 1,
                    ),
                    const Text.rich(
                      TextSpan(text: "Create your free Account.", children: [
                        TextSpan(
                            text: "Sign Up",
                            style: TextStyle(
                              color: chocolateColor,
                              fontWeight: FontWeight.w400,
                              fontSize: 14.6,
                            ))
                      ]),
                    )
                  ],
                ),
              ),
            ),
            Align(
              alignment: Alignment.topCenter,
              child: Container(
                margin: const EdgeInsets.only(top: 25),
                width: 110,
                height: 110,
                decoration: const BoxDecoration(
                  shape: BoxShape.circle,
                  color: whiteColor,
                ),
                child: Center(
                  child: Image.asset(
                    "assets/icon/logo.png",
                    width: 90,
                    height: 90,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
