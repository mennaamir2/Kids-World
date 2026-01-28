import 'package:flutter/material.dart';
import 'package:kids_world/models/alphabet_model.dart';
class BuildSelectedAlphabet extends StatelessWidget {
  const BuildSelectedAlphabet({super.key, this.selectedAlphabet});
  final AlphabetModel? selectedAlphabet;
  @override
  Widget build(BuildContext context) {
    return               Container(
      width: 300,
      margin: const EdgeInsets.all(20),
      padding: const EdgeInsets.all(30),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(25),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.shade400,
            blurRadius: 20,
            offset: const Offset(3, 10),
          ),
        ],
      ),
      child: Column(
        children: [
          Text(
            selectedAlphabet!.letter,
            style: TextStyle(
              fontSize: 100,
              fontWeight: FontWeight.bold,
              color: Colors.blue.shade200,
            ),
          ),
          const SizedBox(height: 10),
          Text(
            selectedAlphabet!.word,
            style:  TextStyle(
              fontSize: 32,
              fontWeight: FontWeight.w600,
              color: Colors.grey[700],
            ),
          ),
        ],
      ),
    );
  }
}
