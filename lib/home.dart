import 'package:flutter/material.dart';
import 'package:lecture_one/signin.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage();
  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  navigateToSignin() {
    Navigator.push(
        context, MaterialPageRoute(builder: (context) => SigninPage()));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // appBar: AppBar(
      //   title: const Text('Sign In'),
      // ),
      body: Container(
          alignment: Alignment.center,
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
            child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  const Image(
                    image: AssetImage('assets/images/icon.png'),
                  ),
                  const Center(
                    child: Text('Welcome to my First Flutter App',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 25,
                          fontWeight: FontWeight.bold,
                        )),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 10.0),
                    child: SizedBox(
                      height: 40,
                      width: 130,
                      child: ElevatedButton(
                          onPressed: navigateToSignin,
                          child: const Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: <Widget>[
                              Text('Continue'),
                              Icon(Icons.arrow_forward)
                            ],
                          )),
                    ),
                  )
                ]),
          )),
    );
  }
}
