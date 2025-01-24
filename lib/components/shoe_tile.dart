import 'package:flutter/material.dart';
import '../models/shoe.dart';

class ShoeTile extends StatelessWidget {
  final Shoe shoe;
  final void Function()? onTap;

  ShoeTile({super.key, required this.shoe, required this.onTap});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(left: 25),
      width: 250,
      decoration: BoxDecoration(
        color: Colors.grey[100],
        borderRadius: BorderRadius.circular(12),
      ),
      child: Column(
        children: [
          // Image adaptée
          AspectRatio(
            aspectRatio: 1, // Proportions carrées pour l'image
            child: ClipRRect(
              borderRadius: BorderRadius.circular(12),
              child: Image.asset(
                shoe.imagePath,
                fit: BoxFit.cover, // Adapte l'image pour remplir l'espace
                width: double.infinity, // S'assure que l'image remplit la largeur
              ),
            ),
          ),

          // Description
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 8.0),
            child: Text(
              shoe.description,
              style: TextStyle(color: Colors.grey[600]),
              maxLines: 2, // Limite le texte à deux lignes
              overflow: TextOverflow.ellipsis, // Ajoute "..." si le texte dépasse
            ),
          ),

          const SizedBox(height: 10),

          // Prix et bouton
          Padding(
            padding: const EdgeInsets.only(left: 15.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      shoe.name,
                      style: const TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 18,
                      ),
                    ),
                    const SizedBox(height: 5),
                    Text(
                      '${shoe.price}€',
                      style: const TextStyle(color: Colors.grey),
                    ),
                  ],
                ),
                GestureDetector(
                  onTap: onTap,
                  child: Container(
                    padding: const EdgeInsets.all(15),
                    decoration: const BoxDecoration(
                      color: Colors.black,
                      borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(12),
                        bottomRight: Radius.circular(12),
                      ),
                    ),
                    child: const Icon(
                      Icons.add,
                      color: Colors.white,
                    ),
                  ),
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}
