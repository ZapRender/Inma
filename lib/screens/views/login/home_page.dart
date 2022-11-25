import 'package:employed_view_page/constants.dart';
import 'package:employed_view_page/screens/views/login/profile_screen.dart';
import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';

class HomePages extends StatefulWidget {
  const HomePages({super.key});

  @override
  State<HomePages> createState() => _HomePageState();
}

class _HomePageState extends State<HomePages> {
  //Initialize Firebase App
  Future<FirebaseApp> _initializeFirebase() async {
    FirebaseApp firebaseApp = await Firebase.initializeApp();
    return firebaseApp;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: FutureBuilder(
        future: _initializeFirebase(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.done) {
            return const LoginScreen();
          }
          return const Center(
            child: CircularProgressIndicator(),
          );
        },
      ),
    );
  }
}

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  //Login function
  static Future<User?> loginUsingEmailPassword(
      {required String email,
      required String password,
      required BuildContext context}) async {
    FirebaseAuth auth = FirebaseAuth.instance;
    User? user;
    try {
      UserCredential userCredential = await auth.signInWithEmailAndPassword(
          email: email, password: password);
      user = userCredential.user;
    } on FirebaseAuthException catch (e) {
      if (e.code == "user-not.found") {
        print("No User Found for that email");
      }
    }

    return user;
  }

  @override
  Widget build(BuildContext context) {
    //create the textfield controller
    TextEditingController _emailController = TextEditingController();
    TextEditingController _passwordController = TextEditingController();
    return Padding(
      padding: const EdgeInsets.all(defaultPadding),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          const SizedBox(height: defaultPadding),
          const Icon(
            Icons.sports_bar,
            color: Colors.white,
            size: 70,
          ),
          const Text(
            "IMMA",
            style: TextStyle(
              color: Colors.white,
              fontSize: 28.0,
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(
            height: defaultPadding,
          ),
          Expanded(
            child: Container(
              width: 325,
              decoration: BoxDecoration(
                  color: secondaryColor,
                  borderRadius: BorderRadius.circular(10)),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  const SizedBox(
                    height: defaultPadding,
                  ),
                  const Text(
                    "LOGIN",
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: 30.0,
                        fontWeight: FontWeight.bold),
                  ),
                  const SizedBox(
                    height: defaultPadding,
                  ),
                  TextField(
                    controller: _emailController,
                    keyboardType: TextInputType.emailAddress,
                    decoration: const InputDecoration(
                      hintText: "Your user email",
                      prefixIcon: Icon(Icons.person, color: Colors.white),
                    ),
                  ),
                  const SizedBox(
                    height: defaultPadding,
                  ),
                  TextField(
                    obscureText: true,
                    controller: _passwordController,
                    decoration: const InputDecoration(
                      hintText: "Your password",
                      prefixIcon: Icon(Icons.lock, color: Colors.white),
                    ),
                  ),
                  const SizedBox(
                    height: defaultPadding,
                  ),
                  const Text(
                    "Don'd remember your password?",
                    style: TextStyle(color: primaryColor),
                  ),
                  const SizedBox(
                    height: defaultPadding,
                  ),
                  RawMaterialButton(
                    fillColor: primaryColor,
                    elevation: 0.0,
                    padding: const EdgeInsets.symmetric(horizontal: 60),
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(12.0)),
                    onPressed: () async {
                      //test the app
                      User? user = await loginUsingEmailPassword(
                          email: _emailController.text,
                          password: _passwordController.text,
                          context: context);
                      print(user);
                      if (user != null) {
                        Navigator.of(context).pushReplacement(MaterialPageRoute(
                            builder: (context) => const ProfileScreen()));
                      }
                    },
                    child: const Text(
                      "login",
                      style: TextStyle(color: Colors.white, fontSize: 18.0),
                    ),
                  )
                ],
              ),
            ),
          ),
          SizedBox(height: defaultPadding),
          /*Expanded(
            child: Container(
              padding: const EdgeInsets.all(defaultPadding),
              width: 325,
              child: RawMaterialButton(
                fillColor: primaryColor,
                elevation: 0.0,
              
                padding: const EdgeInsets.all(defaultPadding),
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12.0)),
                onPressed: () async {
                  //test the app
                  User? user = await loginUsingEmailPassword(
                      email: _emailController.text,
                      password: _passwordController.text,
                      context: context);
                  print(user);
                  if (user != null) {
                    Navigator.of(context).pushReplacement(MaterialPageRoute(
                        builder: (context) => const ProfileScreen()));
                  }
                },
                child: const Text(
                  "login",
                  style: TextStyle(color: Colors.white, fontSize: 18.0),
                ),
              ),
            ),
          ),*/
          SizedBox(height: defaultPadding),
        ],
      ),
    );
  }
}
