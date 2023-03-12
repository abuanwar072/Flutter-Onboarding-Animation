import 'package:flutter/material.dart';
import 'package:onboard_animation/components/landed_content.dart';
import 'package:onboard_animation/components/sing_up_form.dart';

class OnboardContent extends StatefulWidget {
  const OnboardContent({super.key});

  @override
  State<OnboardContent> createState() => _OnboardContentState();
}

class _OnboardContentState extends State<OnboardContent> {
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 400,
      child: Stack(
        fit: StackFit.expand,
        children: [
          Column(
            children: [
              const SizedBox(height: 16),
              Expanded(
                child: PageView(
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
            bottom: 32,
            right: 16,
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
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    SizedBox(
                      width: 92,
                      child: Stack(
                        children: const [
                          Text("Get Started"),
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
          )
        ],
      ),
    );
  }
}
