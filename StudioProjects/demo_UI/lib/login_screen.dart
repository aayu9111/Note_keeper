import 'package:demo_ui/home_screen.dart';
import 'package:demo_ui/register_screen.dart';
import 'package:flutter/material.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  bool isObscureText = true;
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    print(MediaQuery.of(context).size.height * 0.2);
    print(MediaQuery.of(context).size.width);

    return SafeArea(
        child: Scaffold(
            key: _scaffoldKey,
            resizeToAvoidBottomInset: false,
            backgroundColor: Colors.white,
            body: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 20),
              child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
                SizedBox(height: (MediaQuery.of(context).size.height * 0.2)),
                Text(
                  'Login',
                  style: TextStyle(
                      color: Colors.black87, fontSize: 40, fontWeight: FontWeight.bold, fontFamily: 'NotoSerifToto'),
                ),
                const SizedBox(
                  height: 15,
                ),
                Text(
                  'Please sign in to continue.',
                  style: TextStyle(
                      color: Colors.grey, fontSize: 25, fontWeight: FontWeight.bold, fontFamily: 'NotoSerifToto'),
                ),
                SizedBox(height: MediaQuery.of(context).size.height * 0.02),
                Form(
                  key: _formKey,
                  child: Card(
                    child: Row(
                      children: [
                        const SizedBox(
                          width: 20,
                        ),
                        const Icon(
                          Icons.email_outlined,
                        ),
                        const SizedBox(
                          width: 15,
                        ),
                        Expanded(
                          child: TextFormField(
                            validator: (value) {
                              if (value!.isEmpty) {
                                return 'Email required.';
                              }
                              return null;
                            },
                            decoration: InputDecoration(
                                border: UnderlineInputBorder(
                                  borderSide: BorderSide.none,
                                  borderRadius: BorderRadius.circular(20),
                                ),
                                hintText: 'Enter Email',
                                hintStyle: const TextStyle(color: Colors.grey)),
                          ),
                        )
                      ],
                    ),
                  ),
                ),
                const SizedBox(
                  height: 20,
                ),
                Card(
                  child: Row(
                    children: [
                      const SizedBox(
                        width: 20,
                      ),
                      const Icon(
                        Icons.lock_person_outlined,
                      ),
                      const SizedBox(
                        width: 15,
                      ),
                      Expanded(
                        child: TextFormField(
                          validator: (value) {
                            if (value!.isEmpty) {
                              return 'password required';
                            }
                            {
                              return null;
                            }
                          },
                          obscureText: isObscureText,
                          decoration: InputDecoration(
                              border: UnderlineInputBorder(
                                borderSide: BorderSide.none,
                                borderRadius: BorderRadius.circular(20),
                              ),
                              suffixIcon: GestureDetector(
                                child: Icon(isObscureText ? Icons.visibility_off_outlined : Icons.visibility_outlined),
                                onTap: () {
                                  setState(() {
                                    isObscureText = isObscureText ? false : true;
                                  });
                                },
                              ),
                              hintText: 'Enter Password',
                              hintStyle: const TextStyle(color: Colors.grey)),
                        ),
                      )
                    ],
                  ),
                ),
                const SizedBox(
                  height: 25,
                ),
                Align(
                  alignment: Alignment.centerRight,
                  child: ElevatedButton(
                      onPressed: () {
                        if (_formKey.currentState!.validate()) {
                          Navigator.push(context, MaterialPageRoute(builder: (context) {
                            return HomeScreen();
                          }));
                        }

                        ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
                          content: Text('User Logged In'),
                          backgroundColor: Colors.orangeAccent,
                          duration: Duration(seconds: 3),
                          behavior: SnackBarBehavior.floating,
                          elevation: 20,
                          width: 200,
                        ));
                      },
                      style: ButtonStyle(
                          overlayColor: MaterialStateProperty.all(Colors.transparent),
                          backgroundColor: MaterialStateProperty.all(Colors.orangeAccent),
                          minimumSize: MaterialStateProperty.all(Size(40, 40)),
                          maximumSize: MaterialStateProperty.all(Size(150, 50)),
                          shape: MaterialStateProperty.all<RoundedRectangleBorder>(RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(50.0), side: const BorderSide(color: Colors.amber)))),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          const Text(
                            'LOGIN',
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
                      "Don't have an account?",
                      style: TextStyle(
                          fontSize: 20, fontWeight: FontWeight.bold, color: Colors.grey, fontFamily: 'NotoSerifToto'),
                    ),
                    TextButton(
                        style: ButtonStyle(overlayColor: MaterialStateProperty.all((Colors.transparent))),
                        onPressed: () {
                          if (_formKey.currentState!.validate())
                            Navigator.push(context, MaterialPageRoute(builder: (context) {
                              return const RegisterScreen();
                            }));
                        },
                        child: (const Text(
                          'Sign up',
                          style: TextStyle(
                              fontSize: 20,
                              fontWeight: FontWeight.bold,
                              color: Colors.orangeAccent,
                              fontFamily: 'NotoSerifToto'),
                        )))
                  ],
                ),
              ]),
            )));
  }
}
