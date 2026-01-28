import 'package:audioplayers/audioplayers.dart';
import 'package:flutter/material.dart';
import 'package:kids_world/data/shape_data.dart';
import 'package:kids_world/models/shape_model.dart';
import 'package:kids_world/widgets/custom_app_bar.dart';
class ShapesPage extends StatefulWidget {
  const ShapesPage({super.key});

  @override
  State<ShapesPage> createState() => _ShapesPageState();
}

class _ShapesPageState extends State<ShapesPage> {
  final AudioPlayer player = AudioPlayer();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(color: Colors.orange.shade200, title: "Shapes"),
      body: Container(
        color: Colors.orange.shade50,
        child: GridView.builder(
          itemCount: shapesList.length,
          padding: const EdgeInsets.all(20),
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            crossAxisSpacing: 20,
            mainAxisSpacing: 20,
          ),
          itemBuilder: (context, index) {
            final shape = shapesList[index];
            return GestureDetector(
              onTap: () async {
                  await player.stop();
                  await player.play(AssetSource(shape.audio));
              },
              child: _buildShapeCard(shape),
            );
          },
        ),
      ),
    );
  }

  Widget _buildShapeCard(ShapeModel shape){
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(25),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.3),
            blurRadius: 15,
            offset: const Offset(0, 8),
          ),
        ],
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Image.asset(shape.image,scale: .5,),
          Text(
            shape.name,
            style: TextStyle(
              fontSize: 24,
              fontWeight: FontWeight.bold,
              color: shape.color,
            ),
          ),
        ],
      ),
    );
  }
}
