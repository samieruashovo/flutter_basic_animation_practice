import 'package:flutter/material.dart';

class ShoppingCartButton extends StatefulWidget {
  const ShoppingCartButton({super.key});

  @override
  State<ShoppingCartButton> createState() => _ShoppingCartButtonState();
}

class _ShoppingCartButtonState extends State<ShoppingCartButton> {
  bool isExpaned = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Shopping Cart'),
      ),
      body: Center(
        child: GestureDetector(
          onTap: () {
            setState(() {
              isExpaned = !isExpaned;
            });
          },
          child: AnimatedContainer(
            duration: const Duration(milliseconds: 1000),
            width: isExpaned ? 300 : 80.0,
            height: 60.0,
            decoration: BoxDecoration(
              color: isExpaned ? Colors.green : Colors.blue,
              borderRadius: BorderRadius.circular(isExpaned ? 30 : 10.0),
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Icon(
                  isExpaned ? Icons.check : Icons.shopping_cart,
                  color: Colors.white,
                ),
                if (isExpaned)
                  const Text("Added to Cart",
                      style: TextStyle(
                        color: Colors.white,
                      )),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
