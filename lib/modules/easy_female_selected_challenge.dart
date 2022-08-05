import 'package:flutter/material.dart';
import '../Widgets/boxdecoration_widget.dart';
import '../Widgets/materialbutton_widget.dart';
import '../components/constants.dart';
import 'current_score_screen.dart';
import 'select_truth_or_dare.dart';

// ignore: must_be_immutable
class EasyFemaleSelectedChallenge extends StatelessWidget {
  String type;
  int i;
  EasyFemaleSelectedChallenge({Key? key, required this.type, required this.i}) : super(key: key);

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
              Text(
                type,
                style: const TextStyle(
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
                child: Container(
                  alignment: AlignmentDirectional.center,
                  padding: const EdgeInsets.symmetric(
                    horizontal: 16.0,
                  ),
                  color: Colors.black12,
                  width: double.infinity,
                  child: Text(
                    type == 'Kolay Dogruluk' ? easyTruthFemale[i] : easyDareFemale[i],
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                      color: Colors.grey[300],
                      fontStyle: FontStyle.italic,
                    ),
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
                      text: 'DOGRU',
                      color: Colors.green,
                      function: () {
                        scores[index]++;
                        if (index < (players.length - 1)) {
                          index++;
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) {
                                return SelectTruthOrDare(
                                  modType: 'Dogruluk',
                                );
                              },
                            ),
                          );
                        } else if (index == players.length - 1) {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) {
                                return CurrentScoreScreen(
                                  type: 'Dogruluk',
                                );
                              },
                            ),
                          );
                        }
                      },
                    ),
                  ),
                  const SizedBox(
                    width: 20.0,
                  ),
                  Expanded(
                    child: defaultButton(
                      text: 'YANLIS',
                      color: Colors.blue,
                      function: () {
                        if (index < (players.length - 1)) {
                          index++;
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) {
                                return SelectTruthOrDare(
                                  modType: 'Dogruluk',
                                );
                              },
                            ),
                          );
                        } else if (index == players.length - 1) {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) {
                                return CurrentScoreScreen(
                                  type: 'Dogruluk',
                                );
                              },
                            ),
                          );
                        }
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
