import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({Key? key}) : super(key: key);

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
                  duration: Duration(milliseconds: 300),
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
                    children: const [
                      CircleAvatar(
                        radius: 80,
                        backgroundImage: AssetImage("assets/images/dummy-profile-pic.png"),
                      ),
                      SizedBox(width: 50,),
                      Text('Guest',
                        style: TextStyle(
                          fontSize: 30,
                          fontWeight: FontWeight.bold,
                          color: Colors.white,
                        ),
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
                      children: const [
                        ListTile(
                          title: Text('Email Address'),
                          subtitle: Text("dubiafx@gmail.com"),
                          leading: Icon(Icons.email),
                        ),

                        Divider(
                          color: Colors.black26, thickness: 1,
                        ),

                        ListTile(
                          title: Text('Phone no'),
                          subtitle: Text("+2348136262413"),
                          leading: Icon(Icons.phone),
                        ),

                        Divider(
                          color: Colors.black26, thickness: 1,
                        ),

                        ListTile(
                          title: Text('Location'),
                          subtitle: Text("Plot 924 madiba street"),
                          leading: Icon(Icons.location_on_rounded),
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
