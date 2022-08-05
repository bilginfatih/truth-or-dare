import 'package:flutter/material.dart';
import '../Widgets/boxdecoration_widget.dart';
import '../Widgets/materialbutton_widget.dart';
import '../Widgets/scoreitem_widget.dart';
import '../components/constants.dart';
import 'home_page.dart';
import 'select_truth_or_dare.dart';

// ignore: must_be_immutable
class CurrentScoreScreen extends StatelessWidget {
  String type;
  CurrentScoreScreen({Key? key, required this.type}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: SafeArea(
        child: Container(
          decoration: boxDecoration(),
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const SizedBox(
                height: 50.0,
              ),
              const Text(
                'Toplam Skor',
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 36,
                  color: Colors.white,
                  fontStyle: FontStyle.italic,
                ),
              ),
              const SizedBox(
                height: 50.0,
              ),
              Expanded(
                child: SizedBox(
                  height: 50.0,
                  child: ListView.separated(
                    itemBuilder: (context, index) {
                      return scoreItem(name: players[index].substring(0, 1).toUpperCase() + players[index].substring(1), score: scores[index]);
                    },
                    separatorBuilder: (context, index) {
                      return const SizedBox(
                        height: 8,
                      );
                    },
                    itemCount: players.length,
                  ),
                ),
              ),
              const SizedBox(
                height: 20.0,
              ),
              Row(
                children: [
                  Expanded(
                    child: defaultButton(
                      text: 'DEVAM',
                      color: Colors.green,
                      function: () {
                        index = 0;
                        indexGender = 0;
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) {
                              return SelectTruthOrDare(
                                modType: type,
                              );
                            },
                          ),
                        );
                      },
                    ),
                  ),
                  const SizedBox(
                    width: 20.0,
                  ),
                  Expanded(
                    child: defaultButton(
                      text: 'BITIR',
                      color: Colors.blue,
                      function: () {
                        index = 0;
                        indexGender = 0;
                        Navigator.pushAndRemoveUntil(context, MaterialPageRoute(
                          builder: (context) {
                            return const MyHomePage();
                          },
                        ), (route) => false);
                      },
                    ),
                  ),
                ],
              ),
              const SizedBox(
                height: 20.0,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
