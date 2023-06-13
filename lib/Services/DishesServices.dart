import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:qfoods_vendor/Model/VendorDishesModel.dart';
import 'package:qfoods_vendor/constants/api_services.dart';
import 'package:shared_preferences/shared_preferences.dart';

class DishesServices{
  Future<List<VendorDishesModel>> getDishesServices() async{
   List<VendorDishesModel> _dishes = [];
    final SharedPreferences prefs = await SharedPreferences.getInstance();
  final restaurant_id = await prefs.getInt("restaurant_id") ?? null;
  if(restaurant_id == null) return _dishes;
 print("${ApiServices.dishes_list}${restaurant_id}");
  var response = await http.get(Uri.parse("${ApiServices.dishes_list}${restaurant_id}"));
     if(response.statusCode == 200){
        var response_body = json.decode(response.body);
  for(var json in response_body){
     
      _dishes.add(VendorDishesModel.fromJson(json));
       }
     }

 return _dishes;
}


 Future<List<VendorDishesModel>> UpdateDishesServices(final req_data) async{
   List<VendorDishesModel> _dishes = [];
  final jsonData = json.encode(req_data?.toList());
   var header ={
  'Content-type': 'application/json'
 };
 print(jsonData);
    final response = await http.put(Uri.parse("${ApiServices.update_menu_dishes}"), body: jsonData, headers: header);
   if(response.statusCode == 200){
        var response_body = json.decode(response.body);
        print(response_body);
  for(var json in response_body){
     
      _dishes.add(VendorDishesModel.fromJson(json));
       }
     }

 return _dishes;
}
}