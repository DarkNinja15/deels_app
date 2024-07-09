import 'package:deels_app/models/product_model.dart';
import 'package:deels_app/models/ticket_model.dart';
import 'package:deels_app/models/user_model.dart';
import 'package:get/get.dart';

class Store{
  User user=User(name: '', email: '', phone: '', profileUrl: '', gender: '');
  Product product = Product(prodId:'',title: '', description: '', userId: '', userPhone: '',imageUrl: '', price: 0.0, tags: []);
  Ticket ticket = Ticket(title: '', description: '', tags: [], image: '', demandCount: 0);
  RxList<Product> products = List<Product>.empty(growable: true).obs;
  RxList<Product> currProducts = List<Product>.empty(growable: true).obs;

  void clearUser(){
    user=User(name: '', email: '', phone: '', profileUrl: '',gender: '');
  }

  void clearProduct(){
    product = Product(prodId:'',title: '', description: '', userId: '', userPhone: '',imageUrl: '', price: 0.0, tags: []);
  }

  void clearTicket(){
    ticket = Ticket(title: '', description: '', tags: [], image: '', demandCount: 0);
  }

  void clearProducts(){
    products.clear();
    currProducts.clear();
  }
}