import 'package:fitness/core/unit/styles.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class DetilsScreen extends StatefulWidget {
  const DetilsScreen({Key? key}) : super(key: key);

  @override
  State<DetilsScreen> createState() => _DetilsScreenState();
}

class _DetilsScreenState extends State<DetilsScreen> {
  String formattedDate = "";

  @override
  void initState() {
    var now =  DateTime.now();
    var formatter =  DateFormat.yMMMMd('en_US') ;
    formattedDate = formatter.format(now);
    print(formattedDate);
    super.initState();
  }
  @override
  Widget build(BuildContext context) {


    return   Padding(
      padding: EdgeInsets.only(top: 50,left: 20,right: 20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text('Hello Ahsin',style: Styles.textStyle30,),
          SizedBox(height: 7,),
          Text('Good Morning',style: Styles.textStyle18,),
          SizedBox(height: 50,),
          Row(
            children: [
              Text('ToDay Workout Plan',style: Styles.textStyle20,),
              Spacer(),
              Text(formattedDate!,style: Styles.textStyle16,),

            ],
          ),
          SizedBox(height: 10,),
          Stack(
            alignment: Alignment.bottomLeft,
            children: [
              SizedBox(
                  width: double.infinity,
                  child: Image(image: AssetImage('assets/images/download.jpg'),fit: BoxFit.cover,)),
              SizedBox(height: 10,),
              Padding(
                padding: EdgeInsets.all(10.0),
                child: Column(
                  children: [
                    Text('Day 01 - warm up',style: Styles.textStyle18,),
                    SizedBox(height: 4,),
                    Text(formattedDate!,style: Styles.textStyle14,),
                  ],
                ),
              ),

            ],
          ),
          SizedBox(height: 15,),
          Row(
            children: [
              Text('WorkOut Categories',style: Styles.textStyle18,),


            ],
          ),

        ],
      ),
    );
  }
}
