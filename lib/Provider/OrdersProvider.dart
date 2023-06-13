


import 'package:flutter/material.dart';
import 'package:qfoods_vendor/Model/OrderModel.dart';

class OrdersProvider extends ChangeNotifier {

  List<OrderModel> orders = [];

  addAll(List<OrderModel> data){
    orders = data;
    notifyListeners();
  }

  
  add(List<OrderModel> data){
    orders = [...orders, ...data];
    notifyListeners();
  }
update(OrderModel data){
   int index = orders?.indexWhere((e) => e?.orderId == data?.orderId) ?? -1;
   if(index != -1){
    orders[index] = data;
   }
   notifyListeners();
  }
}