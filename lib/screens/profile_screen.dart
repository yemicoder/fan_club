import 'package:fan_club/controllers/cloud_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

class ProfileScreen extends StatelessWidget {
   ProfileScreen({Key? key}) : super(key: key);

  final cloudController = Get.put(CloudController());
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey.withOpacity(0.1),
      body: CustomScrollView(
        slivers: [
          SliverAppBar(
            expandedHeight: 300,
            backgroundColor: Colors.purple,
            automaticallyImplyLeading: false,
            flexibleSpace: LayoutBuilder(builder: (context, constraints) {
              return FlexibleSpaceBar(
                title: AnimatedOpacity(
                  opacity: constraints.biggest.height <= 120 ? 1 : 0,
                  duration: const Duration(milliseconds: 300),
                  child: const Text('Account'),
                ),
                background: Container(
                  padding: const EdgeInsets.only(left: 40),
                  decoration: const BoxDecoration(
                      gradient: LinearGradient(colors: [
                        Colors.purple,
                        Colors.deepPurpleAccent,
                      ])),
                  child: Row(
                    children:  [
                      const CircleAvatar(
                        radius: 80,
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
                          ),)
                        ],
                      ),
                    ],
                  ),
                ),
              );
            }),
          ),
          SliverToBoxAdapter(
            child: Column(
              children: [
                const SizedBox(height: 20,),
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
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(20),
                    ),
                    child: Column(
                      children: [
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
                          subtitle: Text(cloudController.userData[2]),
                          leading: const Icon(Icons.phone),
                        ),

                        const Divider(
                          color: Colors.black26, thickness: 1,
                        ),

                        ListTile(
                          title: const Text('Full name'),
                          subtitle: Text("${cloudController.userData[0]} ${cloudController.userData[1]}"),
                          leading: const Icon(Icons.person),
                        ),
                      ],
                    ),
                  ),
                ),

                Text('Interests',
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
                    height: 260,
                    width: double.infinity,
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(20),
                    ),

                    child: Column(
                      children: const [
                        ListTile(
                          title: Text('Football'),
                          leading: Icon(Icons.sports_baseball),
                        ),

                        Divider(
                          color: Colors.black26, thickness: 1,
                        ),

                        ListTile(
                          title: Text('Basketball'),
                          leading: Icon(Icons.sports_basketball),
                        ),

                        Divider(
                          color: Colors.black26, thickness: 1,
                        ),

                        ListTile(
                          title: Text('Wrestling'),
                          leading: Icon(Icons.line_axis),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
