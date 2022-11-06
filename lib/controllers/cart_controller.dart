import 'package:get/get.dart';
import 'package:shopping_cart/models/product.dart';

class CartController extends GetxController {
  var cartList = <Product>[].obs;
  double get totalPrice => cartList.fold(0, (sum, item) => sum + item.price);
  int get cartItemCount => cartList.length;
  addToCart(Product product) {
    cartList.add(product);
  }
}
