import 'package:cibi/src/constants.dart';
import 'package:flutter/material.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  int _currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: Colors.white,
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Expanded(
            child: PageView.builder(
              itemCount: 3,
              scrollDirection: Axis.horizontal,
              onPageChanged: (index) {
                setState(() {
                  _currentIndex = index;
                });
              },
              itemBuilder: (_, index) {
                return Container(
                  padding: const EdgeInsets.only(top: 50),
                  width: size.width,
                  height: size.height / 1.5,
                  decoration: BoxDecoration(
                    image: DecorationImage(
                      image: AssetImage(
                        "assets/images/splash/splash${index + 1}.png",
                      ),
                      fit: BoxFit.contain,
                    ),
                  ),
                );
              },
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: List.generate(
              3,
              (indexSlider) {
                return Center(
                  child: Container(
                    margin: const EdgeInsets.only(left: 2, right: 2),
                    width: _currentIndex == indexSlider ? 25 : 8,
                    height: 6,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(8),
                      color: _currentIndex == indexSlider
                          ? Colors.orange
                          : Colors.orange.withOpacity(0.3),
                    ),
                  ),
                );
              },
            ),
          ),
          const SizedBox(
            height: 10,
          ),
          Container(
            padding: const EdgeInsets.only(left: 15, right: 15),
            child: Text(
              "Lorem ipsum dolor sit amet consectetur.",
              style: TextStyle(
                  color: Colors.black,
                  fontWeight: FontWeight.bold,
                  fontSize: 30),
            ),
          ),
          const SizedBox(
            height: 10,
          ),
          Container(
            padding: const EdgeInsets.only(left: 15, right: 15),
            child: Text(
              "Lorem ipsum dolor sit amet consectetur. Cras odio adipiscing at molestie id id at erat turpis.",
              style: TextStyle(
                  color: Colors.grey.shade700,
                  fontWeight: FontWeight.w300,
                  fontSize: 18),
            ),
          ),
          const SizedBox(
            height: 20,
          ),
          MaterialButton(
            onPressed: () {},
            child: Container(
              padding: const EdgeInsets.only(left: 10, right: 10),
              width: size.width,
              height: 70,
              child: const Center(
                child: Text(
                  "Get Started",
                  style: TextStyle(color: Colors.white, fontSize: 20),
                ),
              ),
              decoration: BoxDecoration(
                  color: AppColors.primary,
                  borderRadius: BorderRadius.circular(20)),
            ),
          ),
          const SizedBox(height: 15),
        ],
      ),
    );
  }
}
