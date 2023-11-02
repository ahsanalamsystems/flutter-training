import 'package:flutter/material.dart';
import 'package:lecture_one/signup.dart';

class SigninPage extends StatefulWidget {
  @override
  _SigninPageState createState() => _SigninPageState();
}

class _SigninPageState extends State<SigninPage> {
  navigateToSignup() {
    Navigator.push(
        context, MaterialPageRoute(builder: (context) => SignupPage()));
  }

  signin() {}

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // appBar: AppBar(
      //   title: const Text('Sign In'),
      // ),
      body: Container(
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [
              Color.fromARGB(255, 100, 20, 240),
              Color.fromARGB(255, 181, 153, 228)
            ], // Set your gradient colors here
          ),
        ),
        child: Center(
          child: Container(
            margin: const EdgeInsets.all(25),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                const Text(
                  'Sign In',
                  style: TextStyle(fontSize: 24, color: Colors.white),
                ),
                TextFormField(
                  decoration: const InputDecoration(
                      labelText: 'Email',
                      labelStyle: TextStyle(color: Colors.white),
                      enabledBorder: UnderlineInputBorder(
                          borderSide: BorderSide(color: Colors.white))),
                  style: const TextStyle(color: Colors.white),
                ),
                TextFormField(
                  decoration: const InputDecoration(
                    labelText: 'Password',
                    labelStyle: TextStyle(color: Colors.white),
                    enabledBorder: UnderlineInputBorder(
                        borderSide: BorderSide(color: Colors.white)),
                  ),
                  obscureText: true,
                  style: const TextStyle(color: Colors.white),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 20.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      ElevatedButton(
                        onPressed: signin,
                        child: const Text('Sign in'),
                      ),
                      ElevatedButton(
                        onPressed: navigateToSignup,
                        child: const Text('Sign up'),
                      ),
                    ],
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
