import 'package:feather_icons/feather_icons.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:interview_test/presentation/provider/auth_provider.dart';
import 'package:interview_test/presentation/utility/colors.dart';
import 'package:interview_test/presentation/widgets/build_container_text_field.dart';
import 'package:provider/provider.dart';

import '../widgets/build_item_services.dart';
import '../widgets/build_recent_event.dart';

class HomeScreenCurrent extends StatefulWidget {
  const HomeScreenCurrent({super.key});

  @override
  State<HomeScreenCurrent> createState() => _HomeScreenCurrentState();
}

class _HomeScreenCurrentState extends State<HomeScreenCurrent> {
  bool isHide = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: whiteTransparentColor,
      body: SingleChildScrollView(
        child: SafeArea(
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Image.asset(
                    "assets/icon/logo_black.png",
                    width: 70,
                    height: 70,
                  ),
                  SizedBox(
                    width: MediaQuery.of(context).size.width * 0.6,
                    child: const Text.rich(
                      TextSpan(
                        text: "Making Memories ",
                        style: TextStyle(
                            fontSize: 18.6, fontWeight: FontWeight.w700),
                        children: [
                          TextSpan(
                            text: "of those giving their best",
                            style: TextStyle(
                                fontSize: 18.6, fontWeight: FontWeight.w400),
                          ),
                        ],
                      ),
                    ),
                  ),
                  IconButton(
                    onPressed: () {},
                    icon: SvgPicture.asset(
                      "assets/icon/notification.svg",
                      width: 36,
                      height: 32,
                    ),
                  )
                ],
              ),
              const SizedBox(height: 20),
              Stack(
                children: [
                  Padding(
                    padding: const EdgeInsets.only(top: 10),
                    child: Container(
                      padding:
                          const EdgeInsets.only(left: 16, top: 20, right: 16),
                      width: double.infinity,
                      decoration: const BoxDecoration(
                          color: whiteColor,
                          borderRadius: BorderRadius.only(
                            topLeft: Radius.circular(20),
                            topRight: Radius.circular(20),
                          )),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Consumer<AuthProvider>(
                            builder: (context, auth, _) => Row(
                              children: [
                                Image.asset("assets/images/avatar (1).png"),
                                const SizedBox(width: 20),
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    const Text(
                                      "Welcome back",
                                      style: TextStyle(
                                          fontSize: 14,
                                          fontWeight: FontWeight.w400,
                                          color: greyLight),
                                    ),
                                    SizedBox(
                                      width: MediaQuery.of(context).size.width *
                                          0.35,
                                      child: Text(
                                        auth.currentUser!.profile.email,
                                        style: const TextStyle(
                                          fontSize: 18,
                                          fontWeight: FontWeight.w500,
                                          color: blackColor,
                                        ),
                                        overflow: TextOverflow.ellipsis,
                                      ),
                                    ),
                                  ],
                                ),
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.end,
                                  children: [
                                    Row(
                                      mainAxisAlignment: MainAxisAlignment.end,
                                      children: [
                                        SvgPicture.asset(
                                            "assets/icon/wallet.svg",
                                            width: 25),
                                        const SizedBox(width: 2),
                                        const Text(
                                          "Rp. 200.00",
                                          style: TextStyle(
                                            fontSize: 15,
                                            fontWeight: FontWeight.w700,
                                            color: chocolatteLight,
                                          ),
                                        ),
                                      ],
                                    ),
                                    const Text(
                                      "Top up",
                                      style: TextStyle(
                                        fontSize: 13,
                                        fontWeight: FontWeight.w700,
                                        color: chocolatteLight,
                                      ),
                                    ),
                                  ],
                                )
                              ],
                            ),
                          ),
                          const Divider(
                              thickness: 2,
                              height: 30,
                              endIndent: 10,
                              indent: 10),
                          BuildContainerTextField(
                            child: TextField(
                              decoration: InputDecoration(
                                border: InputBorder.none,
                                hintText: "Search",
                                suffixIcon: Icon(FeatherIcons.search),
                              ),
                            ),
                          ),
                          const SizedBox(height: 20),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              const Text(
                                "Services",
                                style: TextStyle(
                                    fontSize: 18, fontWeight: FontWeight.w700),
                              ),
                              IconButton(
                                onPressed: () {
                                  setState(() {
                                    isHide = !isHide;
                                  });
                                },
                                icon: isHide == true
                                    ? const Icon(Icons.keyboard_arrow_up)
                                    : const Icon(Icons.keyboard_arrow_down),
                              )
                            ],
                          ),
                          if (isHide == false) ...[
                            const Row(
                              children: [
                                BuildItemServices(
                                  margin: EdgeInsets.only(right: 5, bottom: 5),
                                  image: "assets/images/photografer.png",
                                  title: "Get \nPhotografer",
                                ),
                                BuildItemServices(
                                  margin: EdgeInsets.only(left: 5, bottom: 5),
                                  image: "assets/images/live.png",
                                  title: "Request Live Streaming",
                                ),
                              ],
                            ),
                            const Row(
                              children: [
                                BuildItemServices(
                                  margin: EdgeInsets.only(right: 5, bottom: 5),
                                  image: "assets/images/camera.png",
                                  title: "Rent Equipment",
                                ),
                                BuildItemServices(
                                  margin: EdgeInsets.only(left: 5, bottom: 5),
                                  image: "assets/images/photografer2.png",
                                  title: "Offer Services",
                                ),
                              ],
                            )
                          ],
                          const Text(
                            "Recent Event",
                            style: TextStyle(
                                fontSize: 18, fontWeight: FontWeight.w700),
                          ),
                          const BuildRecentEvent(),
                        ],
                      ),
                    ),
                  )
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
