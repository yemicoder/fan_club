
import 'package:fan_club/controllers/cloud_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

class ProfileScreen extends StatelessWidget {
   ProfileScreen({Key? key}) : super(key: key);


  final cloudController = Get.put(CloudController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey.withOpacity(0.1),
      body: Column(
          children: [
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 40, vertical: 30),
              decoration: const BoxDecoration(
                  gradient: LinearGradient(colors: [
                    Colors.purple,
                    Colors.deepPurpleAccent,
                  ])),
              child: Row(
                children:  [
                  const CircleAvatar(
                    radius: 50,
                    backgroundImage: AssetImage("assets/images/dummy-profile-pic.png"),
                  ),
                  const SizedBox(width: 50,),
                  Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Text('Welcome',
                        style: TextStyle(
                          fontSize: 14,
                          fontWeight: FontWeight.bold,
                          color: Colors.grey,
                        ),
                      ),
                      Text(cloudController.userData[1], style: const TextStyle(
                          color: Colors.white,
                          fontSize: 25
                      ),),
                    ],
                  ),
                ],
              ),
            ),

            SizedBox(height: 2.h,),
            Center(child: Text("Your Interests", style: GoogleFonts.adventPro(
              fontSize: 30,
              color: Colors.grey,
              fontWeight: FontWeight.bold
            ),)),

            SizedBox(
              height: 8.h,
              child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  itemCount: cloudController.userInterests.length,
                  shrinkWrap: true,
                  itemBuilder: (BuildContext context, int index) {
                    return (cloudController.userInterests.isNotEmpty) ? Padding(
                      padding: const EdgeInsets.only(left: 5.0),
                      child: Container(
                        padding: const EdgeInsets.symmetric(horizontal: 5),
                        child: Row(
                          //crossAxisAlignment: CrossAxisAlignment.center,
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Container(
                                height: 4.h,
                                width: 25.w,
                                padding: const EdgeInsets.symmetric(horizontal: 15,
                                    vertical: 7),
                                decoration: BoxDecoration(
                                    color: Colors.purple.withOpacity(0.2),
                                    borderRadius: BorderRadius.circular(20)
                                ),
                                child: Text(cloudController.
                                userInterests[index].toString(), style:
                                const TextStyle(
                                    color: Colors.purple
                                ),)),
                          ],
                        ),
                      ),
                    ) : const CircularProgressIndicator(color: Colors.white,);
                  }),),

                Text('Account Info',
                  style: GoogleFonts.adventPro(
                      fontSize: 30,
                      fontWeight: FontWeight.bold,
                      color: Colors.black38
                  ),
                ),



            Padding(
              padding: const EdgeInsets.all(20.0),
              child: Container(
                padding: const EdgeInsets.all(30),
                height: 310,
                width: double.infinity,
                decoration: BoxDecoration(
                  color: Colors.grey[300],
                  borderRadius: BorderRadius.circular(20),
                ),
                child: Column(
                  children: [

                    ListTile(
                      title: const Text('Full name'),
                      subtitle: Text("${cloudController.userData[1]} ${cloudController.userData[0]}"),
                      leading: const Icon(Icons.person),
                    ),

                    const Divider(
                      color: Colors.black26, thickness: 1,
                    ),

                    ListTile(
                      title: const Text("Email address"),
                      subtitle: Text(cloudController.userData[3]),
                      leading: const Icon(Icons.email),
                    ),

                    const Divider(
                      color: Colors.black26, thickness: 1,
                    ),

                    ListTile(
                      title: const Text('Phone no'),
                      subtitle: Text(cloudController.userData[6]),
                      leading: const Icon(Icons.phone),
                    ),


                  ],
                ),
              ),
            ),




              ],
            ),

    );
  }
}
