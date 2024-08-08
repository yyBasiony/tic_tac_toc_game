import 'package:flutter/material.dart';
import 'tic_tac_toc_methods.dart'; // استيراد دوال اللعبة

class HomePage extends StatefulWidget {
  final String playerX;
  final String playerO;

  const HomePage({required this.playerX, required this.playerO, super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  List<String> board = ['', '', '', '', '', '', '', '', ''];
  String currentPlayer = 'X';
  String winner = '';

  void _onTap(int index) {
    if (board[index] == '' && winner == '') {
      setState(() {
        board[index] = currentPlayer;
        currentPlayer = (currentPlayer == 'X') ? 'O' : 'X';
        winner = TicTacToeMethods.checkWinner(board);
        if (winner != '') {
          _showWinnerDialog(winner);
        }
      });
    }
  }

  void _showWinnerDialog(String winner) {
    String winnerMessage;

    if (winner == 'X') {
      winnerMessage = '${widget.playerX} is the winner!';
    } else if (winner == 'O') {
      winnerMessage = '${widget.playerO} is the winner!';
    } else if (winner == 'Draw') {
      winnerMessage = "It's a Draw!";
    } else {
      return; // لا تعرض شيء إذا لم يكن هناك فائز بعد
    }

    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text("Result"),
          content: Text(winnerMessage),
          actions: <Widget>[
            TextButton(
              child: Text("OK"),
              onPressed: () {
                Navigator.of(context).pop();
                _resetGame();
              },
            ),
          ],
        );
      },
    );
  }

  void _resetGame() {
    setState(() {
      board = ['', '', '', '', '', '', '', '', ''];
      currentPlayer = 'X';
      winner = '';
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        title: Text('Tic Tac Toe',style: TextStyle(color: Color(0xffe53170)),),
        backgroundColor: Colors.black,
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              "IT'S $currentPlayer TURN",
              style: TextStyle(
                fontSize: 30,
                color: Colors.white,
              ),
            ),
            SizedBox(height: 20),
            Container(
              padding: EdgeInsets.all(20),
              color: Colors.black,
              child: GridView.builder(
                shrinkWrap: true,
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 3,
                  mainAxisSpacing: 10,
                  crossAxisSpacing: 10,
                ),
                itemCount: 9,
                itemBuilder: (context, index) {
                  return GestureDetector(
                    onTap: () => _onTap(index),
                    child: Container(
                      decoration: BoxDecoration(
                        color: Color(0xffe53170),
                        borderRadius: BorderRadius.circular(8),
                      ),
                      child: Center(
                        child: Text(
                          board[index],
                          style: TextStyle(
                            fontSize: 50,
                            color: board[index] == 'X' ? Color(0xffff8906) : Color(0xfff25f4c),
                          ),
                        ),
                      ),
                    ),
                  );
                },
              ),
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: _resetGame,
              child: Text("Repeat The Game",style: TextStyle(color: Color(0xfff25f4c)),),
            ),
          ],
        ),
      ),
    );
  }
}
