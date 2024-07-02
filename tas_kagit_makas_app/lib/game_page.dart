import 'package:flutter/material.dart';
import 'dart:math';

class GamePage extends StatefulWidget {
  const GamePage({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  State<GamePage> createState() => _GamePageState();
}

class _GamePageState extends State<GamePage> {
  final List<String> choices = ["Taş", "Kağıt", "Makas"];
  String? userChoice;
  String? computerChoice;
  String result = "";

  int userScore = 0;
  int computerScore = 0;

  Map<String, String> buttonImages = {
    "Taş": "assets/images/tas.png",
    "Kağıt": "assets/images/kagit.png",
    "Makas": "assets/images/makas.png",
  };

  void playGame(String userPick) {
    userChoice = userPick;
    computerChoice = choices[Random().nextInt(3)];
    setState(() {
      result = getResult(userChoice!, computerChoice!);
      if (result == "Kazandın!") {
        userScore++;
      } else if (result == "Kaybettin!") {
        computerScore++;
      }

      if (userScore == 5) {
        result =
            "Tebrikler! $computerScore - $userScore skorla oyunu Kazandın!";
        _showEndGameDialog(result);
      } else if (computerScore == 5) {
        result =
            "Üzgünüm! $computerScore - $userScore skorla oyunu Bilgisayar Kazandı!";
        _showEndGameDialog(result);
      }
    });
  }

  void _showEndGameDialog(String result) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Center(child: Text(result, textAlign: TextAlign.center)),
          content: Text(
            'Oyun sona erdi. Tekrar oynamak ister misiniz?',
            textAlign: TextAlign.center,
            style: TextStyle(
              fontFamily: 'aptoslight',
            ),
          ),
          actions: <Widget>[
            TextButton(
              child: Text(
                'Tekrar Oyna',
                style: TextStyle(
                  fontFamily: 'aptosbold',
                ),
              ),
              onPressed: () {
                Navigator.of(context).pop();
                resetGame();
              },
            ),
          ],
        );
      },
    );
  }

  String getResult(String user, String computer) {
    if (user == computer) {
      return "Berabere!";
    } else if ((user == "Taş" && computer == "Makas") ||
        (user == "Kağıt" && computer == "Taş") ||
        (user == "Makas" && computer == "Kağıt")) {
      return "Kazandın!";
    } else {
      return "Kaybettin!";
    }
  }

  void resetGame() {
    setState(() {
      userScore = 0;
      computerScore = 0;
      userChoice = null;
      computerChoice = null;
      result = "";
    });
  }

  Widget _buildUserChoiceDisplay() {
    return Column(
      children: [
        Text(
          'Sen:',
          style: TextStyle(
            fontSize: 28,
            fontFamily: 'aptosbold',
          ),
        ),
        SizedBox(height: 10),
        Container(
          width: 150,
          height: 100,
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(10),
            boxShadow: [
              BoxShadow(
                color: Colors.grey.withOpacity(0.5),
                spreadRadius: 2,
                blurRadius: 7,
                offset: Offset(0, 3),
              ),
            ],
          ),
          child: Center(
            child: userChoice != null
                ? Image.asset(
                    buttonImages[userChoice!]!,
                    width: 150,
                    height: 100,
                  )
                : SizedBox.shrink(),
          ),
        ),
      ],
    );
  }

  Widget _buildComputerChoiceDisplay() {
    return Column(
      children: [
        Text(
          'Bilgisayar:',
          style: TextStyle(
            fontSize: 28,
            fontFamily: 'aptosbold',
          ),
        ),
        SizedBox(height: 10),
        Container(
          width: 150,
          height: 100,
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(10),
            boxShadow: [
              BoxShadow(
                color: Colors.grey.withOpacity(0.5),
                spreadRadius: 2,
                blurRadius: 7,
                offset: Offset(0, 3),
              ),
            ],
          ),
          child: Center(
            child: computerChoice != null
                ? Image.asset(
                    buttonImages[computerChoice!]!,
                    width: 150,
                    height: 100,
                  )
                : SizedBox.shrink(),
          ),
        ),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.transparent,
      body: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage("assets/images/arkaPlan.png"),
            fit: BoxFit.cover,
          ),
        ),
        child: Column(
          children: <Widget>[
            SizedBox(height: 50),
            Align(
              alignment: Alignment.topCenter,
              child: _buildComputerChoiceDisplay(),
            ),
            Expanded(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  if (userChoice != null && computerChoice != null) ...[
                    Text(
                      result,
                      style:
                          TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
                      textAlign: TextAlign.center,
                    ),
                    SizedBox(height: 20),
                  ],
                  Text(
                    'Bir seçim yap:',
                    style: TextStyle(
                      fontSize: 26,
                      fontFamily: 'aptoslight',
                    ),
                  ),
                  SizedBox(height: 20),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: choices.map((choice) {
                      return Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 10),
                        child: ElevatedButton(
                          onPressed: () => playGame(choice),
                          style: ElevatedButton.styleFrom(
                            padding: EdgeInsets.zero,
                          ),
                          child: Image.asset(
                            buttonImages[choice]!,
                            fit: BoxFit.contain,
                            width: 80,
                            height: 80,
                          ),
                        ),
                      );
                    }).toList(),
                  ),
                  SizedBox(height: 20),
                  Text(
                    '$computerScore - $userScore',
                    style: TextStyle(
                      color: Color(0xffF77339),
                      fontSize: 42,
                      fontFamily: 'aptosbold',
                    ),
                  ),
                ],
              ),
            ),
            Align(
              alignment: Alignment.bottomCenter,
              child: Padding(
                padding: const EdgeInsets.only(bottom: 50),
                child: _buildUserChoiceDisplay(),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
