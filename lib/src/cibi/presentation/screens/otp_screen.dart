import 'dart:async';

import 'package:cibi/src/cibi/presentation/screens/home_screen.dart';
import 'package:cibi/src/cibi/presentation/utils/button/custom_button.dart';
import 'package:cibi/src/constants.dart';
import 'package:flutter/material.dart';
import 'package:pinput/pinput.dart';

class OTPPage extends StatefulWidget {
  const OTPPage({Key? key}) : super(key: key);

  @override
  State<OTPPage> createState() => _OTPPageState();
}

class _OTPPageState extends State<OTPPage> {
  bool invalidOtp = false;
  int resendTime = 60;
  late Timer countdownTimer;
  TextEditingController pinController = TextEditingController();

  @override
  void initState() {
    startTimer();
    super.initState();
  }

  startTimer() {
    countdownTimer = Timer.periodic(const Duration(seconds: 1), (timer) {
      setState(() {
        resendTime = resendTime - 1;
      });
      if (resendTime < 1) {
        countdownTimer.cancel();
      }
    });
  }

  stopTimer() {
    if (countdownTimer.isActive) {
      countdownTimer.cancel();
    }
  }

  final defaultPinTheme = PinTheme(
    width: 56,
    height: 60,
    textStyle: const TextStyle(
      fontSize: 22,
      color: Colors.black,
    ),
    decoration: BoxDecoration(
      color: Colors.white,
      borderRadius: BorderRadius.circular(12),
      border: Border.all(color: Colors.grey),
    ),
  );
  bool otpLength = true;
  String strFormatting(n) => n.toString().padLeft(2, '0');
  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Scaffold(
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.only(left: 8.0, right: 8),
          child: Column(
            children: [
              const Text(
                'Enter the code we texted you',
                style: TextStyle(fontSize: 28, fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 20),
              const Text(
                'Enter the verification code  we sent',
                style: TextStyle(fontSize: 14, color: Colors.grey),
              ),
              const SizedBox(height: 20),
              Pinput(
                controller: pinController,
                length: 6,
                defaultPinTheme: defaultPinTheme,
                focusedPinTheme: defaultPinTheme.copyWith(
                  decoration: defaultPinTheme.decoration!.copyWith(
                    border: Border.all(color: AppColors.primary),
                  ),
                ),
                onCompleted: (pin) {
                  print("this is the $pin");
                },
              ),
              const SizedBox(height: 40),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Text(
                    "Haven't received OTP yet?",
                    style: TextStyle(fontSize: 14, color: Colors.grey),
                  ),
                  const SizedBox(width: 10),
                  resendTime == 0
                      ? InkWell(
                          onTap: () {
                            // Resend OTP Code
                            invalidOtp = false;
                            resendTime = 60;
                            startTimer();
                            //
                          },
                          child: const Text(
                            'Resend',
                            style: TextStyle(color: Colors.red, fontSize: 18),
                          ),
                        )
                      : const SizedBox()
                ],
              ),
              const SizedBox(height: 10),
              resendTime != 0
                  ? Text(
                      '${strFormatting(resendTime)} second(s)',
                      style: TextStyle(fontSize: 18, color: AppColors.primary),
                    )
                  : const SizedBox(),
              const SizedBox(height: 5),
              Text(
                !otpLength ? 'Enter All Fields!' : '',
                style: const TextStyle(fontSize: 20, color: Colors.red),
              ),
              Text(
                invalidOtp ? 'Invalid otp!' : '',
                style: const TextStyle(fontSize: 20, color: Colors.red),
              ),
              SizedBox(height: size.height / 2.4),
              CustomButtom(
                  text: "Verify",
                  width: size.width,
                  onTap: () {
                    final otp = pinController.text;
                    print(otp);
                    if (otp.length != 6) {
                      setState(() {
                        otpLength = false;
                      });
                    } else if (otp == '1989') {
                      // Go to welcome

                      stopTimer();
                      Navigator.of(context).pushReplacement(
                        MaterialPageRoute(
                          builder: (context) => const HomeScreen(),
                        ),
                      );
                    } else {
                      setState(() {
                        invalidOtp = true;
                        otpLength = true;
                      });
                    }
                    //
                  }),
              const SizedBox(height: 50)
            ],
          ),
        ),
      ),
    );
  }
}
