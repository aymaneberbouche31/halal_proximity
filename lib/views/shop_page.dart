import 'package:flutter/material.dart';
import 'package:halal_proximity/components/shoe_tile.dart';
import 'package:halal_proximity/models/shoe.dart';
import 'package:provider/provider.dart';

import '../models/cart.dart';

/* Une page où l'utilisateur peut consulter et ajouter des produits au panier */
class ShopPage extends StatefulWidget {
  const ShopPage({super.key});

  @override
  State<ShopPage> createState() => _ShopPageState();
}

class _ShopPageState extends State<ShopPage> {
  // add shoe to cart
  void addShoeToCart(Shoe shoe) {
    Provider.of<Cart>(context, listen: false).addItemToCart(shoe);

    // alert the user, shoe successfully added
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: Text('Bien ajouté!'),
        content: Text('Regardez votre panier'),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          padding: const EdgeInsets.all(12),
          margin: const EdgeInsets.symmetric(horizontal: 25),
          decoration: BoxDecoration(
            color: Colors.grey[200],
            borderRadius: BorderRadius.circular(8),
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: const [
              Text('Rechercher', style: TextStyle(color: Colors.grey)),
              Icon(Icons.search, color: Colors.grey),
            ],
          ),
        ),

        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 25.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween, // pour séparer les éléments
            crossAxisAlignment: CrossAxisAlignment.end, // pour aligner de façon bottom à la ligne
            children: const [
              Text(
                'Exclus 🔥',
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 24,
                ),
              ),
              Text(
                "Voir tout",
                style: TextStyle(fontWeight: FontWeight.bold, color: Colors.blue),
              )
            ],
          ),
        ),
        const SizedBox(height: 10),

        // List of shoes for sale
        Expanded(
          child: Consumer<Cart>(
            builder: (context, value, child) {
              return ListView.builder(
                scrollDirection: Axis.horizontal,
                itemCount: value.getShoeList().length,
                itemBuilder: (context, index) {
                  // get a shoe from shop list
                  Shoe shoe = value.getShoeList()[index];

                  // return the shoe
                  return ShoeTile(
                    shoe: shoe,
                    onTap: () => addShoeToCart(shoe),
                  );
                },
              );
            },
          ),
        ),
      ],
    );
  }
}
