import 'package:flutter/material.dart';
import 'package:interview_test/presentation/pages/bottom_nav_current.dart';
import 'package:interview_test/presentation/provider/auth_provider.dart';
import 'package:interview_test/presentation/utility/colors.dart';
import 'package:interview_test/presentation/widgets/build_button.dart';
import 'package:interview_test/presentation/widgets/build_container_text_field.dart';
import 'package:provider/provider.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  bool isVisible = false;
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  TextEditingController _emailController = TextEditingController();
  TextEditingController _passwordController = TextEditingController();

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
                child: Consumer<AuthProvider>(
                  builder: (context, auth, _) => Form(
                    key: _formKey,
                    child: Column(
                      children: [
                        const Spacer(flex: 1),
                        const Text(
                          "Login",
                          style: TextStyle(
                            fontSize: 25,
                            fontWeight: FontWeight.w700,
                            color: blackColor,
                          ),
                        ),
                        const SizedBox(height: 20),
                        BuildContainerTextField(
                          child: TextFormField(
                            controller: _emailController,
                            decoration: const InputDecoration(
                              border: InputBorder.none,
                              labelText: "Email / Phone Number",
                            ),
                            validator: (value) {
                              if (value == null || value.isEmpty) {
                                return 'Please enter your email';
                              }
                            },
                          ),
                        ),
                        const SizedBox(height: 20),
                        BuildContainerTextField(
                          child: TextFormField(
                            controller: _passwordController,
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
                            validator: (value) {
                              if (value == null || value.isEmpty) {
                                return 'Please enter your password';
                              }
                            },
                          ),
                        ),
                        const SizedBox(height: 20),
                        BuildButton(
                          backgroundColor: chocolateColor,
                          title: "Login",
                          onTap: () async {
                            if (_formKey.currentState?.validate() ?? false) {
                              // Form is valid, perform your login logic here
                              final email = _emailController.text;
                              final password = _passwordController.text;
                              final isLogin = auth.login(email, password);
                              print(isLogin);

                              Navigator.pushAndRemoveUntil(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) =>
                                          const BottomNavigationCurrent()),
                                  (route) => false);
                              // Perform login or other actions
                            }
                          },
                          borderColor: transparent,
                          isColorTextTransparent: true,
                        ),
                        const SizedBox(height: 20),
                        TextButton(
                          onPressed: () {},
                          child: const Text(
                            "Forgot Password?",
                            style: TextStyle(
                                color: chocolateColor,
                                fontSize: 14,
                                fontWeight: FontWeight.w400),
                          ),
                        ),
                        const Spacer(
                          flex: 1,
                        ),
                        const Text.rich(
                          TextSpan(
                              text: "Create your free Account.",
                              children: [
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
