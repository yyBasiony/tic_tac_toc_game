import 'package:flutter/material.dart';
import 'package:tic_tac_toc/splash.dart';
class TicTacToc extends StatelessWidget {
  const TicTacToc({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: SplashScreen(),

    );
  }
}
