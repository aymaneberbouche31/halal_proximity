import 'package:flutter/material.dart';
import 'package:halal_proximity/models/shoe.dart';

class Cart extends ChangeNotifier {
// List of shoes for sale
  List<Shoe> shoeShop = [
    Shoe(
        name: 'Dunk Low ',
        price: '220',
        imagePath: 'assets/images/nike_rose.png',
        description: 'Nike Dunk Low Premium'),
    Shoe(
        name: 'Zoom FREAK',
        price: '236',
        imagePath: 'assets/images/zoom.png',
        description: 'Zoom FREAK'),
    Shoe(
        name: 'Air Jordan',
        price: '200',
        imagePath: 'assets/images/jordan.png',
        description:
            'Air Jordan'),
  ];

//list of items in user cart
  List<Shoe> userCart = [];

//get list of shoes for sale
  List<Shoe> getShoeList() {
    return shoeShop;
  }

//get cart
  List<Shoe> getUserCart() {
    return userCart;
  }

// add items to cart
  void addItemToCart(Shoe shoe) {
    userCart.add(shoe);
    notifyListeners();
  }

//remove itemfrom cart
  void removeItemFromCart(Shoe shoe) {
    userCart.remove(shoe);
    notifyListeners();
  }
}
