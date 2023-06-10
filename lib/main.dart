import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:loader_overlay/loader_overlay.dart';
import 'package:provider/provider.dart';
import 'package:qfoods_vendor/Provider/DishesProvider.dart';
import 'package:qfoods_vendor/Provider/MenuProvider.dart';
import 'package:qfoods_vendor/Screens/DashBoardScreen/DashBoardScreen.dart';
import 'package:qfoods_vendor/Screens/LoginScreen/LoginScreen.dart';
import 'package:shared_preferences/shared_preferences.dart';

 
void main() async{
 WidgetsFlutterBinding.ensureInitialized();
  final SharedPreferences prefs = await SharedPreferences.getInstance();
  var isLoggedIn = ((prefs.getBool('isLogged') == null) ? false : prefs.getBool('isLogged')) ?? false;
 
 runApp(MultiProvider(
    providers: [
        ChangeNotifierProvider(create: ((context) => MenuProvider())),
    ChangeNotifierProvider(create: ((context) => DishesProvider())),
    
          ],
   child: GetMaterialApp(
      debugShowCheckedModeBanner: false,
      home: MaterialApp(
        title: 'Qfoods Vendor',
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
        
          primarySwatch: Colors.red,
        ),
        home:  LoaderOverlay(
          child: ScreenUtilInit(
             designSize: Size(360, 690),
            minTextAdapt: true,
            splitScreenMode: true,
                builder: ((context, child) {
                  return SafeArea(child: isLoggedIn ? DashBoardScreen() : LoginScreen());
                }),
               ),
        )
      ),),
 ));
}
