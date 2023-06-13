

import 'package:flutter/cupertino.dart';
import 'package:qfoods_vendor/Model/MenusModel.dart';
import 'package:qfoods_vendor/Services/MenuServices.dart';

class MenuProvider extends ChangeNotifier {
  
  final _service = MenuServices();

  bool isLoading = false;
  List<MenusModel> menus = [];
   List<dynamic> menus_ = [];


    Future<void> getMenus() async{
   isLoading = true;
    notifyListeners();

 try{
   List<dynamic> org = [];
 
    List<MenusModel> res_menus = await _service.getMenuServices();
    res_menus?.forEach((e) {
       org.add({
        "menu_id": e?.menuId,
        "status": e?.status
       });
    });

    menus =res_menus;
    menus_ = org?.toList() ?? [];
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