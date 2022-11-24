import 'package:employed_view_page/screens/main_screen.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'constants.dart';
import 'package:firebase_core/firebase_core.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
      options: const FirebaseOptions(
          apiKey: "AIzaSyAS1kasExIpREPONXnwRoegMHEg-z2bmeM",
          authDomain: "inventory-management-6ae0f.firebaseapp.com",
          projectId: "inventory-management-6ae0f",
          storageBucket: "inventory-management-6ae0f.appspot.com",
          messagingSenderId: "645446013229",
          appId: "1:645446013229:web:e0fa376c4ffaccbaaf03a4"));

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Admin Panel',
      initialRoute: '/homepage',
      theme: ThemeData.dark().copyWith(
        scaffoldBackgroundColor: bgColor,
        textTheme: GoogleFonts.poppinsTextTheme(
            Theme.of(context).textTheme.apply(bodyColor: Colors.white)),
        canvasColor: secondaryColor,
      ),
      home: const MainScreen(),
    );
  }
}
