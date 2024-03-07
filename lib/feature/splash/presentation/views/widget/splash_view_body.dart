//import "package:get/get.dart" as getN;

//? animated
import 'package:flutter/material.dart';
import 'package:todolive/core/utils/app_image.dart';
import 'package:todolive/core/widgets/custom_bottom_navi_bar.dart';

class SplashViewBody extends StatefulWidget {
  const SplashViewBody({super.key});

  @override
  State<SplashViewBody> createState() => _SplashViewBodyState();
}

class _SplashViewBodyState extends State<SplashViewBody>
    with TickerProviderStateMixin {
  late Animation<Offset> animation;
  late AnimationController animationController;

  @override
  void initState() {
    super.initState();
    initAnimtedCode();
    navigaterByDelayandGet();
  }

  @override
  void dispose() {
    super.dispose();
    animationController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        Image.asset(AppImage.imageLogo),
        const SizedBox(
          height: 4,
        ),
        AnimatedBuilder(
          animation: animation,
          builder: (context, widget) {
            return SlideTransition(
              position: animation,
              child: const Text(
                "To Do Live",
                textAlign: TextAlign.center,
              ),
            );
          },
        )
      ],
    );
  }

// todo :  initAnimtedCode
  void initAnimtedCode() {
    animationController =
        AnimationController(vsync: this, duration: const Duration(seconds: 2));

    animation = Tween<Offset>(begin: const Offset(0, 5), end: Offset.zero)
        .animate(animationController);

    animationController.forward();
  }

// todo :navigaterByDelayandGet

  void navigaterByDelayandGet() {
    Future.delayed(
        const Duration(seconds: 4), // duration

        () => Navigator.push(
            context,
            MaterialPageRoute(
                builder: ((context) => const CustomBottomNaviBar()))));
  }
}
