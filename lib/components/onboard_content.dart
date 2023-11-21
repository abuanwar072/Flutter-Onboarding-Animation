import 'package:flutter/material.dart';
import 'package:onboard_animation/components/landed_content.dart';
import 'package:onboard_animation/components/sing_up_form.dart';

class OnboardContent extends StatefulWidget {
  const OnboardContent({super.key});

  @override
  State<OnboardContent> createState() => _OnboardContentState();
}

class _OnboardContentState extends State<OnboardContent> {
  late PageController _pageController;
  // double _progress;
  @override
  void initState() {
    _pageController = PageController()
      ..addListener(() {
        setState(() {});
      });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final double progress =
        _pageController.hasClients ? (_pageController.page ?? 0) : 0;

    return SizedBox(
      height: 400 + progress * 160,
      child: Stack(
        fit: StackFit.expand,
        children: [
          Column(
            children: [
              const SizedBox(height: 16),
              Expanded(
                child: PageView(
                  controller: _pageController,
                  children: const [
                    LandingContent(),
                    SignUpForm(),
                  ],
                ),
              ),
            ],
          ),
          Positioned(
            height: 56,
            bottom: 48 + progress * 180,
            right: 16,
            child: GestureDetector(
              onTap: () {
                if (_pageController.page == 0) {
                  _pageController.animateToPage(1,
                      duration: const Duration(milliseconds: 400),
                      curve: Curves.ease);
                }
              },
              child: Container(
                padding: const EdgeInsets.symmetric(horizontal: 24),
                decoration: const BoxDecoration(
                  borderRadius: BorderRadius.all(Radius.circular(25)),
                  gradient: LinearGradient(
                    begin: Alignment.bottomLeft,
                    end: Alignment.topRight,
                    stops: [0.4, 0.8],
                    colors: [
                      Color.fromARGB(255, 239, 104, 80),
                      Color.fromARGB(255, 139, 33, 146)
                    ],
                  ),
                ),
                child: DefaultTextStyle(
                  style: const TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.w600,
                    color: Colors.white,
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      SizedBox(
                        width: 92 + progress * 32,
                        child: Stack(
                          fit: StackFit.passthrough,
                          children: [
                            FadeTransition(
                              opacity: AlwaysStoppedAnimation(1 - progress),
                              child: const Text("Get Started"),
                            ),
                            FadeTransition(
                              opacity: AlwaysStoppedAnimation(progress),
                              child: const Text(
                                "Create account",
                                maxLines: 1,
                                overflow: TextOverflow.fade,
                                softWrap: false,
                              ),
                            ),
                          ],
                        ),
                      ),
                      const Icon(
                        Icons.chevron_right,
                        size: 24,
                        color: Colors.white,
                      )
                    ],
                  ),
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}
