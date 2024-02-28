import 'package:cibi/src/constants.dart';
import 'package:flutter/material.dart';
import 'package:country_picker/country_picker.dart';

class PhoneNumberScreen extends StatefulWidget {
  final PageController pageController;

  const PhoneNumberScreen({required this.pageController});

  @override
  State<PhoneNumberScreen> createState() => _PhoneNumberScreenState();
}

class _PhoneNumberScreenState extends State<PhoneNumberScreen> {
  Country _selectedCountry = Country.worldWide;
  TextEditingController phone = TextEditingController();
  bool invalidNumber = false;
  bool invalidCountry = false;

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Column(
      children: [
        Text(
          "Let's get started!",
          style: TextStyle(
              color: AppColors.black,
              fontWeight: FontWeight.bold,
              fontSize: 30),
        ),
        Text(
          "Enter your phone number,We will",
          style: TextStyle(
              color: Colors.grey, fontWeight: FontWeight.w500, fontSize: 16),
        ),
        Text(
          "send you a confirmation code there.",
          style: TextStyle(
              color: Colors.grey, fontWeight: FontWeight.w500, fontSize: 16),
        ),
        const SizedBox(height: 25),
        Row(
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text(
                  "Phone Number",
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
                Container(
                  width: size.width / 3,
                  height: 60,
                  padding: const EdgeInsets.only(left: 10, right: 10),
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      border: Border.all(
                        color: Colors.grey.shade400,
                        width: 1,
                      )),
                  child: InkWell(
                    onTap: () {
                      showCountryPicker(
                        context: context,
                        showPhoneCode: true,
                        onSelect: (Country country) {
                          print('Select country: ${country.displayName}');
                          setState(() {
                            _selectedCountry = country;
                          });
                        },
                      );
                    },
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Row(
                          children: [
                            ClipRect(
                              child: Text(
                                "${_selectedCountry.flagEmoji}",
                                style: TextStyle(fontSize: 25),
                              ),
                            ),
                            const SizedBox(width: 5),
                            Text(
                              '+${_selectedCountry.phoneCode}',
                              style: const TextStyle(
                                fontSize: 16,
                                color: Colors.grey,
                              ),
                            ),
                          ],
                        ),
                        const Icon(
                          Icons.keyboard_arrow_down_rounded,
                          color: Colors.grey,
                        )
                      ],
                    ),
                  ),
                ),
                Text(
                  !invalidCountry ? "" : "Invalid Country Code",
                  style: const TextStyle(fontSize: 15, color: Colors.red),
                ),
              ],
            ),
            const SizedBox(width: 10),
            Column(
              children: [
                Container(
                  height: 60,
                  width: size.width / 1.8,
                  margin: const EdgeInsets.only(top: 20),
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      border: Border.all(
                        color: Colors.grey.shade400,
                        width: 1,
                      )),
                  child: Center(
                    child: TextField(
                      controller: phone,
                      keyboardType:
                          TextInputType.number, // Set keyboard type to number
                      maxLength: 10, // Limit the maximum length to 10 digits
                      decoration: InputDecoration(
                        hintText: "Mobile number",
                        counterText: '',
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10.0),
                          borderSide: BorderSide.none, // No border line
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10.0),
                          borderSide: BorderSide.none, // No border line
                        ),
                        enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10.0),
                          borderSide: BorderSide.none, // No border line
                        ),
                      ),
                    ),
                  ),
                ),
                Text(
                  !invalidNumber ? "" : "Invalid Phone Number",
                  style: const TextStyle(fontSize: 15, color: Colors.red),
                ),
              ],
            ),
          ],
        ),
        const Spacer(),
        InkWell(
          onTap: () {
            print(_selectedCountry.countryCode);
            if (phone.text.trim().length != 10) {
              setState(() {
                invalidNumber = true;
                invalidCountry = false;
              });
            } else if (_selectedCountry.countryCode == "WW") {
              setState(() {
                invalidCountry = true;
                invalidNumber = false;
              });
            } else {
              setState(() {
                invalidCountry = false;
                invalidNumber = false;
              });
              widget.pageController.nextPage(
                duration: Duration(milliseconds: 500),
                curve: Curves.ease,
              );
            }
          },
          child: Container(
            height: 60,
            width: size.width,
            decoration: BoxDecoration(
                color: AppColors.primary,
                borderRadius: const BorderRadius.all(Radius.circular(15)),
                border: Border.all(color: Colors.grey, width: 1)),
            child: Center(
                child: Text(
              "Continue",
              style: TextStyle(
                  color: AppColors.white,
                  fontSize: 15,
                  fontWeight: FontWeight.w600),
            )),
          ),
        ),
        const SizedBox(height: 10),
      ],
    );
  }
}
