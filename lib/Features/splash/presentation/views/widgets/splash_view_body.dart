import 'package:books_app/Core/utils/app_router.dart';
import 'package:books_app/Core/utils/assets.dart';
import 'package:books_app/Features/splash/presentation/views/widgets/sliding_text.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class SplashViewBody extends StatefulWidget {
  const SplashViewBody({super.key});

  @override
  State<SplashViewBody> createState() => _SplashViewBodyState();
}

/*
SingleTickerProviderStateMixin --> is used to control when the values of the animations are going to change
*/
class _SplashViewBodyState extends State<SplashViewBody>
    with SingleTickerProviderStateMixin {
  late AnimationController animationController;
  //To give values more than 1 where the animationController values are between 0 and 1
  late Animation<Offset> slidingAnimation;

  @override
  void initState() {
    super.initState();
    //method of sliding animation initialization
    initSlidingAnimation();

    navigateToHome();
  }

  //any controller should be disposed to prevent memory leak.
  @override
  void dispose() {
    super.dispose();
    animationController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Image.asset(AssetsData.logo, scale: 0.5),
        SlidingText(slidingAnimation: slidingAnimation),
      ],
    );
  }

  void navigateToHome() {
    Future.delayed(const Duration(milliseconds: 3), () {
      GoRouter.of(context).push(AppRouter.kHomeViewPath);
      // Get.to(
      //   () => const HomeView(),
      //   transition: Transition.fade,
      //   duration: kTransitionDuration,
      // );
    });
  }

  void initSlidingAnimation() {
    animationController = AnimationController(
      vsync: this, //note: this refers to the SingleTickerProviderStateMixin
      duration: const Duration(seconds: 1),
    );

    slidingAnimation = Tween<Offset>(
      begin: Offset(0, 5),
      end: Offset.zero,
    ).animate(animationController);

    animationController.forward();
  }
}
