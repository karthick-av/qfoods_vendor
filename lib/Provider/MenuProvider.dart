

import 'package:flutter/cupertino.dart';
import 'package:qfoods_vendor/Model/MenusModel.dart';
import 'package:qfoods_vendor/Services/MenuServices.dart';

class MenuProvider extends ChangeNotifier {
  
  final _service = MenuServices();

  bool isLoading = false;
  List<MenusModel> menus = [];

    Future<void> getMenus() async{
   isLoading = true;
    notifyListeners();

 try{
    menus = await _service.getMenuServices();
    isLoading = false;
    notifyListeners();

 }
 catch(e){
    isLoading = false;
    notifyListeners();
    print(e);
 }
  } 


  void addMenus(List<MenusModel> __menus){
    menus = __menus;
    notifyListeners();
  }

}