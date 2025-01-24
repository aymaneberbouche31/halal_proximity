import 'package:flutter/material.dart';
import 'package:halal_proximity/models/cart.dart';
import 'package:halal_proximity/models/shoe.dart';
import 'package:provider/provider.dart';
/*  
Le composant CartItem représente un élément individuel dans le panier (cart).
Il affichera les informations d'un produit (nom, prix, image) et permet de le retirer du panier.
*/
class CartItem extends StatefulWidget {
  Shoe shoe;
  CartItem({super.key, required this.shoe});

  @override
  State<CartItem> createState() => _CartItemState();
}

class _CartItemState extends State<CartItem> {
  /*Appelle la méthode removeItemFromCart sur l'objet global Cart via 
  Provider, pour retirer cet élément.*/
  void removeItemFromCart(){
  Provider.of<Cart>(context, listen: false).removeItemFromCart(widget.shoe);
}
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.grey[100],
        borderRadius: BorderRadius.circular(8)
      ),
      margin: const EdgeInsets.only(bottom: 20),
      child: ListTile(
      leading: Image.asset(widget.shoe.imagePath),
      title : Text(widget.shoe.name),
      subtitle: Text(widget.shoe.price),
      trailing: IconButton(
        icon : Icon(Icons.delete), 
      onPressed: removeItemFromCart,),
    )
    );
  }
}