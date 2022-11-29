import 'package:fan_club/controllers/cloud_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

import '../widgets/sport_category_tile.dart';

class HomeScreen extends StatelessWidget {
  HomeScreen({Key? key}) : super(key: key);

  @override

  final List clubItems = [
    ["Swimming", "4.00", "assets/images/swimming.png", Colors.purple],
    ["Track", "2.50", "assets/images/track.png", Colors.red],
    ["Football", "12.80", "assets/images/football.png", Colors.orange],
    ["Basketball", "1.00", "assets/images/basketball.png", Colors.deepPurple],
    ["Cycling", "3.00", "assets/images/cycling.png", Colors.cyan],
    ["Tennis", "2.00", "assets/images/tennis.png", Colors.pink],
  ];

  final cloudController = Get.put(CloudController());

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
                  Text("Hey ${cloudController.data[1]},", style: GoogleFonts.adventPro(
                    fontSize: 25,
                    fontWeight: FontWeight.bold
                  ),),
                  ClipRRect(
                    borderRadius: BorderRadius.circular(10),
                    child: Image(image: const AssetImage("assets/images/dummy-profile-pic.png"), height: 5.h,),
                  ),
                ],
              ),
              SizedBox(height: 3.h,),
              Text("What are you\nup to today?", style: GoogleFonts.adventPro(
                fontSize: 20.sp
              ),),
              SizedBox(height: 4.h,),

              Container(
                height: 25.h,
                width: double.infinity,
                decoration: BoxDecoration(
                  color: Colors.grey[200],
                  borderRadius: BorderRadius.circular(30),
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    //SizedBox(width: 10.w,),
                  const Image(image: AssetImage("assets/images/fan.jpeg"), height: 150,),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        SizedBox(height: 4.h,),
                        Text("Today's Event", style: GoogleFonts.adventPro(
                          color: Colors.deepOrange,
                          fontSize: 20.sp,
                          fontWeight: FontWeight.w400,
                        ),
                        ),
                        SizedBox(height: 1.h,),
                        const Text("Fan's meet and greet"),
                        SizedBox(height: 1.h,),
                        Row(
                          children: const [
                            Icon(Icons.location_on, color: Colors.deepOrange,),
                            Text("Qatar"),
                          ],
                        ),
                        SizedBox(height: 1.h,),
                        ElevatedButton(onPressed: () {},
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.deepOrange
                        ),
                            child: Text("Reserve a seat"))
                      ],
                    )
                  ],
                ),
              ),

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
