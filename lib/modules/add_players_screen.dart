import 'package:flutter/material.dart';
import '../Widgets/boxdecoration_widget.dart';
import '../Widgets/materialbutton_widget.dart';
import '../Widgets/snackbar_widget.dart';
import '../components/constants.dart';
import 'select_truth_or_dare.dart';

// ignore: must_be_immutable
class AddPlayersScreen extends StatefulWidget {
  String modType;
  AddPlayersScreen({Key? key, required this.modType}) : super(key: key);

  @override
  // ignore: library_private_types_in_public_api
  _AddPlayersScreenState createState() => _AddPlayersScreenState();
}

class _AddPlayersScreenState extends State<AddPlayersScreen> {
  var textController = TextEditingController();
  var formKey = GlobalKey<FormState>();
  late String names = '';
  var maleIsValid = false;
  var femaleIsValid = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: SafeArea(
        child: Container(
          decoration: boxDecoration(),
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: Form(
            key: formKey,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const SizedBox(
                  height: 30.0,
                ),
                const Text(
                  'Oyuncu Ekle',
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
                TextFormField(
                  controller: textController,
                  decoration: InputDecoration(
                    border: const OutlineInputBorder(),
                    labelText: 'İsim Girin',
                    suffixIcon: IconButton(
                      icon: const Icon(Icons.person_add),
                      onPressed: () {
                        setState(
                          () {
                            if (formKey.currentState!.validate() && (femaleIsValid || maleIsValid) == true) {
                              players.add(textController.text);
                              scores.add(0);
                              if (femaleIsValid == true) {
                                playersGender.add('Kadın');
                              } else if (maleIsValid == true) {
                                playersGender.add('Erkek');
                              }
                              names = '$names \n ${textController.text}';
                              textController.text = '';
                            }
                            if (femaleIsValid == false && maleIsValid == false) {
                              ScaffoldMessenger.of(context).showSnackBar(
                                snackBar(
                                  content: const Text(
                                    "Cinsiyeti Seciniz",
                                    style: TextStyle(
                                      fontSize: 18,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                ),
                              );
                            }
                          },
                        );
                      },
                    ),
                  ),
                  validator: (value) {
                    if (value!.isEmpty) {
                      return 'İsim Giriniz';
                    }
                    if (players.length > 12) {
                      return '12 Kullanıcıdan Fazla Olamaz';
                    }
                    return null;
                  },
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    const Icon(Icons.female),
                    Checkbox(
                      value: femaleIsValid,
                      activeColor: Colors.red,
                      onChanged: (deger) {
                        setState(() {});
                        femaleIsValid = deger!;
                        maleIsValid = false;
                      },
                    ),
                    const Icon(Icons.male),
                    Checkbox(
                      value: maleIsValid,
                      activeColor: Colors.blue,
                      onChanged: (deger) {
                        setState(() {});
                        maleIsValid = deger!;
                        femaleIsValid = false;
                      },
                    ),
                  ],
                ),
                const SizedBox(
                  height: 14.0,
                ),
                Expanded(
                  child: Container(
                    color: Colors.black12,
                    width: double.infinity,
                    child: Text(
                      names,
                      textAlign: TextAlign.left,
                      style: TextStyle(
                        fontSize: 18,
                        color: Colors.grey[300],
                        fontStyle: FontStyle.italic,
                      ),
                    ),
                  ),
                ),
                const SizedBox(
                  height: 20.0,
                ),
                defaultButton(
                  text: 'OYNA',
                  color: Colors.green,
                  function: () {
                    if (players.length >= 2) {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) {
                            if (widget.modType == 'Orta') {
                              return SelectTruthOrDare(
                                modType: 'Orta',
                              );
                            } else if (widget.modType == 'Zor') {
                              return SelectTruthOrDare(modType: 'Zor');
                            }
                            return SelectTruthOrDare(
                              modType: 'Kolay',
                            );
                          },
                        ),
                      );
                    } else {
                      ScaffoldMessenger.of(context).showSnackBar(
                        snackBar(
                          content: const Text(
                            "Oyuncu adeti en az 2 olmalıdır.",
                            style: TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                      );
                    }
                  },
                ),
                const SizedBox(
                  height: 20.0,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
