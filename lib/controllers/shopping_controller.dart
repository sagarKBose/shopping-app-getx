import 'package:get/get.dart';
import 'package:shopping_cart/models/product.dart';

class ShoppingController extends GetxController {
  var productList = <Product>[].obs;

  @override
  void onInit() {
    super.onInit();
    fetchProducts();
  }

  void fetchProducts() async {
    await Future.delayed(const Duration(seconds: 1));
    var fetchedProducts = [
      Product(
          id: 1,
          price: 30,
          productDescription: 'some description about product',
          productImage: 'abd',
          productName: 'First Product'),
      Product(
          id: 2,
          price: 40,
          productDescription: 'some description about product',
          productImage: 'abd',
          productName: 'Sec Product'),
      Product(
          id: 3,
          price: 49.5,
          productDescription: 'some description about product',
          productImage: 'abd',
          productName: 'Third Product'),
    ];
    productList.value = fetchedProducts;
  }
}
