import 'package:flutter/material.dart';
import 'package:task1/admin/home_page_admin.dart';
import 'package:task1/customer/home_page.dart';
import 'package:task1/signup_page.dart';

class Login extends StatefulWidget {
  const Login({super.key});

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  final GlobalKey<FormState> formkey = GlobalKey<FormState>();
  TextEditingController username = TextEditingController();
  TextEditingController password = TextEditingController();

  bool obsecuretxt = true;

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        body: Form(
          key: formkey,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Text("Username:"),
              TextFormField(
                controller: username,
                validator: (value) {
                  if (value!.isEmpty) {
                    return 'Please Enter Your Name';
                  }

                  return null;
                },
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text("Password:"),
              ),
              TextFormField(
                decoration: InputDecoration(
                  suffixIcon: GestureDetector(
                    child: obsecuretxt
                        ? Icon(Icons.visibility_off)
                        : Icon(Icons.visibility),
                    onTap: () {
                      setState(() {
                        obsecuretxt = !obsecuretxt;
                      });
                    },
                  ),

                ),
                controller: password,
                obscureText: obsecuretxt,
                validator: (value) {
                  if (value!.isEmpty) {
                    return "please Enter your password";
                  }
                  return null;
                },
              ),
              TextButton(
                  onPressed: () {
                    if (formkey.currentState!.validate()) {
                      if (username.text == 'admin' && password.text == 'admin') {
                        Navigator.of(context).push(
                          MaterialPageRoute(

                            builder: (context) => HomePage_Admin(),
                          ),
                        );
                      }
                      if (username.text == 'customer' && password.text == 'customer') {
                        Navigator.of(context).push(
                          MaterialPageRoute(
                            builder: (context) => HomePage_Customer(),
                          ),
                        );
                      }

                    }
                  },
                  child: Text("Login")),
              Text("Don't have account?"),
              TextButton(
                  onPressed: () {
                    Navigator.of(context).push(
                      MaterialPageRoute(
                        builder: (context) => SignUp(),
                      ),
                    );
                  },
                  child: Text("Sign up"))
            ],
          ),
        ),
      ),
    );
  }
}
