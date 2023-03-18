import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:get/get.dart';

import 'Screen/Auth/Login.dart';
import 'Screen/Home.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final FirebaseAuth _auth = FirebaseAuth.instance;

    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
          textTheme: TextTheme(
            bodyLarge: TextStyle(color: Colors.white ,), // set the text color here
            bodyMedium: TextStyle(color: Colors.white), // set the text color here
            displayLarge: TextStyle(color: Colors.white), // set the text color here
            displayMedium: TextStyle(color: Colors.white), // set the text color here
            // add more text styles here as needed
          ),
       scaffoldBackgroundColor: Color(0xff091a2f)
      ),

      home: StreamBuilder<User?>(
        stream: FirebaseAuth.instance.authStateChanges(),
        builder: (context , snapshot){
          if (snapshot.hasData){
            return HomeScreen(auth: _auth,);
          }else{
            return LoginScreen();
          }
        },
      ),
    );
  }
}

