import 'dart:math';
import 'package:flutter/material.dart';

void main() => runApp(MiniCricketApp());

class MiniCricketApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: MiniCricketGame(),
    );
  }
}

class MiniCricketGame extends StatefulWidget {
  @override
  _MiniCricketGameState createState() => _MiniCricketGameState();
}

class _MiniCricketGameState extends State<MiniCricketGame> {
  int runs = 0;
  int balls = 6;
  String message = '';

  void playGame() {
    if (balls > 0) {
      int run = Random().nextInt(7); // 0 to 6 runs
      setState(() {
        balls--;
        runs += run;
        message = run == 0 ? 'No Runs' : '$run Runs';
      });
    }
  }

  void resetGame() {
    setState(() {
      runs = 0;
      balls = 6;
      message = '';
    });
  }

  @override
  Widget build(BuildContext context) {
    bool gameOver = balls == 0;

    return Scaffold(
      backgroundColor: Colors.blue[600],
      appBar: AppBar(
        title: Text('Mini Cricket'),
        backgroundColor: Colors.blue[800],
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Image.asset('E:\java application\flutter_application_1\mini_cricket\assets\istockphoto-1331943958-1024x1024.webp', height: 100),
                Image.asset('E:\java application\flutter_application_1\mini_cricket\assets\istockphoto-1351446226-612x612.jpg', height: 100),
              ],
            ),
            SizedBox(height: 30),
            Text(
              'Runs\n$runs',
              textAlign: TextAlign.center,
              style: TextStyle(fontSize: 24, color: Colors.white),
            ),
            Text(
              'Balls\n$balls',
              textAlign: TextAlign.center,
              style: TextStyle(fontSize: 24, color: Colors.white),
            ),
            SizedBox(height: 20),
            if (message.isNotEmpty)
              Text(
                message,
                style: TextStyle(fontSize: 18, color: Colors.white),
              ),
            SizedBox(height: 30),
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                backgroundColor: gameOver ? Colors.red : Colors.blue[900],
              ),
              onPressed: gameOver ? resetGame : playGame,
              child: Text(gameOver ? 'Restart' : 'Bat'),
            ),
          ],
        ),
      ),
    );
  }
}
