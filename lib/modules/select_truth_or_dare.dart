import 'dart:math';
import 'package:flutter/material.dart';
import '../Widgets/boxdecoration_widget.dart';
import '../Widgets/materialbutton_widget.dart';
import '../components/constants.dart';
import 'easy_female_selected_challenge.dart';
import 'easy_male_selected_challenge.dart';
import 'hard_female_selected_challenge.dart';
import 'medium_female_selected_challenge.dart';
import 'medium_male_selected_challenge.dart';
import 'hard_male_selected_challenge.dart';

// ignore: must_be_immutable
class SelectTruthOrDare extends StatelessWidget {
  String modType;
  SelectTruthOrDare({Key? key, required this.modType}) : super(key: key);

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
              Text(
                players[index].substring(0, 1).toUpperCase() + players[index].substring(1),
                style: const TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 36,
                  color: Colors.white,
                  fontStyle: FontStyle.italic,
                ),
              ),
              const SizedBox(
                height: 24,
              ),
              playersGender[index] == 'Erkek'
                  ? const Icon(
                      Icons.male,
                      size: 40,
                    )
                  : const Icon(
                      Icons.female,
                      size: 40,
                    ),
              const SizedBox(
                height: 60.0,
              ),
              defaultButton(
                text: 'DOGRULUK',
                color: Colors.green,
                function: () {
                  Random random = Random();
                  var randomNumber = random.nextInt(easyTrurhMale.length);

                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) {
                        indexGender++;
                        if (modType == 'Orta') {
                          if (playersGender[indexGender - 1] == 'Erkek') {
                            return MediumMaleSelectedChallenge(
                              type: 'Orta Dogruluk',
                              i: randomNumber,
                            );
                          } else {
                            return MediumFemaleSelectedChallenge(
                              type: 'Orta Dogruluk',
                              i: randomNumber,
                            );
                          }
                        } else if (modType == 'Zor') {
                          if (playersGender[indexGender - 1] == 'Erkek') {
                            return HardMaleSelectedChallenge(
                              type: 'Zor Dogruluk',
                              i: randomNumber,
                            );
                          } else {
                            return HardFemaleSelectedChallenge(
                              type: 'Zor Dogruluk',
                              i: randomNumber,
                            );
                          }
                        } else {
                          if (playersGender[indexGender - 1] == 'Erkek') {
                            return EasyMaleSelectedChallenge(
                              type: 'Kolay Dogruluk',
                              i: randomNumber,
                            );
                          } else {
                            return EasyFemaleSelectedChallenge(
                              type: 'Kolay Dogruluk',
                              i: randomNumber,
                            );
                          }
                        }
                      },
                    ),
                  );
                },
              ),
              const SizedBox(
                height: 28.0,
              ),
              defaultButton(
                  text: 'CESARET',
                  color: Colors.red,
                  function: () {
                    Random random = Random();
                    var randomNumber = random.nextInt(easyDareMale.length);
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) {
                          indexGender++;
                          if (modType == 'Orta') {
                            if (playersGender[indexGender - 1] == 'Erkek') {
                              return MediumMaleSelectedChallenge(
                                type: 'Orta Cesaret',
                                i: randomNumber,
                              );
                            } else {
                              return MediumFemaleSelectedChallenge(
                                type: 'Orta Cesaret',
                                i: randomNumber,
                              );
                            }
                          } else if (modType == 'Zor') {
                            if (playersGender[indexGender - 1] == 'Erkek') {
                              return HardMaleSelectedChallenge(
                                type: 'Zor Cesaret',
                                i: randomNumber,
                              );
                            } else {
                              return HardFemaleSelectedChallenge(
                                type: 'Zor Cesaret',
                                i: randomNumber,
                              );
                            }
                          } else {
                            if (playersGender[indexGender - 1] == 'Erkek') {
                              return EasyMaleSelectedChallenge(
                                type: 'Kolay Cesaret',
                                i: randomNumber,
                              );
                            } else {
                              return EasyFemaleSelectedChallenge(
                                type: 'Kolay Cesaret',
                                i: randomNumber,
                              );
                            }
                          }
                        },
                      ),
                    );
                  }),
              const SizedBox(
                height: 90.0,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
