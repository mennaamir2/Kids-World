import 'package:audioplayers/audioplayers.dart';
import 'package:flutter/material.dart';
import 'package:kids_world/data/animal_data.dart';
import 'package:kids_world/widgets/custom_app_bar.dart';
class AnimalsPage extends StatefulWidget {
  const AnimalsPage({super.key});

  @override
  State<AnimalsPage> createState() => _AnimalsPageState();
}

class _AnimalsPageState extends State<AnimalsPage> {
  final AudioPlayer player = AudioPlayer();


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(color: Colors.purple.shade100, title: "Animals"),
      body: Container(
        color: Colors.purple.shade50,
        child: GridView.builder(
          padding: const EdgeInsets.all(20),
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            crossAxisSpacing: 20,
            mainAxisSpacing: 20,
            childAspectRatio: .9,
          ),
          itemCount: animals.length,
          itemBuilder: (context, index) {
            final animal = animals[index];
            return Container(
              decoration: BoxDecoration(
                color: Colors.purple.shade100,
                borderRadius: BorderRadius.circular(25),
                boxShadow: [
                  BoxShadow(
                    color: Colors.grey.withOpacity(0.4),
                    blurRadius: 15,
                    offset: const Offset(0, 6),
                  ),
                ],
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    animal.emoji,
                    style: const TextStyle(fontSize: 70),
                  ),
                  Text(
                    animal.name,
                    style: const TextStyle(
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                    ),
                  ),
                  const SizedBox(height: 5),
                  InkWell(
                    onTap: () async {
                      await player.stop();
                      await player.play(
                        AssetSource(animal.audio),
                      );
                    },
                    child: Container(
                      padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 5),
                      decoration: BoxDecoration(
                        color: Colors.white.withOpacity(0.3),
                        borderRadius: BorderRadius.circular(15),
                      ),
                      child: Text(
                        animal.sound,
                        style: const TextStyle(
                          fontSize: 16,
                          fontStyle: FontStyle.italic,
                          color: Colors.white,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            );
          },
        ),
      ),
    );
  }
}
