import 'package:fitness/Features/home/presentation/widget/detiles_beginner_screen/video_screen1.dart';
import 'package:fitness/Features/home/presentation/widget/detiles_beginner_screen/video_screen2.dart';
import 'package:fitness/core/unit/styles.dart';
import 'package:flutter/material.dart';

class BodyDetailsBeginnerScreen extends StatelessWidget {
  const BodyDetailsBeginnerScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: MediaQuery.sizeOf(context).height * .51,
      child:  ListView(
        children: [
          InkWell(
            onTap: (){
              Navigator.push(context, MaterialPageRoute(builder: (context)=> const VideoScreen1()));
            },
            child: Card(
              color: Colors.grey[800],
              child:
              Row(
                children: [
                  const Image(image: AssetImage('assets/images/Fitness-Trends-2021-c.jpg'),width:120,),
                  const SizedBox(width: 10,),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const SizedBox(
                        width: 150,
                        child: Text('Simple Warm-Up Exercises',
                          style: Styles.textStyle14,
                          overflow: TextOverflow.ellipsis,
                          maxLines: 2,
                        ),
                      ),
                      const SizedBox(height: 7,),
                      Text('0 : 30',style: TextStyle(
                          color: Colors.grey[500],
                          fontSize: 12
                      ),),

                    ],
                  )
                ],
              ),
            ),
          ),
          const SizedBox(height: 9,),
          InkWell(
            onTap: (){
              Navigator.push(context, MaterialPageRoute(builder: (context)=> const VideoScreen2()));
            },
            child: Card(
              color: Colors.grey[800],
              child:
              Row(
                children: [
                  const Image(image: AssetImage('assets/images/Fitness-Trends-2021-c.jpg'),width:120,),
                  const SizedBox(width: 10,),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const SizedBox(
                        width: 150,
                        child: Text('Simple Warm-Up Exercises',
                          style: Styles.textStyle14,
                          overflow: TextOverflow.ellipsis,
                          maxLines: 2,
                        ),
                      ),
                      const SizedBox(height: 7,),
                      Text('0 : 30',style: TextStyle(
                          color: Colors.grey[500],
                          fontSize: 12
                      ),),

                    ],
                  )
                ],
              ),
            ),
          ),
        ],
      )
      ,
    );
  }

}
