import 'package:flutter/material.dart';
import 'package:lecture_one/signin.dart';

class SignupPage extends StatefulWidget {
  @override
  _SignupPageState createState() => _SignupPageState();
}

class _SignupPageState extends State<SignupPage> {
  navigateToSignIn() {
    Navigator.push(
        context, MaterialPageRoute(builder: (context) => SigninPage()));
  }

  onSignupPress() {}

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // appBar: AppBar(
      //   title: const Text('Signup'),
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
                  'Signup',
                  style: TextStyle(fontSize: 24, color: Colors.white),
                ),
                TextFormField(
                  decoration: const InputDecoration(
                      labelText: 'First Name',
                      labelStyle: TextStyle(color: Colors.white),
                      enabledBorder: UnderlineInputBorder(
                          borderSide: BorderSide(color: Colors.white))),
                  style: const TextStyle(color: Colors.white),
                ),
                TextFormField(
                  decoration: const InputDecoration(
                      labelText: 'Last Name',
                      labelStyle: TextStyle(color: Colors.white),
                      enabledBorder: UnderlineInputBorder(
                          borderSide: BorderSide(color: Colors.white))),
                  style: const TextStyle(color: Colors.white),
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
                          borderSide: BorderSide(color: Colors.white))),
                  style: const TextStyle(color: Colors.white),
                  obscureText: true,
                ),
                TextFormField(
                  decoration: const InputDecoration(
                      labelText: 'Confirm Password',
                      labelStyle: TextStyle(color: Colors.white),
                      enabledBorder: UnderlineInputBorder(
                          borderSide: BorderSide(color: Colors.white))),
                  style: const TextStyle(color: Colors.white),
                  obscureText: true,
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 20.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      ElevatedButton(
                        onPressed: navigateToSignIn,
                        child: const Text('Sign In'),
                      ),
                      ElevatedButton(
                        onPressed: onSignupPress,
                        child: const Text('Sign Up'),
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
