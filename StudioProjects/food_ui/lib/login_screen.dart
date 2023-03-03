import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'otp_screen.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final _formKey = GlobalKey<FormState>();
  TextEditingController numberController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
            body: Padding(
      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 25),
      child: Form(
        key: _formKey,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text(
              'Welcome To Creamy',
              style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
            ),
            const SizedBox(
              height: 35,
            ),
            const Text(
              textAlign: TextAlign.center,
              overflow: TextOverflow.visible,
              softWrap: true,
              'Please enter 10 digit mobile number to proceed further ,'
              ' we will send an Otp for verification',
              style: TextStyle(
                fontSize: 12,
                color: Colors.grey,
              ),
            ),
            const SizedBox(
              height: 40,
            ),
            TextFormField(
              keyboardType: TextInputType.phone,
              inputFormatters: [
                LengthLimitingTextInputFormatter(10),
                FilteringTextInputFormatter.digitsOnly,
              ],
              controller: numberController,
              onChanged: (value) {
                setState(() {});
              },
              decoration: InputDecoration(
                  border: const UnderlineInputBorder(borderSide: BorderSide.none),
                  filled: true,
                  fillColor: Colors.grey.shade300,
                  hintText: 'Mobile Number',
                  suffixIcon: Icon(
                    Icons.check_circle_rounded,
                    color: RegExp(r'^[0-9]+$').hasMatch(numberController.text) &&
                            RegExp(r'^([2-9]{2}[0-9]{8})+$').hasMatch(numberController.text)
                        ? Colors.green
                        : Colors.red,
                  )),
            ),
            const SizedBox(
              height: 30,
            ),
            ElevatedButton(
                onPressed: () {
                  Navigator.push(context, MaterialPageRoute(builder: (context) {
                    return const OtpScreen();
                  }));
                },
                style: ButtonStyle(
                  backgroundColor: MaterialStateProperty.all(Colors.deepOrangeAccent),
                  minimumSize: MaterialStateProperty.all(
                    const Size.fromHeight(50),
                  ),
                ),
                child: const Text(
                  'Send OTP',
                  style: TextStyle(fontWeight: FontWeight.bold),
                ))
          ],
        ),
      ),
    )));
  }
}
