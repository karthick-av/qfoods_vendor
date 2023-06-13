
class ApiServices{
  ApiServices._();
    static  const BASEURL = "http://192.168.10.5:1999/";
//    static const SOCKET_RECENT_ORDER_URL = "${BASEURL}recentorder";

   static const login = "${BASEURL}vendor/user/login";  

   static const add_menu = "${BASEURL}vendor/menu/";
   static const menus_list = "${BASEURL}vendor/menu/menus/";
   static const update_menus_list = "${BASEURL}vendor/menu/menus";


   static const dishes_list = "${BASEURL}vendor/dishes/";
   static const update_menu_dishes = "${BASEURL}vendor/dishes/menuanddishesstatus";
    static const update_dishes = "${BASEURL}vendor/dishes/update_dish";
     static const add_variant = "${BASEURL}vendor/dishes/addVariant"; 
   static const add_variant_item = "${BASEURL}vendor/dishes/addVariantitem"; 
  
  static const update_variant_item = "${BASEURL}vendor/dishes/updateVariantitem"; 
  
     static const delete_variant = "${BASEURL}vendor/dishes/deleteVariant"; 
  
     static const delete_variant_item = "${BASEURL}vendor/dishes/deleteVariantitem"; 
  
   static const add_dish = "${BASEURL}vendor/dishes/addDish"; 
   
   static const delete_dish = "${BASEURL}vendor/dishes/deletedish"; 

   static const updatemenu = "${BASEURL}vendor/dishes/updatemenu"; 
   static const dashboard = "${BASEURL}vendor/dashboard/count/";

   static const orders = "${BASEURL}vendor/orders/";
     }