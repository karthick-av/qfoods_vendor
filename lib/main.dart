import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:loader_overlay/loader_overlay.dart';
import 'package:provider/provider.dart';
import 'package:qfoods_vendor/Components/Notification_Services.dart';
import 'package:qfoods_vendor/Provider/DishesProvider.dart';
import 'package:qfoods_vendor/Provider/MenuProvider.dart';
import 'package:qfoods_vendor/Provider/OrdersProvider.dart';
import 'package:qfoods_vendor/Screens/DashBoardScreen/DashBoardScreen.dart';
import 'package:qfoods_vendor/Screens/LoginScreen/LoginScreen.dart';
import 'package:qfoods_vendor/constants/api_services.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:firebase_messaging/firebase_messaging.dart';

import 'package:http/http.dart' as http;

Future<void> _firebaseMessagingBackgroundHandler(RemoteMessage message) async {
  await Firebase.initializeApp();
  // If you're going to use other Firebase services in the background, such as Firestore,
  // make sure you call `initializeApp` before using other Firebase services.
  print('Handling a background message ${message?.notification?.title}');
  if(message.notification != null){
  NotificationService.createNotification(message, "background");
}
}


 
void main() async{
 WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
 FirebaseMessaging.onBackgroundMessage(_firebaseMessagingBackgroundHandler);
NotificationService.initalize();
FirebaseMessaging.onMessage.listen((RemoteMessage message) {
  NotificationService.createNotification(message, "foreground");

});

  final SharedPreferences prefs = await SharedPreferences.getInstance();
  var isLoggedIn = ((prefs.getBool('isLogged') == null) ? false : prefs.getBool('isLogged')) ?? false;
 





 runApp(MultiProvider(
    providers: [
        ChangeNotifierProvider(create: ((context) => MenuProvider())),
    ChangeNotifierProvider(create: ((context) => DishesProvider())),
    ChangeNotifierProvider(create: ((context) => OrdersProvider())),
    
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
