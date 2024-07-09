import 'dart:convert';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:deels_app/features/home/home.dart';
import 'package:deels_app/models/product_model.dart';
import 'package:deels_app/store/store.dart';
import 'package:deels_app/utils/utils.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:uuid/uuid.dart';

class FirestoreService{
  static final FirebaseFirestore _db = FirebaseFirestore.instance;
  

  static void createUser()async{
    try {
      final store=Get.find<Store>();
      if(store.user.gender=="MALE") {
        store.user.profileUrl="https://avatar.iran.liara.run/public/boy";
      } else {
        store.user.profileUrl="https://avatar.iran.liara.run/public/girl";
      }
      await _db.collection('users').doc(store.user.email).set(store.user.toMap());
      Get.find<GetStorage>().write('user', store.user);
      Get.find<GetStorage>().read('user');
      store.clearUser();

      Get.offAll(() => const  Home());
    } catch (e) {
      
      Utils.snackBar("Something went wrong", "User not created");
    }
  }


  static void addProduct()async{
    try {
      final store=Get.find<Store>();
      store.product.prodId=const Uuid().v1();
      final box=Get.find<GetStorage>();
      store.product.userId=jsonDecode(box.read('user'))["email"];
      store.product.userPhone=jsonDecode(box.read('user'))["phone"];
      await _db.collection('products').doc(store.product.prodId).set(store.product.toMap());
      store.clearProduct();
      Get.back();
      Utils.snackBar("Product added", "Product added successfully");
    } catch (e) {
      Utils.snackBar("Something went wrong", "Product not added");
      Get.back();
    }
  }


  static Future<void> getProducts()async{
    try {
      final store=Get.find<Store>();
      final snapshot=await _db.collection('products').get();
      store.products.clear();
      store.currProducts.clear();
      for (final doc in snapshot.docs) {
        store.products.add(Product(
          prodId: doc['prodId'],
          title: doc['title'],
          description: doc['description'],
          userId: doc['userId'],
          userPhone: doc['userPhone'],
          imageUrl: doc['imageUrl'],
          price: doc['price'],
          tags: List<String>.from(doc['tags']),
        ));
      }
      store.currProducts.addAll(store.products);
    } catch (e) {
      Utils.snackBar("Something went wrong", "Products not fetched");
    }
  } 
}