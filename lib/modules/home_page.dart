import 'package:flutter/material.dart';
import '../Widgets/boxdecoration_widget.dart';
import '../Widgets/materialbutton_widget.dart';
import '../components/constants.dart';
import 'add_players_screen.dart';

// ignore: must_be_immutable
class MyHomePage extends StatelessWidget {
  const MyHomePage({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: SafeArea(
        child: Container(
          decoration: boxDecoration(),
          padding: const EdgeInsets.symmetric(horizontal: 50),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Text(
                'Oyun Modu',
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 36,
                  color: Colors.white,
                  fontStyle: FontStyle.italic,
                ),
              ),
              const SizedBox(
                height: 120.0,
              ),
              defaultButton(
                text: 'Kolay',
                color: Colors.green,
                function: () {
                  players.clear();
                  playersGender.clear();
                  scores.clear();
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) {
                        return AddPlayersScreen(
                          modType: 'Kolay',
                        );
                      },
                    ),
                  );
                },
              ),
              const SizedBox(
                height: 24.0,
              ),
              defaultButton(
                  text: 'Orta',
                  color: Colors.amberAccent,
                  function: () {
                    players.clear();
                    scores.clear();
                    playersGender.clear();
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) {
                          return AddPlayersScreen(modType: 'Orta');
                        },
                      ),
                    );
                  }),
              const SizedBox(
                height: 24.0,
              ),
              defaultButton(
                text: 'Zor',
                color: Colors.red,
                function: () {
                  players.clear();
                  scores.clear();
                  playersGender.clear();
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) {
                        return AddPlayersScreen(modType: 'Zor');
                      },
                    ),
                  );
                },
              ),
              const SizedBox(
                height: 70.0,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
