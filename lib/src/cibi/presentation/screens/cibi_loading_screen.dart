import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class CibiScreen extends StatelessWidget {
  const CibiScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Center(
              child: Container(
                padding: const EdgeInsets.all(15),
                child: SvgPicture.asset("assets/logos/cibi.svg",
                    semanticsLabel: 'Acme Logo'),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
