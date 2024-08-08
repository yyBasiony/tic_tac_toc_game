import 'package:flutter/material.dart';
import 'package:tic_tac_toc/player_names_screen.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    // Delay navigation to the next screen after 3 seconds
    Future.delayed(Duration(seconds: 3), () {
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => PlayerNamesScreen()),
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: Container(
        color: Colors.black,
        child: Center(
          child: Hero(
            tag: "go",
            child: CircleAvatar(
              radius: 80, // Set the radius to 80
              backgroundImage: AssetImage("assets/tictactoc.jpeg"),
              backgroundColor: Colors.transparent,
            ),
          ),
        ),
      ),
    );
  }
}
