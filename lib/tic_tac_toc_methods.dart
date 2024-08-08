class TicTacToeMethods {
  static String checkWinner(List<String> board) {
    // كل  الصفوف
    for (int i = 0; i < 3; i++) {
      if (board[i * 3] != '' && board[i * 3] == board[i * 3 + 1] && board[i * 3 + 1] == board[i * 3 + 2]) {
        return board[i * 3];
      }
    }

    // كل  الاعمدة
    for (int i = 0; i < 3; i++) {
      if (board[i] != '' && board[i] == board[i + 3] && board[i + 3] == board[i + 6]) {
        return board[i];
      }
    }
    //الاقطار

    if (board[0] != '' && board[0] == board[4] && board[4] == board[8]) {
      return board[0];
    }
    if (board[2] != '' && board[2] == board[4] && board[4] == board[6]) {
      return board[2];
    }

    //   التعادل
    if (!board.contains('')) {
      return 'Draw';
    }

    // مفيش    فائز أو تعادل
    return '';
  }
}
