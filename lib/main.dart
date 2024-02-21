import 'package:flutter/material.dart';

import 'package:firebase_core/firebase_core.dart';
import 'firebase_options.dart';

import 'package:firebase_auth/firebase_auth.dart';

import 'package:flutter_booking_offers/offers.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );

  FirebaseAuth.instance.authStateChanges().listen((User? user) {
    if (user == null) {
      print('User is currently signed out!');
    } else {
      print('User is signed in!');
    }
  });

  // FirebaseAuth.instance.createUserWithEmailAndPassword(email: "accounts@stuppnig.net", password: "testaa").then((value) => print(value),).onError((error, stackTrace) => print("Custom Error: $error"),);

  FirebaseAuth.instance
      .signInWithEmailAndPassword(
          email: "accounts@stuppnig.net", password: "testaa")
      .then(
        (value) => print(value),
      )
      .onError(
        (error, stackTrace) => print("Custom Error $error"),
      );

  runApp(const App());
}

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Booking Offers',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.blue),
        useMaterial3: true,
      ),
      home: const HomePage(title: 'Booking Offers'),
    );
  }
}

class HomePage extends StatefulWidget {
  const HomePage({super.key, required this.title});

  final String title;

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  bool _showMore = false;

  void _toggleShowMore() {
    setState(() {
      _showMore = !_showMore;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(child: Offers(amount: _showMore ? 10 : 3)),
      floatingActionButton: FloatingActionButton(
        onPressed: _toggleShowMore,
        tooltip: 'Show More',
        child: const Icon(Icons.add),
      ),
    );
  }
}
