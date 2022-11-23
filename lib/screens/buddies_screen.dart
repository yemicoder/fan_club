import 'package:flutter/material.dart';

class BuddiesScreen extends StatelessWidget {
  const BuddiesScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: const [
            Center(child: Text('Buddies'))
          ],
        ),
      ),
    );
  }
}
