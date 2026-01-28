import 'package:flutter/material.dart';
import 'package:kids_world/pages/alphabet_page.dart';
import 'package:kids_world/pages/animals_page.dart';
import 'package:kids_world/pages/colors_page.dart';
import 'package:kids_world/pages/numbers_page.dart';
import 'package:kids_world/pages/shapes_page.dart';
import 'package:kids_world/widgets/build_activity_card.dart';
class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> with TickerProviderStateMixin {
  late AnimationController _controller;


  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
            colors: [
              const Color(0xFFFFE5E5),
              const Color(0xFFE5F3FF),
              const Color(0xFFFFF9E6),
            ],
          ),
        ),
        child: SafeArea(
          child: Column(
            children: [

              Container(
                padding: const EdgeInsets.only(bottom: 20,top: 35),
                child: Text(
                  'Kids World',
                  style: TextStyle(
                    fontSize: 36,
                    fontWeight: FontWeight.bold,
                    color: Colors.pink.shade500,
                    shadows: [
                      Shadow(
                        offset: Offset(2, 2),
                        blurRadius: 4,
                        color: Colors.black26,
                      ),
                    ],
                  ),
                ),
              ),
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: GridView.count(
                    crossAxisCount: 2,
                    crossAxisSpacing: 20,
                    mainAxisSpacing: 20,
                    children: [
                      BuildActivityCard(
                        title:'ABC',
                        icon:Icons.abc_rounded,
                        color:Colors.blue.shade200,
                        onTap:  () => Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => const AlphabetPage()),
                        ),
                      ),
                      BuildActivityCard(
                        title:'123',
                        icon:Icons.calculate_rounded,
                        color:Colors.green.shade200,
                        onTap: () => Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => const NumbersPage()),
                        ),
                      ),
                      BuildActivityCard(
                        title:'Colors',
                        icon:Icons.palette_rounded,
                        color:Colors.pink.shade100,
                        onTap: () => Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => const ColorsPage()),
                        ),
                      ),
                      BuildActivityCard(
                        title:'Shapes',
                        icon:Icons.category_rounded,
                        color:Colors.orange.shade200,
                        onTap: () => Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => const ShapesPage()),
                        ),
                      ),
                      BuildActivityCard(
                        title:'Animals',
                        icon:Icons.pets_rounded,
                        color:Colors.purple.shade100,
                        // Colors.purple.shade700,
                        onTap:  () => Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => const AnimalsPage()),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}