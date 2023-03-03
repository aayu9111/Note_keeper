import 'package:flutter/material.dart';
import 'package:revise_app/screen_1.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final _formKey = GlobalKey<FormState>();
  final GlobalKey<ScaffoldState> _scaffoldKey = new GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        key: _scaffoldKey,
        resizeToAvoidBottomInset: true,
        backgroundColor: Colors.blue,
        body: Center(
          child: Container(
              padding: EdgeInsets.all(10),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                color: Colors.white,
              ),
              height: 300,
              width: 350,
              child: Form(
                key: _formKey,
                child: Column(
                  children: [
                    Card(
                      color: Colors.white,
                      child: TextFormField(
                        validator: (value) {
                          if (value!.isEmpty) {
                            return "* Required";
                          } else {
                            return null;
                          }
                        },
                        onChanged: (value) {
                          print(value);
                        },
                        decoration: const InputDecoration(
                          disabledBorder: InputBorder.none,
                          border: OutlineInputBorder(),
                          hintText: 'Enter username',
                          labelText: 'Username',
                        ),
                      ),
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    Card(
                      color: Colors.white,
                      child: TextFormField(
                        obscureText: true,
                        validator: (value) {
                          if (value!.isEmpty) {
                            return "* Required";
                          } else
                            return null;
                        },
                        onChanged: (value) {
                          print(value);
                        },
                        decoration: const InputDecoration(
                          border: OutlineInputBorder(),
                          hintText: 'Enter password',
                          labelText: 'Password',
                        ),
                      ),
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    ElevatedButton(
                        onPressed: () {
                          Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) {
                            return Screen1();
                          }));
                          if (_formKey.currentState!.validate()) ;
                          ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
                            content: Text('User Logged In'),
                            backgroundColor: Colors.red,
                            duration: Duration(seconds: 3),
                            behavior: SnackBarBehavior.floating,
                          ));
                        },
                        child: const Text('SUBMIT'))
                  ],
                ),
              )),
        ),
      ),
    );
  }
}
