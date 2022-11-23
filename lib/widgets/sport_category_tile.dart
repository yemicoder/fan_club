import 'package:flutter/material.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

class SportCategoryTile extends StatelessWidget {

  final String itemName;
  final String imagePath;
  final color;
  void Function()? onPressed;

  SportCategoryTile({Key? key,
    required this.itemName,
    required this.imagePath,
    required this.color, required this.onPressed}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8),
      child: Container(
        decoration: BoxDecoration(
            color: color[300],
            borderRadius: BorderRadius.circular(12)
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Text(itemName, style: TextStyle(
              color: Colors.white,
              fontSize: 17.sp,
            ),),
            Image.asset(imagePath,
              height: 120,
            alignment: Alignment.bottomCenter,),
          ],
        ),
      ),
    );
  }
}
