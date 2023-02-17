import 'package:flutter/material.dart';
import 'package:flutter_package_test/pages/navigation.dart';
import 'package:introduction_screen/introduction_screen.dart';
import 'package:lottie/lottie.dart';

class IntroductionPage extends StatelessWidget {
  const IntroductionPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return IntroductionScreen(
      next: const Text("Next"),
      done: const Text("Done"),
      onDone: () {
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(
            builder: (context) => const Navigation(),
          ),
        );
      },
      pages: [
        PageViewModel(
          title: "Title of introduction page 1",
          body: "Welcome to the app! This is a description of how it works.",
          image: Center(
            child: Container(
              padding: const EdgeInsets.only(top: 50),
              height: 300,
              width: 300,
              child: Lottie.asset("assets/lotties/intro.json"),
            ),
          ),
        ),
        PageViewModel(
          title: "Title of introduction page 2",
          body: "Welcome to the app! This is a description of how it works.",
          image: Center(
            child: Container(
              padding: const EdgeInsets.only(top: 50),
              height: 300,
              width: 300,
              child: Lottie.asset("assets/lotties/food.json"),
            ),
          ),
        )
      ],
    );
  }
}
