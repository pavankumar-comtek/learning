import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:learning/models/product_model.dart';
import 'package:learning/providers/base_provider.dart';

class BagProvider extends BaseProvider {
  BagProvider() {
    getProducts();
  }
  int productCount = 0;
  List<ProductDetails> bagProducts = [];
  List<ProductDetails> products = [];
  double totalAmount = 0.0;

  //Function to add product to bag

  // Synchronous and Asynchronous

  void addProductToBag(ProductDetails product) {
    //product count increment.
    productCount++;
    // add product to List
    bagProducts.add(product);

    totalAmount =
        (product.productPrice) * product.productQuantity + totalAmount;
    notifyListeners();
  }

  void removeProductFromBag(ProductDetails product) {
    productCount--;
    bagProducts.remove(product);
    totalAmount =
        totalAmount - (product.productPrice) * product.productQuantity;
    notifyListeners();
  }

  void increaseQuantity(int index) {
    bagProducts[index].productQuantity++;
    notifyListeners();
  }

  void getProducts() async {
    //Exception handling
    try {
      products = await bookApi.loadProducts();
      notifyListeners();
    } catch (e) {
      log("Error $e");
    }
  }
}
