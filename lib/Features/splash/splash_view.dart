import 'package:fitness/Features/splash/model/splash_model.dart';
import 'package:fitness/Features/splash/widgit/body_splash.dart';
import 'package:fitness/constants.dart';
import 'package:flutter/material.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class SplashView extends StatefulWidget {
  const SplashView({Key? key}) : super(key: key);

  @override
  State<SplashView> createState() => _SplashViewState();
}

class _SplashViewState extends State<SplashView> {
  var controller = PageController();
  List<BaordindModel> boarding = [
    BaordindModel(
      image: 'assets/images/images (1).jpg',
      title: 'Who are we?',
      body:
      "Work is the key \n to all success",
    ),
    BaordindModel(
      image: 'assets/images/Fitness-Trends-2021-c.jpg',
      title: 'Medical Services',
      body:
      "Work is the key \n to all success",
    ),
    BaordindModel(
      image: 'assets/images/57403012-fitnessmodel-sportmodel-sportkarriere-3da7.jpg',
      title: 'Medical Services',
      body:
      "Work is the key \n to all success",
    ),
  ];
  bool isLast = false;

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      backgroundColor: background,
      body: Column(
        children: [
          Expanded(
            child: PageView.builder(
              physics: const BouncingScrollPhysics(),
              onPageChanged: (int index) {
                if (index == boarding.length - 1) {
                  setState(() {
                    isLast = true;
                  });
                } else {
                  setState(() {
                    isLast = false;
                  });
                }
              },
              controller: controller,
              itemBuilder: (context, index) =>
                  BuildSplash(isLast: isLast, model: boarding[index], controller: controller,),
              itemCount: boarding.length,
            ),
          ),
          SizedBox(
            height: MediaQuery.of(context).size.height * .12,
            child: SmoothPageIndicator(
                controller: controller,
                effect: const ExpandingDotsEffect(
                    dotHeight: 10,
                    dotColor: Colors.grey,
                    dotWidth: 10,
                    expansionFactor: 6,
                    paintStyle: PaintingStyle.stroke,
                    activeDotColor: Colors.grey),
                count: boarding.length),

          ),

        ],
      ),
    );
  }

}
