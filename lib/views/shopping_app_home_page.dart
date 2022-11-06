import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shopping_cart/controllers/cart_controller.dart';
import 'package:shopping_cart/controllers/shopping_controller.dart';

class ShoppingAppHomePage extends StatelessWidget {
  ShoppingAppHomePage({super.key});
  final shoppingController = Get.put(ShoppingController());
  final cartController = Get.put(CartController());

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.teal,
        body: Column(
          children: [
            Expanded(
              child: GetX<ShoppingController>(builder: (controller) {
                return ListView.builder(
                  itemCount: controller.productList.length,
                  itemBuilder: (BuildContext context, int index) {
                    return Card(
                      margin: const EdgeInsets.all(12),
                      child: Padding(
                        padding: const EdgeInsets.all(16.0),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.end,
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      controller.productList[index].productName,
                                      style: const TextStyle(fontSize: 24),
                                    ),
                                    Text(
                                      controller.productList[index]
                                          .productDescription,
                                    ),
                                  ],
                                ),
                                Text('\$${controller.productList[index].price}',
                                    style: const TextStyle(fontSize: 24)),
                              ],
                            ),
                            ElevatedButton(
                              onPressed: () {
                                cartController
                                    .addToCart(controller.productList[index]);
                              },
                              child: const Text('Add to Cart'),
                            ),
                          ],
                        ),
                      ),
                    );
                  },
                );
              }),
            ),
            GetX<CartController>(builder: (controller) {
              return Text(
                "Total Amount: \$${controller.totalPrice}",
                style: const TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.w600,
                  fontSize: 28,
                ),
              );
            }),
            const SizedBox(
              height: 100,
            )
          ],
        ),
        floatingActionButton: FloatingActionButton.extended(
          backgroundColor: Colors.amber,
          icon: const Icon(
            Icons.add_shopping_cart_rounded,
            color: Colors.black,
          ),
          onPressed: () {},
          label: GetX<CartController>(builder: (controller) {
            return Text(
              controller.cartItemCount.toString(),
              style: const TextStyle(color: Colors.black, fontSize: 24),
            );
          }),
        ),
      ),
    );
  }
}
