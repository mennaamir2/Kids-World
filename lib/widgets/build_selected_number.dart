import 'package:flutter/material.dart';
class BuildSelectedNumber extends StatelessWidget {
  const BuildSelectedNumber({super.key, required this.selectedNumber});
  final int? selectedNumber;
  @override
  Widget build(BuildContext context) {
    return  Container(
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
            selectedNumber.toString(),
            style: TextStyle(
              fontSize: 100,
              fontWeight: FontWeight.bold,
              color: Colors.green,
            ),
          ),
          const SizedBox(height: 20),
          Wrap(
            spacing: 10,
            runSpacing: 10,
            children: List.generate(
              selectedNumber!,
                  (index) => Container(
                width: 40,
                height: 40,
                decoration: BoxDecoration(
                  color: Colors.amber.shade400,
                  shape: BoxShape.circle,
                  boxShadow: [
                    BoxShadow(
                      color: Colors.amber.shade600,
                      blurRadius: 5,
                      offset: const Offset(0, 3),
                    ),
                  ],
                ),
                child: const Center(
                  child: Icon(
                    Icons.star,
                    color: Colors.white,
                    size: 24,
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
