import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:qfoods_vendor/Model/MenusModel.dart';
import 'package:qfoods_vendor/constants/api_services.dart';
import 'package:shared_preferences/shared_preferences.dart';

class MenuServices{
Future<List<MenusModel>> getMenuServices() async{
   List<MenusModel> _menus = [];
    final SharedPreferences prefs = await SharedPreferences.getInstance();
  final restaurant_id = await prefs.getInt("restaurant_id") ?? null;
  if(restaurant_id == null) return _menus;
 print("${ApiServices.menus_list}${restaurant_id}");
  var response = await http.get(Uri.parse("${ApiServices.menus_list}${restaurant_id}"));
     if(response.statusCode == 200){
        var response_body = json.decode(response.body);
  for(var json in response_body){
     
      _menus.add(MenusModel.fromJson(json));
       }
     }

 return _menus;
}
}