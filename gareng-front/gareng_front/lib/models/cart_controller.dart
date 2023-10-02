import 'package:gareng_front/models/product_model.dart';
import 'package:get/get.dart';

class CartController extends GetxController {
  var _products = {}.obs;

  void addProduct(Product product) {
    if (_products.containsKey(product)) {
      _products[product] += 1;
    } else {
      _products[product] = 1;
      Get.snackbar(
          "Product Added", "You Have Added ${product.title} to the cart",
          snackPosition: SnackPosition.TOP,
          duration: const Duration(seconds: 1));
    }

    // print("Products: ${_products}");

    // kalau mau keluarin quantitynya pake ini
    // print("Products: ${_products[product]}");

    // print("Products: ${product}");
  }

  void removeProduct(Product product) {
    if (_products.containsKey(product) && _products[product] == 1) {
      _products.removeWhere((key, value) => key == product);
    } else {
      _products[product] -= 1;
    }

    // print("Products: ${_products}");
    // print("Products Length: ${_products.length}");
  }

  get products => _products;

  get productSubtotal => _products.entries
      .map((product) => product.key.price * product.value)
      .toList();

  String getTotalProduct() {
    if (_products.isEmpty) {
      return "0";
    } else {
      return _products.entries
          .map((product) => int.parse(product.key.price) * product.value)
          .toList()
          .reduce((value, element) => value + element)
          .toString();
    }
  }

  get total => getTotalProduct();

  int getProductQuantity(Product product) {
    if (_products.containsKey(product)) {
      return _products[product];
    } else {
      return 0;
    }
  }

  RxList _filteredData = [].obs;

  @override
  void onInit() {
    super.onInit();
    _filteredData.value = Product.products;
  }

  void getListSearchResult(String input) {
    var result = [];
    if (input.isNotEmpty) {
      result = Product.products
          .where((e) => e.title.toLowerCase().contains(input.toLowerCase()))
          .toList();
    } else {
      result = Product.products;
    }
    _filteredData.value = result;
    // print(_filteredData.value);
  }

  get filteredData => _filteredData;
}
