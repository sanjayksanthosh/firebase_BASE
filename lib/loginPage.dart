import 'package:fire_basics/homepage.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  final FirebaseAuth auth = FirebaseAuth.instance;

  userLogin() async {
    try {
      var user = await auth.signInWithEmailAndPassword(
          email: emailController.text, password: passwordController.text);
      print(auth.currentUser!.uid);
      Navigator.push(context, MaterialPageRoute(
        builder: (context) {
          return Homepage();
        },
      ));
    } catch (e) {
      print(e);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Container(
          width: 300,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                "Login",
                style: TextStyle(fontSize: 30),
              ),
              SizedBox(
                height: 50,
              ),
              TextField(
                decoration: InputDecoration(
                    label: Text("username"),
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(20)))),
                controller: emailController,
              ),
              SizedBox(
                height: 100,
              ),
              TextField(
                decoration: InputDecoration(
                    label: Text("password"),
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(20)))),
                controller: passwordController,
              ),
              SizedBox(
                height: 50,
              ),
              ElevatedButton(
                onPressed: () {
                  userLogin();
                },
                child: Text("Login"),
              )
            ],
          ),
        ),
      ),
    );
  }
}
