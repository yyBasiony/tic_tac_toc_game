import 'package:flutter/material.dart';
import 'home_page.dart';

class PlayerNamesScreen extends StatefulWidget {
  const PlayerNamesScreen({super.key});

  @override
  _PlayerNamesScreenState createState() => _PlayerNamesScreenState();
}

class _PlayerNamesScreenState extends State<PlayerNamesScreen> {
  final TextEditingController _playerXController = TextEditingController();
  final TextEditingController _playerOController = TextEditingController();

  @override
  void dispose() {
    _playerXController.dispose();
    _playerOController.dispose();
    super.dispose();
  }

  void _startGame() {
    if (_playerXController.text.isNotEmpty && _playerOController.text.isNotEmpty) {
      Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => HomePage(
            playerX: _playerXController.text,
            playerO: _playerOController.text,
          ),
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Enter Player Names',style:TextStyle(color: Color(0xffe53170)) ,),
        backgroundColor: Colors.black,
      ),
      backgroundColor: Colors.black,
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SizedBox(height: 40),

            TextField(
              controller: _playerXController,
              decoration: InputDecoration(
                labelText: "Player X Name",
                filled: true,
                fillColor: Color(0xffe53170), // اللون الخلفي
              ),
              style: TextStyle(
                color: Colors.white, // لون النص
              ),

            ),
            SizedBox(height: 40),
            TextField(
              controller: _playerOController,
              decoration: InputDecoration(
                labelText: "Player O Name",
                filled: true,
                fillColor: Color(0xffe53170), // اللون الخلفي
              ),
              style: TextStyle(
                color: Colors.white, // لون النص
              ),
            ),
            SizedBox(height: 180),
            ElevatedButton(
              onPressed: _startGame,
              child: Text("Start Game",style: TextStyle(color: Color(0xfff25f4c)),),
              style: ElevatedButton.styleFrom(
                minimumSize: Size(double.infinity, 50), // عرض الزر على عرض الشاشة
              ),
            ),
          ],
        ),
      ),
    );
  }
}
