import 'package:flutter/material.dart';
import 'package:halal_proximity/components/cart_item.dart';
import 'package:provider/provider.dart';

import '../models/cart.dart';
import '../models/shoe.dart';

/*  La page du panier liste tous les produits ajoutés par l'utilisateur et leur permet de les consulter ou de les supprimer.*/
class CartPage extends StatefulWidget {
  const CartPage({super.key});

  @override
  State<CartPage> createState() => _CartPageState();
}

class _CartPageState extends State<CartPage> {
  @override
  Widget build(BuildContext context) {
    /* Utilise Consumer<Cart> pour écouter les modifications de l'état du panier (Cart). */
    return Consumer<Cart>(
      builder: (context, value, child) => Padding(
        padding: const EdgeInsets.symmetric(horizontal: 25.0),
        child: Column(children: [
          const Text('Mon Panier', style: TextStyle(fontWeight: FontWeight.bold, fontSize: 24)
          ),
          const SizedBox(height: 10),
          Expanded(child: ListView.builder(
            itemCount: value.getUserCart().length,
            itemBuilder: (context, index){
            Shoe individualShoe = value.getUserCart()[index];
            return CartItem(shoe: individualShoe);
          }))
        ],)
      )
    );
  }
}