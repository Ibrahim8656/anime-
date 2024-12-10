import 'package:flutter/material.dart';
import 'package:my_flutter_project/constants/colors.dart';
import 'package:my_flutter_project/data/models/characters.dart';
import 'package:my_flutter_project/presentaion/screens/characters_detaled_screen.dart';

class CharactersGridView extends StatelessWidget {
  const CharactersGridView({
    required this.allcharacters,
  }) ;
  final List<Results> allcharacters; // Replace 'Character' with your actual model class
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(20.0),
      child: GridView.builder(
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2, // Number of columns
          crossAxisSpacing: 8.0, // Horizontal space between items
          mainAxisSpacing: 8.0, // Vertical space between items
          childAspectRatio: 0.7, // Width to height ratio
        ),
        itemCount: allcharacters.length,
        itemBuilder: (context, index) {
          final character = allcharacters[index];
          return InkWell(
            onTap: (){
              Navigator.push(context, MaterialPageRoute(builder:(context)=>CharactersDetaled(charcters:allcharacters[index] ,)));
            },
            child: Hero(
              tag: character,
              child: ClipRRect(
                borderRadius: BorderRadius.circular(8.0), // Rounded corners
                child: Stack(
                  children: [
                    // Character Image
                    Positioned.fill(
                      child: Image.network(
                        character.image ?? '',
                        fit: BoxFit.cover,
                        errorBuilder: (context, error, stackTrace) => const Icon(
                          Icons.error,
                          color: Colors.red,
                        ),
                        loadingBuilder: (context, child, loadingProgress) {
                          if (loadingProgress == null) return child;
                          return const Center(child: CircularProgressIndicator());
                        },
                      ),
                    ),
                    // Gradient Overlay for Better Text Visibility
                    Positioned(
                      bottom: 0,
                      left: 0,
                      right: 0,
                      child: Container(
                        padding: const EdgeInsets.symmetric(vertical: 8.0, horizontal: 4.0),
                        decoration: BoxDecoration(
                          gradient: LinearGradient(
                            colors: [
                              Colors.black.withOpacity(0.7),
                              Colors.transparent,
                            ],
                            begin: Alignment.bottomCenter,
                            end: Alignment.topCenter,
                          ),
                        ),
                        child: Text(
                          character.name ?? 'Unknown',
                          style: const TextStyle(
                            color: Mycolor.myWhite, // Your custom color
                            fontSize: 14,
                            fontWeight: FontWeight.bold,
                          ),
                          textAlign: TextAlign.center,
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
