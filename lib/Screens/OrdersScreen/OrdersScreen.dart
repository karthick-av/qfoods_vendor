
import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:provider/provider.dart';
import 'package:qfoods_vendor/Components/OrderCard.dart';
import 'package:qfoods_vendor/Model/OrderModel.dart';
import 'package:qfoods_vendor/Navigation/DrawerMenu.dart';
import 'package:qfoods_vendor/Provider/OrdersProvider.dart';
import 'package:qfoods_vendor/Screens/OrdersScreen/TabsOrders/OrdersCancelledScreen.dart';
import 'package:qfoods_vendor/Screens/OrdersScreen/TabsOrders/OrdersConfirmedScreen.dart';
import 'package:qfoods_vendor/Screens/OrdersScreen/TabsOrders/OrdersDeliveredScreen.dart';
import 'package:qfoods_vendor/Screens/OrdersScreen/TabsOrders/OrdersOntheWayScreen.dart';
import 'package:qfoods_vendor/Screens/OrdersScreen/TabsOrders/OrdersRecievedScreen.dart';
import 'package:qfoods_vendor/constants/api_services.dart';
import 'package:qfoods_vendor/constants/colors.dart';
import 'package:qfoods_vendor/constants/font_family.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'package:http/http.dart' as http;

class OrdersScreen extends StatefulWidget {
  const OrdersScreen({super.key});

  @override
  State<OrdersScreen> createState() => _OrdersScreenState();
}

class _OrdersScreenState extends State<OrdersScreen> {
 
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(  
        length: 5,  
        child: Scaffold(  
            drawer: DrawerMenu(),
    
          appBar: AppBar(  
            title: Text('Grocery Orders'),  
            bottom: TabBar(  
              tabs: [  
                Tab( text: "Recieved"),  
                Tab( text: "Confirmed"),  
                Tab( text: "On the Way"),  
                Tab( text: "Delivered"),  
                Tab( text: "Cancelled")  
              ],  
            ),  
          ),  
          body: TabBarView(  
            children: [  
              OrdersRecievedScreen(),  
              OrdersConfirmedScreen(),  
              OrdersOntheWayScreen(),  
              OrdersDeliveredScreen(),  
              OrdersCancelledScreen(),  
            ],  
          ),  
        ),  
      );
  }
}




