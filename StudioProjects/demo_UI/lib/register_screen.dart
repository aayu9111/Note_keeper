import 'package:demo_ui/login_screen.dart';
import 'package:flutter/material.dart';
import 'package:demo_ui/home_screen.dart';

class RegisterScreen extends StatefulWidget {
  const RegisterScreen({Key? key}) : super(key: key);

  @override
  State<RegisterScreen> createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  final _formKey = GlobalKey<FormState>();
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();
  bool isObscureText = true;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
      key: _scaffoldKey,
      resizeToAvoidBottomInset: false,
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 25),
        child: Form(
          key: _formKey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              IconButton(
                icon: const Icon(Icons.arrow_back_sharp, size: 35, color: Colors.orangeAccent),
                onPressed: () {
                  Navigator.pop(context);
                },
              ),
              const SizedBox(
                height: 30,
              ),
              const Text(
                'Create Account ',
                style: TextStyle(
                  fontSize: 35,
                  fontFamily: 'NotoSerifToto',
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Card(
                    child: Row(
                      children: [
                        const SizedBox(
                          width: 20,
                        ),
                        const Icon(Icons.person),
                        const SizedBox(
                          width: 15,
                        ),
                        Expanded(
                          child: TextFormField(
                            validator: (value) {
                              if (value!.isEmpty) {
                                return 'Name required';
                              }
                              return null;
                            },
                            onChanged: (value) => print(value),
                            decoration: const InputDecoration(
                              border: OutlineInputBorder(
                                borderSide: BorderSide.none,
                              ),
                              hintText: 'Full Name',
                              hintStyle: TextStyle(color: Colors.grey),
                            ),
                          ),
                        )
                      ],
                    ),
                  ),
                ],
              ),
              const SizedBox(
                height: 10,
              ),
              Card(
                child: Row(
                  children: [
                    const SizedBox(
                      width: 20,
                    ),
                    const Icon(Icons.email_outlined),
                    const SizedBox(
                      width: 15,
                    ),
                    Expanded(
                      child: TextFormField(
                        autovalidateMode: AutovalidateMode.onUserInteraction,
                        validator: (value) {
                          if (value!.isEmpty) {
                            return 'Email required';
                          } else if (value.contains('aayushi')) {
                            return null;
                          } else {
                            return 'invalid';
                          }
                        }, // } else {
                        //   print(" sfdfdfhdshdh ");
                        // }
                        // onChanged: (value) => print(value),
                        decoration: const InputDecoration(
                          border: OutlineInputBorder(
                            borderSide: BorderSide.none,
                          ),
                          hintText: 'Email',
                          hintStyle: TextStyle(color: Colors.grey),
                        ),
                      ),
                    )
                  ],
                ),
              ),
              const SizedBox(
                height: 10,
              ),
              Card(
                child: Row(
                  children: [
                    const SizedBox(
                      width: 20,
                    ),
                    const Icon(Icons.password),
                    const SizedBox(
                      width: 15,
                    ),
                    Expanded(
                      child: TextFormField(
                        validator: (value) {
                          if (value!.isEmpty || !RegExp(r'^[0-9]+$').hasMatch(value)) {
                            return 'Password Required';
                          }
                          {
                            return null;
                          }
                        },
                        autovalidateMode: AutovalidateMode.onUserInteraction,
                        onChanged: (value) => print(value),
                        obscureText: isObscureText,
                        decoration: InputDecoration(
                          border: const OutlineInputBorder(
                            borderSide: BorderSide.none,
                          ),
                          suffixIcon: IconButton(
                            onPressed: () {
                              setState(() {
                                isObscureText = isObscureText ? false : true;
                              });
                            },
                            icon: Icon(isObscureText ? Icons.visibility_outlined : Icons.visibility_off_outlined),
                          ),
                          hintText: 'Password',
                          hintStyle: const TextStyle(color: Colors.grey),
                        ),
                      ),
                    )
                  ],
                ),
              ),
              const SizedBox(
                height: 10,
              ),
              Card(
                child: Row(
                  children: [
                    const SizedBox(
                      width: 20,
                    ),
                    const Icon(Icons.password),
                    const SizedBox(
                      width: 15,
                    ),
                    Expanded(
                      child: TextFormField(
                        validator: (value) {
                          if (value!.isEmpty) {
                            return 'password req';
                          }
                          {
                            return null;
                          }
                        },
                        onChanged: (value) => print(value),
                        decoration: InputDecoration(
                          border: const OutlineInputBorder(
                            borderSide: BorderSide.none,
                          ),
                          suffixIcon: IconButton(
                            onPressed: () {
                              setState(() {
                                isObscureText = isObscureText ? false : true;
                              });
                            },
                            icon: Icon(isObscureText ? Icons.visibility_outlined : Icons.visibility_off_outlined),
                          ),
                          hintText: 'Confirm Password',
                          hintStyle: const TextStyle(
                            color: Colors.grey,
                          ),
                        ),
                      ),
                    )
                  ],
                ),
              ),
              const SizedBox(
                height: 30,
              ),
              Align(
                alignment: Alignment.centerRight,
                child: ElevatedButton(
                    onPressed: () {
                      if (_formKey.currentState!.validate()) {
                        Navigator.push(context, MaterialPageRoute(builder: (context) {
                          return const HomeScreen();
                        }));
                      }
                    },
                    style: ButtonStyle(
                        backgroundColor: MaterialStateProperty.all(Colors.orangeAccent),
                        minimumSize: MaterialStateProperty.all(Size(40, 40)),
                        maximumSize: MaterialStateProperty.all(Size(150, 50)),
                        shape: MaterialStateProperty.all<RoundedRectangleBorder>(RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(50.0), side: const BorderSide(color: Colors.amber)))),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        const Text(
                          'SIGN UP',
                          style: TextStyle(fontSize: 18, fontFamily: 'NotoSerifToto'),
                        ),
                        const SizedBox(
                          width: 18,
                        ),
                        const Icon(Icons.arrow_forward)
                      ],
                    )),
              ),
              const Spacer(),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Text(
                    "Already have an account?",
                    style: TextStyle(
                        fontSize: 20, fontWeight: FontWeight.bold, color: Colors.grey, fontFamily: 'NotoSerifToto'),
                  ),
                  GestureDetector(
                      onTap: () {
                        Navigator.pop(context, MaterialPageRoute(builder: (context) {
                          return const LoginScreen();
                        }));
                      },
                      child: (const Text(
                        ' Sign In',
                        style: TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                            color: Colors.orangeAccent,
                            fontFamily: 'NotoSerifToto'),
                      ))),
                ],
              ),
            ],
          ),
        ),
      ),
    ));
  }
}
