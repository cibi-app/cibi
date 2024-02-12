import 'package:flutter/material.dart';

class CibiScreen extends StatelessWidget {
  const CibiScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Center(
              child: Container(
                padding: const EdgeInsets.all(15),
                child: const Image(image: AssetImage('assets/logos/cibi.png')),
              ),
            ),
            const Text(
              "The next-gen social reward hub for your dining",
              style: TextStyle(color: Colors.white),
            ),
            const Text(
              "journey that you were looking for.",
              style: TextStyle(color: Colors.white),
            ),
          ],
        ),
      ),
    );
  }
}
