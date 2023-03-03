import 'package:flutter/material.dart';
import 'package:flutter_otp_text_field/flutter_otp_text_field.dart';
import 'package:food_ui/receipe_screen.dart';

import 'dashboard_screen.dart';
import 'login_screen.dart';

class OtpScreen extends StatefulWidget {
  const OtpScreen({Key? key}) : super(key: key);

  @override
  State<OtpScreen> createState() => _OtpScreenState();
}

class _OtpScreenState extends State<OtpScreen> {
  TextEditingController numberController = TextEditingController();
  String otpString = "";

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
            body: Padding(
      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 25),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const Text(
            'OTP Authentication',
            style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
          ),
          const SizedBox(
            height: 35,
          ),
          const Text(
            overflow: TextOverflow.visible,
            softWrap: true,
            'Please enter One Time Password received on mobile number',
            style: TextStyle(
              fontSize: 13,
              color: Colors.grey,
            ),
          ),
          const SizedBox(
            height: 30,
          ),
          OtpTextField(
            handleControllers: (controllers) => numberController,
            onCodeChanged: (value) {
              if (value.isEmpty) {
                otpString = otpString.substring(0, otpString.length - 1);
              } else {
                otpString += value;
              }
              print(otpString);
            },
            numberOfFields: 4,
            borderColor: Colors.black12,
            showFieldAsBox: true,
            // hasCustomInputDecoration: true,
            fieldWidth: 55,
            decoration: InputDecoration(border: OutlineInputBorder(borderRadius: BorderRadius.circular(10))),
          ),
          const SizedBox(
            height: 20,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              // OtpTimer(radius: 10, duration: 60, timeTextSize: 15),
              const Text(
                "Didn't Receive the code ?",
                style: TextStyle(
                  fontSize: 15,
                  color: Colors.grey,
                ),
              ),
              GestureDetector(
                  onTap: () {
                    Navigator.pop(context, MaterialPageRoute(builder: (context) {
                      return const LoginScreen();
                    }));
                  },
                  child: (const Text(
                    ' Resend',
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                      color: Colors.deepOrangeAccent,
                    ),
                  ))),
            ],
          ),
          const SizedBox(
            height: 20,
          ),
          ElevatedButton(
              onPressed: () {
                if (otpString.isNotEmpty && otpString.length == 4) {
                  Navigator.push(context, MaterialPageRoute(builder: (context) {
                    return DashboardScreen();
                  }));
                }
              },
              style: ButtonStyle(
                backgroundColor: MaterialStateProperty.all(Colors.deepOrangeAccent),
                minimumSize: MaterialStateProperty.all(
                  const Size.fromHeight(50),
                ),
              ),
              child: const Text(
                'Verify',
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 20,
                ),
              )),
          const SizedBox(
            height: 20,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                "+91-9327046771",
                style: TextStyle(
                  fontSize: 18,
                  color: Colors.grey.shade500,
                ),
              ),
              GestureDetector(
                  onTap: () {
                    Navigator.pop(context, MaterialPageRoute(builder: (context) {
                      return const LoginScreen();
                    }));
                  },
                  child: (const Text(
                    ' Change Number',
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                      color: Colors.deepOrangeAccent,
                    ),
                  ))),
            ],
          ),
        ],
      ),
    )));
  }
}
