import 'package:flutter/material.dart';
import 'game_page.dart';

class Giris extends StatefulWidget {
  const Giris({super.key});

  @override
  State<Giris> createState() => _GirisState();
}

class _GirisState extends State<Giris> {
  void _showHowToPlayDialog() {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('Nasıl Oynanır?', style: TextStyle(fontSize: 35)),
          content: Text(
            'Taş, Kağıt, Makas oyununda taş makası kırar, kağıt taşı sarar, makas kağıdı keser. '
            'Kendi seçiminizi yaparak bilgisayara karşı oynayın ve ilk 5 puana ulaşan kazanır.',
            style: TextStyle(fontSize: 18),
          ),
          actions: <Widget>[
            ElevatedButton(
              child: Text('Tamam'),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
          ],
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage("assets/images/giris.png"),
            fit: BoxFit.cover, // Resmi tam ekrana sığdırır
          ),
        ),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Text(
                'HOŞ GELDİN!',
                style: TextStyle(
                    fontSize: 50,
                    color: Color(0xff285B89),
                    fontFamily: 'rumraisin'),
              ),
              SizedBox(height: 30),
              ElevatedButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => GamePage(title: 'Oyuna Başla')),
                  );
                },
                child: Text('Oyuna Başla'),
              ),
              SizedBox(height: 10),
              ElevatedButton(
                onPressed: _showHowToPlayDialog,
                child: Text('Nasıl Oynanır?'),
              ),
              SizedBox(height: 150),
            ],
          ),
        ),
      ),
    );
  }
}
