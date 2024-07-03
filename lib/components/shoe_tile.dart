import 'package:flutter/material.dart';
import '../models/shoe.dart';

class ShoeTile extends StatelessWidget {
  Shoe shoe;
  void Function()? onTap;
  ShoeTile({super.key, required this.shoe, required this.onTap});

  @override
  Widget build(BuildContext context) {
    return Container(
        margin: EdgeInsets.only(left: 25),
        width: 250,
        decoration: BoxDecoration(
          color: Colors.grey[100],
          borderRadius: BorderRadius.circular(12),
        ),
        child: Column(
          children: [
            //shoe pic
            ClipRRect(
                borderRadius: BorderRadius.circular(12),
                child: Image.asset(
                  shoe.imagePath,
                  height: 210,
                  fit: BoxFit.cover,
                  width: double.infinity,
                )),
            //description
            Text(shoe.description, style: TextStyle(color: Colors.grey[600])),
            const SizedBox(height: 35),
            //price + details
            Padding(
              padding: const EdgeInsets.only(left: 25.0),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(shoe.name,
                          style: const TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 20,
                          )),
                      const SizedBox(height: 5),
                      Text(shoe.price + '€',
                          style: const TextStyle(
                            color: Colors.grey,
                          ))
                    ],
                  ),

                  //Button +
                  GestureDetector(
                    onTap: onTap,
                    child: Container(
                      padding: EdgeInsets.all(20),
                      decoration: BoxDecoration(
                          color: Colors.black,
                          borderRadius: BorderRadius.only(
                            topLeft: Radius.circular(12),
                            bottomRight: Radius.circular(12),
                          )),
                      child: Icon(
                        Icons.add,
                        color: Colors.white,
                      ),
                    ),
                  )
                ],
              ),
            )
            // Button to add to cart
          ],
        ));
  }
}
