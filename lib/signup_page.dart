import 'package:flutter/material.dart';
import 'package:task1/login_page.dart';

class SignUp extends StatelessWidget {
  const SignUp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        body: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text("User Name :"),
            TextFormField(),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text("Password:"),
            ),
            TextFormField(),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text("Email"),
            ),
            TextFormField(),
            TextButton(
              onPressed: () {
                Navigator.of(context).push(
                  MaterialPageRoute(
                    builder: (context) => Login(),
                  ),
                );
              },
              child: Text("Sign Up"),
            )
          ],
        ),
      ),
    );
  }
}
