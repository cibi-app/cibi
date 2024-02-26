import 'package:cibi/src/constants.dart';
import 'package:cibi/src/cibi/presentation/screens/otp_screen.dart';
import 'package:cibi/src/cibi/presentation/screens/phone_number_screen.dart';
import 'package:flutter/material.dart';

class PhoneOnboaring extends StatefulWidget {
  const PhoneOnboaring({super.key});

  @override
  State<PhoneOnboaring> createState() => _PhoneOnboaringState();
}

class _PhoneOnboaringState extends State<PhoneOnboaring> {
  PageController _pageController = PageController(initialPage: 0);
  double _progress = 0.0; // Initial progress value
  int _currentPage = 0;
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
          backgroundColor: AppColors.white,
          body: Padding(
            padding: const EdgeInsets.only(left: 8.0, right: 8, top: 40),
            child: Column(
              children: [
                Padding(
                  padding: const EdgeInsets.only(left: 10, right: 10),
                  child: LinearProgressIndicator(
                    value: _progress,
                    minHeight: 5.0,
                    backgroundColor: Colors.grey[300],
                    valueColor:
                        AlwaysStoppedAnimation<Color>(AppColors.primary),
                  ),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    IconButton(
                        onPressed: () {},
                        icon: Icon(
                          Icons.arrow_back,
                          color: AppColors.black,
                        )),
                    IconButton(
                        onPressed: () {},
                        icon: Icon(
                          Icons.clear,
                          color: AppColors.black,
                        ))
                  ],
                ),
                Expanded(
                  child: PageView.builder(
                    physics: NeverScrollableScrollPhysics(), // Prevent swiping
                    controller: _pageController,
                    itemCount: 2, // Number of pages (phone number and OTP)
                    onPageChanged: (int page) {
                      setState(() {
                        _currentPage = page;
                        _progress = (_currentPage + 1) /
                            2; // Update progress based on current page
                      });
                    },
                    itemBuilder: (BuildContext context, int index) {
                      return index == 0
                          ? PhoneNumberScreen(pageController: _pageController)
                          : OTPScreen();
                    },
                  ),
                ),
              ],
            ),
          )),
    );
  }
}
