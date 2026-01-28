import 'package:audioplayers/audioplayers.dart';
import 'package:flutter/material.dart';
import 'package:kids_world/data/number_data.dart';
import 'package:kids_world/widgets/build_selected_number.dart';
import 'package:kids_world/widgets/custom_app_bar.dart';

class NumbersPage extends StatefulWidget {
  const NumbersPage({super.key});

  @override
  State<NumbersPage> createState() => _NumbersPageState();
}

class _NumbersPageState extends State<NumbersPage> {
  int? selectedNumber;
  final AudioPlayer player = AudioPlayer();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(color: Colors.green.shade200, title: "Numbers"),
      body: Container(
       color: Colors.green.shade50,
        child: Column(
          children: [
            if (selectedNumber != null)
              BuildSelectedNumber(selectedNumber: selectedNumber!,),
            Expanded(
              child: GridView.builder(
                padding: const EdgeInsets.all(20),
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 5,
                  crossAxisSpacing: 15,
                  mainAxisSpacing: 15,
                ),
                itemCount: 20,
                itemBuilder: (context, index) {
                  final number = index + 1;
                  final isSelected =  selectedNumber == number;
                  return GestureDetector(
                    onTap: () async{
                      setState(() {
                        selectedNumber = number;
                      });
                      await player.stop();
                      await player.play(AssetSource(numbersList[index].audio));
                    },
                    child: AnimatedContainer(
                      duration: const Duration(milliseconds: 300),
                      decoration: BoxDecoration(
                        color: isSelected
                            ? Colors.orange.shade300
                            : Colors.green.shade300,

                        borderRadius: BorderRadius.circular(20),
                        boxShadow: [
                          BoxShadow(
                            color: Colors.grey
                                .withOpacity(0.7),
                            blurRadius:  8,
                            offset: Offset(0, 6),
                          ),
                        ],
                      ),
                      child: Center(
                        child: Text(
                          number.toString(),
                          style: TextStyle(
                            fontSize: isSelected ? 36 : 30,
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
