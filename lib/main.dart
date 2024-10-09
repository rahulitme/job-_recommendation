// import 'package:flutter/material.dart';
// import 'package:myapp/screens/%20profile_screen.dart'; // Ensure correct file path
// import 'package:firebase_core/firebase_core.dart';

// void main() async {
//   WidgetsFlutterBinding.ensureInitialized();
//   await Firebase.initializeApp();
//   runApp(const MyApp());
// }

// class MyApp extends StatelessWidget {
//   const MyApp({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       title: 'Job Recommendation App',
//       theme: ThemeData(
//         primarySwatch: Colors.blue,
//       ),
//       home: const ProfileScreen(), // Navigate to ProfileScreen
//     );
//   }
// }
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:myapp/screens/%20profile_screen.dart';
import 'package:myapp/screens/profile_screen.dart'; // Ensure correct file path
import 'package:firebase_core/firebase_core.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  // Firebase initialization with error handling
  try {
    await Firebase.initializeApp();
  } catch (e) {
    if (kDebugMode) {
      print('Error initializing Firebase: $e');
    }
  }

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Job Recommendation App',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      debugShowCheckedModeBanner: false, // Disable the debug banner
      home: const ProfileScreen(), // Navigate to ProfileScreen
    );
  }
}
