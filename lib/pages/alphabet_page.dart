import 'package:audioplayers/audioplayers.dart';
import 'package:flutter/material.dart';
import 'package:kids_world/data/alphabet_data.dart';
import 'package:kids_world/models/alphabet_model.dart';
import 'package:kids_world/widgets/build_selected_alphabet.dart';
import 'package:kids_world/widgets/custom_app_bar.dart';
class AlphabetPage extends StatefulWidget {
  const AlphabetPage({super.key});

  @override
  State<AlphabetPage> createState() => AlphabetPageState();
}

class AlphabetPageState extends State<AlphabetPage> {
  AlphabetModel? selectedAlphabet;
  final AudioPlayer player = AudioPlayer();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar:CustomAppBar(color: Colors.blue.shade200, title: "Alphabet"),
      body: Container(
        color: Colors.blue.shade50 ,
        child: Column(
          children: [
            if ( selectedAlphabet != null)
              BuildSelectedAlphabet(selectedAlphabet: selectedAlphabet),
            Expanded(
              child: GridView.builder(
                padding: const EdgeInsets.all(20),
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 5,
                  crossAxisSpacing: 15,
                  mainAxisSpacing: 15,
                ),
                itemCount: alphabets.length,
                itemBuilder: (context, index) {
                  final alphabet = alphabets[index];
                  final isSelected = selectedAlphabet?.letter == alphabet.letter;
                  return GestureDetector(
                    onTap: () async{
                      setState(() {
                        selectedAlphabet = alphabet;
                      });
                      await player.stop();
                      await player.play(AssetSource(alphabet.audio));
                    },
                    child: AnimatedContainer(
                      duration: const Duration(milliseconds: 300),
                      decoration: BoxDecoration(
                        color:isSelected
                            ?Colors.green.shade300 :Colors.blue.shade200,
                        borderRadius: BorderRadius.circular(20),
                        boxShadow: [
                          BoxShadow(
                            color: Colors.grey.withOpacity(0.7),
                            blurRadius:  8,
                            offset: Offset(0, 6),
                          ),
                        ],
                      ),
                      child: Center(
                        child: Text(
                          alphabet.letter,
                          style: TextStyle(
                            fontSize: isSelected ? 32 : 28,
                            fontWeight: FontWeight.bold,
                            color: Colors.white,
                          ),
                        ),
                      ),
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}