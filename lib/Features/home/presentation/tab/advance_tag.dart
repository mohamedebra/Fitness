import 'package:fitness/Features/home/presentation/widget/detiles_beginner_screen/deitls_beginner_screen.dart';
import 'package:fitness/Features/home/presentation/widget/detiles_beginner_screen/pdf_beginner.dart';
import 'package:fitness/core/unit/styles.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class Advance extends StatefulWidget {
  const Advance({Key? key}) : super(key: key);

  @override
  State<Advance> createState() => _AdvanceState();
}

class _AdvanceState extends State<Advance> {
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
    return ListView(
      physics: const NeverScrollableScrollPhysics(),
      children: [
        SizedBox(
          height: 260,
          child: Padding(
            padding: const EdgeInsets.all(20.0),
            child: InkWell(
              onTap: (){
                Navigator.push(context, MaterialPageRoute(builder: (context) => const DetailsBeginnerScreen()));
              },
              child:  Stack(
                alignment: Alignment.bottomLeft,
                children: [
                  Image(image: AssetImage('assets/images/healthy-lifestyle-fitness-sports-woman-running-sunrise-road-39709089.jpg'),height: 230,),
                  SizedBox(height: 10,),
                  Padding(
                    padding: EdgeInsets.all(10.0),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        Text('Day 01 - warm up',
                          style: Styles.textStyle18,

                        ),
                        SizedBox(height: 4,),
                        Text(formattedDate!,style: Styles.textStyle16),
                      ],
                    ),
                  ),

                ],
              ),
            ),
          ),
        ),

        const Padding(
          padding: EdgeInsets.symmetric(horizontal: 20),
          child: Text('Read more..',style: Styles.textStyle25,),
        ),
        SizedBox(
          height: 260,
          child: ListView.builder(
            scrollDirection: Axis.horizontal,
            itemBuilder: (context,index){
              return Padding(
                padding: const EdgeInsets.all(20.0),
                child: InkWell(
                  onTap: (){
                    Navigator.push(context, MaterialPageRoute(builder: (context) => PdfBeginner()));
                  },
                  child:  Stack(
                    children: [
                      Image(image: AssetImage('assets/images/Fitness-Trends-2021-c.jpg'),height: 230,),
                      SizedBox(height: 10,),
                      Padding(
                        padding: EdgeInsets.all(10.0),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: [
                            Text('Day 01 - warm up',
                              style: Styles.textStyle18,

                            ),
                            SizedBox(height: 4,),
                            Text(formattedDate!,style: Styles.textStyle16),
                          ],
                        ),
                      ),

                    ],
                  ),
                ),
              );
            },
            itemCount: 1,

          ),
        ),

      ],
    );
  }
}
