import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

import '../widgets/sport_category_tile.dart';

class HomeScreen extends StatelessWidget {
  HomeScreen({Key? key}) : super(key: key);

  @override

  final List clubItems = [
    ["Swimming", "4.00", "assets/images/swimming.png", Colors.blue],
    ["Track", "2.50", "assets/images/track.png", Colors.green],
    ["Football", "12.80", "assets/images/football.png", Colors.brown],
    ["Basketball", "1.00", "assets/images/basketball.png", Colors.blue],
    ["Cycling", "3.00", "assets/images/cycling.png", Colors.cyan],
    ["Tennis", "2.00", "assets/images/tennis.png", Colors.pink],
  ];

  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Container(
          margin: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text("Hey Yemi,", style: GoogleFonts.adventPro(
                    fontSize: 25,
                    fontWeight: FontWeight.bold
                  ),),
                  ClipRRect(
                    borderRadius: BorderRadius.circular(10),
                    child: Image(image: AssetImage("assets/images/dummy-profile-pic.png"), height: 5.h,),
                  ),
                ],
              ),
              SizedBox(height: 3.h,),
              Text("What are you\nup to today?", style: GoogleFonts.adventPro(
                fontSize: 20.sp
              ),),
              SizedBox(height: 4.h,),

              Expanded(
                    child: GridView.builder(
                        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2, childAspectRatio:  2 / 2.3),
                        itemCount: clubItems.length,
                        itemBuilder: (context, index) => SportCategoryTile(
                          itemName: clubItems[index][0],
                          imagePath: clubItems[index][2],
                          color: clubItems[index][3], onPressed: () {  },),),
                  ),
            ],
          ),
        ),
      ),
    );
  }
}
