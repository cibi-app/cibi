import 'package:cibi/src/constants.dart';
import 'package:flutter/material.dart';

class SignUp extends StatefulWidget {
  static const String routeName = "sign-up";

  const SignUp({super.key});

  @override
  State<SignUp> createState() => _SignUpState();
}

class _SignUpState extends State<SignUp> {
  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return SafeArea(
        child: Scaffold(
      backgroundColor: AppColors.white,
      body: Padding(
        padding: const EdgeInsets.only(top: 50, left: 10, right: 10),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const SizedBox(height: 60),
              const Image(image: AssetImage("assets/logos/logo.png")),
              const SizedBox(height: 20),
              Text(
                "Sign in to cibi",
                style: TextStyle(color: AppColors.black, fontSize: 16),
              ),
              const SizedBox(height: 20),
              InkWell(
                onTap: () {},
                child: Container(
                  height: 60,
                  width: size.width,
                  decoration: BoxDecoration(
                      borderRadius: const BorderRadius.all(Radius.circular(15)),
                      border: Border.all(color: Colors.grey, width: 1)),
                  child: const Center(
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        SizedBox(
                            height: 30,
                            width: 30,
                            child: Image(
                                image: AssetImage("assets/logos/google.png"))),
                        Text(
                          "Continue with Google",
                          style: TextStyle(color: Colors.black, fontSize: 15),
                        )
                      ],
                    ),
                  ),
                ),
              ),
              const SizedBox(height: 20),
              InkWell(
                onTap: () {},
                child: Container(
                  height: 60,
                  width: size.width,
                  decoration: BoxDecoration(
                      borderRadius: const BorderRadius.all(Radius.circular(15)),
                      border: Border.all(color: Colors.grey, width: 1)),
                  child: const Center(
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        SizedBox(
                            height: 25,
                            width: 25,
                            child: Image(
                                image: AssetImage("assets/logos/apple.png"))),
                        Text(
                          "Continue with Apple",
                          style: TextStyle(color: Colors.black, fontSize: 15),
                        )
                      ],
                    ),
                  ),
                ),
              ),
              const SizedBox(height: 30),
              Row(
                children: [
                  SizedBox(
                    width: size.width / 2.2,
                    child: const Divider(
                      thickness: 2,
                      indent: 20,
                      endIndent: 20,
                      color: Colors.grey,
                      height: 20,
                    ),
                  ),
                  const Text(
                    "or",
                    style: TextStyle(color: Colors.grey),
                  ),
                  SizedBox(
                    width: size.width / 2.2,
                    child: const Divider(
                      thickness: 2,
                      indent: 20,
                      endIndent: 20,
                      color: Colors.grey,
                      height: 20,
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 20),
              InkWell(
                onTap: () {},
                child: Container(
                  height: 60,
                  width: size.width,
                  decoration: BoxDecoration(
                      color: AppColors.primary,
                      borderRadius: const BorderRadius.all(Radius.circular(15)),
                      border: Border.all(color: Colors.grey, width: 1)),
                  child: Center(
                      child: Text(
                    "Sign in with email",
                    style: TextStyle(
                        color: AppColors.white,
                        fontSize: 15,
                        fontWeight: FontWeight.w600),
                  )),
                ),
              ),
              const SizedBox(
                height: 30,
              ),
              Text(
                "Don't need an account?",
                style: TextStyle(color: Colors.grey),
              ),
              TextButton(
                  onPressed: () {},
                  child: Text(
                    "Continue as guest one time",
                    style: TextStyle(
                        color: AppColors.primary, fontWeight: FontWeight.w600),
                  )),
              SizedBox(height: size.height / 6),
              const Text(
                "By clicking any option, you accept",
                style:
                    TextStyle(color: Colors.grey, fontWeight: FontWeight.w400),
              ),
              const Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    "Privacy Policy",
                    style: TextStyle(
                        decoration: TextDecoration.underline,
                        color: Colors.grey,
                        fontWeight: FontWeight.w400),
                  ),
                  Text(
                    " rules of our company",
                    style: TextStyle(
                        color: Colors.grey, fontWeight: FontWeight.w400),
                  )
                ],
              )
            ],
          ),
        ),
      ),
    ));
  }
}
