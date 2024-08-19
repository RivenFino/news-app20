import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:news_app/firebase_options.dart';
import 'package:news_app/news_list_screen.dart';
import 'package:news_app/pages/home_page.dart';
import 'package:news_app/pages/login_screen.dart';

void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  try {
    await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  } catch (e) {
    print("Firebase Initialization error: $e");
  }
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Firebase CRUD',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: _getlandingPage(),
    );
  }

  Widget _getlandingPage() {
    return StreamBuilder <User?>  (
      stream: FirebaseAuth.instance.authStateChanges(),
       builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return const CircularProgressIndicator();
        } else if (snapshot.hasData) {
          return NewsListScreen();
        }else {
          return const LoginScreen();
        }
       },
       );
  }
}
