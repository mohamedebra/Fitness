import 'package:flutter/material.dart';


class CustomListViewItems extends StatelessWidget {
  const CustomListViewItems({Key? key, required this.imageUrl}) : super(key: key);
  final String imageUrl ;

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(16),
      child: AspectRatio(
        aspectRatio: 2.7 /4,
        child: Image(
            fit: BoxFit.fill,
            image: AssetImage(imageUrl),
        ),
      ),
    );
  }
}
