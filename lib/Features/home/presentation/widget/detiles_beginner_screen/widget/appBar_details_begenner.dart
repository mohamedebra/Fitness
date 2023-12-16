import 'package:fitness/core/unit/styles.dart';
import 'package:flutter/material.dart';

class AppBarDetailsBeginner extends StatelessWidget {
  const AppBarDetailsBeginner({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text('Day 01 - warm up',style: Styles.textStyle25,),
        SizedBox(height: 10,),
        Text('01 Workout for beginner',style: Styles.textStyle14,),
        SizedBox(height: 50,),
        Text('''Want your body to be healthy. Join our program with directions according to body's goals. Increasing physical strength is the goal of strenght training. Maintain body fitness by doing physical exercise at least 2-3 times a week.
                                  ''',style: Styles.textStyle14,),
        SizedBox(height: 30,),
      ],
    );
  }
}
