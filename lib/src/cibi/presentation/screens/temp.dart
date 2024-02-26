import 'package:flutter/material.dart';

class ProgressPage extends StatefulWidget {
  @override
  _ProgressPageState createState() => _ProgressPageState();
}

class _ProgressPageState extends State<ProgressPage> {
  PageController _pageController = PageController(initialPage: 0);
  double _progress = 0.0; // Initial progress value
  int _currentPage = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Progress Indicator Example'),
      ),
      body: Column(
        children: [
          LinearProgressIndicator(
            value: _progress,
            minHeight: 5.0, // Adjust the height of the progress indicator
            backgroundColor: Colors.grey[300], // Change background color
            valueColor: AlwaysStoppedAnimation<Color>(
                Colors.blue), // Change progress color
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
    );
  }
}

class PhoneNumberScreen extends StatelessWidget {
  final PageController pageController;

  const PhoneNumberScreen({required this.pageController});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text('Enter Phone Number'),
          // Your phone number input field
          ElevatedButton(
            onPressed: () {
              // Simulate moving to the next page (OTPScreen) only if phone number is entered
              // For demonstration purpose, the button directly moves to the next page without validating the phone number
              pageController.nextPage(
                duration: Duration(milliseconds: 500),
                curve: Curves.ease,
              );
            },
            child: Text('Next'),
          ),
        ],
      ),
    );
  }
}

class OTPScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text('Enter OTP'),
          // Your OTP input field
        ],
      ),
    );
  }
}
