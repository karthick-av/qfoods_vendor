import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:qfoods_vendor/Controller/DrawerIndexController.dart';
import 'package:qfoods_vendor/Screens/DishesScreen/DishesScreen.dart';
import 'package:qfoods_vendor/Screens/LoginScreen/LoginScreen.dart';
import 'package:qfoods_vendor/Screens/MenusScreen/MenusScreen.dart';
import 'package:qfoods_vendor/constants/colors.dart';
import 'package:qfoods_vendor/constants/font_family.dart';

import 'package:shared_preferences/shared_preferences.dart';
class DrawerMenu extends StatefulWidget {
  const DrawerMenu({super.key});

  @override
  State<DrawerMenu> createState() => _DrawerMenuState();
}

class _DrawerMenuState extends State<DrawerMenu> {

  @override
  Widget build(BuildContext context) {
 final DrawerIndexController controller = Get.put(DrawerIndexController());
 Color drawerColor(int index){
  
Color color = controller.currentIndex ==  index ? AppColors.primaryColor : AppColors.greyBlackcolor;
return color;
 }
  return Drawer(
        child: SafeArea(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              ListView(
                shrinkWrap: true,
                padding: EdgeInsets.zero,
                children: [
                
                  ListTile(
                    leading: Icon(Icons.dashboard, size: ScreenUtil().setSp(25), color: drawerColor(1),),
                    title:  Text(' Dashboard', style: TextStyle(color: drawerColor(1), fontFamily: FONT_FAMILY, fontSize: ScreenUtil().setSp(14)),),
                    onTap: () {
                        //  Navigator.push(
                        //   context,
                        //   MaterialPageRoute(builder: (context) => 
                        //  Navigation()),
                        // );
                       controller.currentIndex(1);
                    },
                  ),

                   ListTile(
                    leading: Icon(Icons.dashboard, size: ScreenUtil().setSp(25), color: drawerColor(2),),
                    title:  Text(' Menus', style: TextStyle(color: drawerColor(2), fontFamily: FONT_FAMILY, fontSize: ScreenUtil().setSp(14)),),
                    onTap: () {
                         Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => 
                         MenusScreen()),
                        );
                       controller.currentIndex(2);
                    },
                  ),


                    ListTile(
                    leading: Icon(Icons.dining_sharp, size: ScreenUtil().setSp(25), color: drawerColor(3),),
                    title:  Text(' Dishes', style: TextStyle(color: drawerColor(3), fontFamily: FONT_FAMILY, fontSize: ScreenUtil().setSp(14)),),
                    onTap: () {
                         Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => 
                         DishesScreen()),
                        );
                       controller.currentIndex(3);
                    },
                  ),
                  
                ]
              ),
        
               ListTile(
                    leading: Icon(Icons.logout, size: ScreenUtil().setSp(25)),
                   title:  Text('Logout', style: TextStyle(color: AppColors.greyBlackcolor, fontFamily: FONT_FAMILY, fontSize: ScreenUtil().setSp(14)),),
                    onTap: () async{
                     final prefs = await SharedPreferences.getInstance();
                     prefs.remove("isLogged");
                     prefs.remove("restaurant_id");
                          Navigator.pushReplacement(
                          context,
                          MaterialPageRoute(builder: (context) => 
                         LoginScreen()),
                        );
        
                    },
                  )
            ],
          ),
        )
        );
  }
}