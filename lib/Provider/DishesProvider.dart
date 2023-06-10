


import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:qfoods_vendor/Model/VendorDishesModel.dart';
import 'package:qfoods_vendor/Services/DishesServices.dart';
import 'package:qfoods_vendor/constants/CustomSnackBar.dart';

class DishesProvider extends ChangeNotifier {
  
  final _service = DishesServices();

  bool isLoading = false;
  bool updateLoading = false;
  List<VendorDishesModel> dishes = [];
  List<VendorDishesModel> _dishes_ = [];

  Future<void> getDishes() async{
   isLoading = true;
    notifyListeners();

 try{
    dishes = await _service.getDishesServices();
    _dishes_ = dishes;
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
    updateLoading = true;
    notifyListeners();
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
final dd = json.encode(updateData);
print("ddd ${dd}");
List<VendorDishesModel> _resp_dishes = await _service.UpdateDishesServices(updateData);

    updateLoading = false;
   notifyListeners();
 if((_resp_dishes?.length ?? 0) > 0){
   CustomSnackBar().ErrorMsgSnackBar("Updated !!!");

   dishes = _resp_dishes;
   _dishes_ = _resp_dishes;
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
}