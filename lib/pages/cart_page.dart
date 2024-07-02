import 'package:ecommerce_app_flutter/components/cart_item.dart';
import 'package:ecommerce_app_flutter/models/cart.dart';
import 'package:ecommerce_app_flutter/models/shoe.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class CartPage extends StatefulWidget {
  const CartPage({super.key});

  @override
  State<CartPage> createState() => _CartPageState();
}

class _CartPageState extends State<CartPage> {
  @override
  Widget build(BuildContext context) {
    return Consumer<Cart>(builder: (context, value, child) {
      return Padding(
        padding: const EdgeInsets.symmetric(horizontal: 24),
        child: Column(children: [
          const Text('Cart',
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
              )),

          const SizedBox(height: 10),

          // cart items
          Expanded(
            child: ListView.builder(
              itemCount: value.getUserCart().length,
              itemBuilder: (context, index) {
                Shoe individualShoe = value.getUserCart()[index];
                return CartItem(
                    individualShoe: individualShoe,
                    onTabToRemoveItem: () {
                      value.removeItemFromCart(individualShoe);
                    });
              },
            ),
          ),
        ]),
      );
    });
  }
}
