import 'package:fitness/Features/home/presentation/widget/detiles_beginner_screen/widget/appBar_details_begenner.dart';
import 'package:fitness/Features/home/presentation/widget/detiles_beginner_screen/widget/body_details_beginner_screen.dart';
import 'package:fitness/constants.dart';
import 'package:flutter/material.dart';

class DetailsBeginnerScreen extends StatelessWidget {
  const DetailsBeginnerScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Form(
          child: Column(
            children: [
              Stack(
                children: [
                  const Image(
                    image: AssetImage('assets/images/download (1).jpg'),
                    width: double.infinity,
                    height: 300,
                    fit: BoxFit.fill,
                  ),
                  Column(
                    children: [
                      SizedBox(
                        height: MediaQuery.of(context).size.height *.2,
                      ),
                      Container(
                        width: double.infinity,
                        decoration: const BoxDecoration(
                            borderRadius: BorderRadiusDirectional.only(
                              topStart: Radius.circular(50),
                              topEnd: Radius.circular(50),
                            ),
                            color: background),
                        child:  Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            SizedBox(
                              height: 50,
                            ),
                            Padding(
                              padding: EdgeInsets.all(20.0),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  AppBarDetailsBeginner(),
                                  BodyDetailsBeginnerScreen(),
                                ],
                              ),
                            )
                          ],
                        ),
                      ),
                    ],
                  )
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
