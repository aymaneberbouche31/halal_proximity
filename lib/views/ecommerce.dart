import 'package:flutter/material.dart';
import 'package:halal_proximity/views/home_screen.dart';

class Ecommerce extends StatelessWidget {
  const Ecommerce({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Scaffold(
        backgroundColor: Colors.grey[100],
        body: Center(
            child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 25.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              //logo
              Padding(
                padding: const EdgeInsets.all(25.0),
                child: Image.asset(
                  'assets/images/fp_transparent.png',
                  height: 350,
                ),
              ),

              const SizedBox(height: 48),

              //title
              const Text('Just Do It',
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 20,
                  )),

              const SizedBox(height: 24),

              // sub title
              const Text(
                'Brand new sneakers and custom made with premium quality',
                style: TextStyle(
                  fontSize: 16,
                  color: Colors.black,
                ),
                textAlign: TextAlign.center,
              ),

              const SizedBox(height: 48),
              // Start new button
              GestureDetector(
                onTap: () => Navigator.push(context, 
                MaterialPageRoute(
                  builder: (context) => HomeScreen(),
                  ),
                  ),
                  child: Container(
                  decoration: BoxDecoration(
                    color: Colors.grey[900],
                    borderRadius: BorderRadius.circular(12)),
                  padding: EdgeInsets.all(25),
                  child: const Center(
                    child: const Text('Shop Now', 
                    style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                      fontSize: 16))))
              ),
            ],
          )
    
        )),
      ),
    );
  }
}
