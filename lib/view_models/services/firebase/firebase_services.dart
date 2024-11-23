import 'package:firebase_database/firebase_database.dart';

import '../../../models/cart_model.dart';
import '../../../models/product_model.dart';
import '../../../utils/app_utils.dart';

class FirebaseServices {
  // final FirebaseDatabase _rootRef = FirebaseDatabase.instance;

  static List<ProductModel> productList = <ProductModel>[];
  static List<CartModel> cartList = <CartModel>[];

  // Retrieve all product items from Firebase
  static Future<void> getProducts() async {
    final DatabaseReference databaseReference = FirebaseDatabase.instance.ref();
    try {
      await databaseReference.child('Products').get().then(
        (value) {
          if (value.exists) {
            productList = <ProductModel>[];
            for (var childSnapshot in value.children) {
              final productModel = ProductModel.fromJson(
                  Map<String, dynamic>.from(childSnapshot.value as Map));
              productList.add(productModel);
            }
          }
        },
      );
    } catch (e) {
      AppUtils.mySnackBar(
          title: 'Error', message: 'Failed to retrieve product items');
    }
  }

  static Future<bool> addProduct(ProductModel productModel) async {
    final DatabaseReference databaseReference = FirebaseDatabase.instance.ref();

    try {
      final productRef = databaseReference.child('Products').push();
      productModel.id = productRef.key!; // Assign generated ID to cart object
      await productRef.set(productModel.toJson());
      return true;
    } catch (e) {
      return false;
    }
  }

  static Future<bool> updateProduct(ProductModel productModel) async {
    final DatabaseReference databaseReference = FirebaseDatabase.instance.ref();

    try {
      await databaseReference
          .child('Products')
          .child(productModel.id)
          .update(productModel.toJson());
      return true;
    } catch (e) {
      return false;
    }
  }

  // Retrieve all product items from Firebase
  static Future<void> getCarts() async {
    final DatabaseReference databaseReference = FirebaseDatabase.instance.ref();
    try {
      await databaseReference
          .child('Carts')
          .child(AppUtils.userEmailKey)
          .get()
          .then(
        (value) {
          cartList.clear();
          if (value.exists) {
            for (var childSnapshot in value.children) {
              final cartModel = CartModel.fromJson(
                  Map<String, dynamic>.from(childSnapshot.value as Map));
              cartList.add(cartModel);
            }
          }
        },
      );
    } catch (e) {
      AppUtils.mySnackBar(
          title: 'Error', message: 'Failed to retrieve product items');
    }
  }

  static Future<bool> addCart(CartModel cartModel) async {
    final DatabaseReference databaseReference = FirebaseDatabase.instance.ref();

    try {
      print('Add Cart User Email ${AppUtils.userEmailKey}');
      final cartRef =
          databaseReference.child('Carts').child(AppUtils.userEmailKey).push();
      cartModel.id = cartRef.key!; // Assign generated ID to cart object
      await cartRef.set(cartModel.toJson());
      return true;
    } catch (e) {
      return false;
    }
  }

  static Future<bool> deleteCart(String id) async {
    final DatabaseReference databaseReference = FirebaseDatabase.instance.ref();

    try {
      await databaseReference
          .child('Carts')
          .child(AppUtils.userEmailKey)
          .child(id)
          .remove();
      return true;
    } catch (e) {
      return false;
    }
  }

  static Future<bool> deleteAllCart() async {
    final DatabaseReference databaseReference = FirebaseDatabase.instance.ref();

    try {
      await databaseReference
          .child('Carts')
          .child(AppUtils.userEmailKey)
          .remove();
      FirebaseServices.cartList.clear();
      return true;
    } catch (e) {
      return false;
    }
  }
}
