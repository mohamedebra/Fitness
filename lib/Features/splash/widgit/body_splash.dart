import 'package:fitness/Features/auth/veiw/login.dart';
import 'package:fitness/Features/home/presentation/home_screen.dart';
import 'package:fitness/Features/splash/model/splash_model.dart';
import 'package:fitness/constants.dart';
import 'package:fitness/core/unit/styles.dart';
import 'package:flutter/material.dart';

class BuildSplash extends StatelessWidget {
  const BuildSplash({Key? key, required this.model, required this.controller, required this.isLast}) : super(key: key);
  final BaordindModel model;
  final PageController controller;
  final bool isLast;
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Stack(
          children: [
            SizedBox(
              height: MediaQuery.sizeOf(context).height *.63,
              width: double.infinity,
              child: Image(image: AssetImage(model.image),
                fit: BoxFit.cover,),

            ),
            Column(
              children: [
                SizedBox(
                  height: MediaQuery.of(context).size.height *.63,
                ),

                Container(
                  width: double.infinity,
                  height: MediaQuery.sizeOf(context).height *.25,
                  decoration: const BoxDecoration(
                    color: background,

                  ),
                  child: Column(
                    children: [
                      const SizedBox(height: 35,),
                      Text(model.body,style: Styles.textStyle30,),
                      const SizedBox(height: 50,),
                      GestureDetector(onTap: () {
                        if (isLast) {
                          Navigator.push(
                              context,
                              MaterialPageRoute(builder: (context) =>  LoginPage()));


                        } else {
                          controller.nextPage(
                              duration: const Duration(
                                milliseconds: 750,
                              ),
                              curve: Curves.fastOutSlowIn);
                          //fastLinearToSlowEaseIn
                        }
                      }, child: Container(
                        width: MediaQuery.sizeOf(context).width * .45,
                        height: 50,
                        decoration: BoxDecoration(
                            color: Colors.grey,
                            borderRadius: BorderRadius.circular(20)
                        ),
                        child: const Center(child: Text('Start Now  ',style: TextStyle(
                          fontSize: 17,
                          fontFamily: 'pacifico',

                        ),)),
                      ),),

                    ],
                  ),
                ),
              ],
            ),
          ],
        ),


      ],
    );
  }
}
