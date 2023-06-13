


import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:qfoods_vendor/Model/MenusModel.dart';
import 'package:qfoods_vendor/Model/VendorDishesModel.dart';
import 'package:qfoods_vendor/Services/DishesServices.dart';
import 'package:qfoods_vendor/constants/CustomSnackBar.dart';

class DishesProvider extends ChangeNotifier {
  
  final _service = DishesServices();

  bool isLoading = false;
  bool updateLoading = false;
  List<VendorDishesModel> dishes = [];
  List<dynamic> dishes_ = [];

  List menu = [];
  
 

 
  Future<void> getDishes() async{
   isLoading = true;
    notifyListeners();

 try{
  List<dynamic> org = [];
  List<VendorDishesModel>  data = await _service.getDishesServices();
   data?.forEach((m) {
       m?.dishes?.forEach((v) {
    
     org?.add({
       "menu_id": m?.menuId,
      "menu_item_id": v?.menuItemId,
      "product_id": v?.dishId,
      "status": v?.status,
      "position": v?.position,
      "restaurant_id": v?.restaurantId
     });
       });
   });

     dishes = data;
     dishes_ = org?.toList() ?? [];
    isLoading = false;
    notifyListeners();

 }
 catch(e){
    isLoading = false;
    notifyListeners();
    print(e);
 }
  } 


  void addDishes(List<VendorDishesModel> _dishes){
    dishes = _dishes;
    notifyListeners();
  }


  Future<void> UpdateDishes() async{
   try{
    List<dynamic> updateData = [];
   dishes?.forEach((m) {
       m?.dishes?.forEach((v) {
         final isExist = updateData?.where((element) => element?["product_id"] == v?.dishId);
         if(isExist?.length == 0){
          updateData.add({
      "menu_id": m?.menuId,
      "menu_item_id": v?.menuItemId,
      "product_id": v?.dishId,
      "status": v?.status,
      "position": v?.position,
      "restaurant_id": v?.restaurantId
     }); 
         }

       });
   });

  final changedData = updateData?.where((e) {
     return (dishes_?.where((v)  {
     return( v["status"] != e["status"] || v["position"] != e["position"]) && (v["product_id"] == e["product_id"] && v["menu_id"] == e["menu_id"] && v["menu_item_id"] == e["menu_item_id"]);
     })?.length ?? 0) > 0 ;
  }) ?? []; 

if(changedData?.length  == 0) return;
  updateLoading = true;
    notifyListeners();
  
List<VendorDishesModel> _resp_dishes = await _service.UpdateDishesServices(changedData);

    updateLoading = false;
   notifyListeners();
 if((_resp_dishes?.length ?? 0) > 0){
   CustomSnackBar().ErrorMsgSnackBar("Updated !!!");

   dishes = _resp_dishes;

    List<dynamic> org = [];
   _resp_dishes?.forEach((m) {
       m?.dishes?.forEach((v) {
    
     org?.add({
       "menu_id": m?.menuId,
      "menu_item_id": v?.menuItemId,
      "product_id": v?.dishId,
      "status": v?.status,
      "position": v?.position,
      "restaurant_id": v?.restaurantId
     });
       });
   });

     dishes_ = org?.toList() ?? [];
   notifyListeners();

 }

   }catch(e){
    print(e);
    updateLoading = false;
   notifyListeners();
   }
  }





void addDishesList(Dishes dish){
  List<VendorDishesModel> mDishes = dishes;
 for(int i = 0; i < mDishes.length; i++){
  for(int j = 0; j < (mDishes[i]?.dishes?.length ?? 0); j++){
     if(mDishes[i]?.dishes?[j]?.dishId == dish?.dishId){
        mDishes[i]?.dishes?[j] = dish;
     }
 }
 }
 dishes = mDishes;
 notifyListeners();
}


void addmenu(List data){
  menu = data;
  notifyListeners();
}
}