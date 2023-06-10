import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:qfoods_vendor/Navigation/DrawerMenu.dart';
import 'package:qfoods_vendor/constants/CustomSnackBar.dart';
import 'package:qfoods_vendor/constants/api_services.dart';
import 'package:qfoods_vendor/constants/colors.dart';
import 'package:qfoods_vendor/constants/font_family.dart';

import 'package:qfoods_vendor/Model/DashboardModel.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';

class DashBoardScreen extends StatefulWidget {
  const DashBoardScreen({super.key});

  @override
  State<DashBoardScreen> createState() => _DashBoardScreenState();
}

class _DashBoardScreenState extends State<DashBoardScreen> {

VendorDashboardModel? dashboard;

void initState(){
   WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
 DashboardHandler();
   });
  super.initState();

}
Future<void> DashboardHandler() async{
        final SharedPreferences prefs = await SharedPreferences.getInstance();
  final restaurant_id = await prefs.getInt("restaurant_id") ?? null;
  if(restaurant_id == null) return;
 
    try{
   
    final response = await http.get(Uri.parse("${ApiServices.dashboard}${restaurant_id}"));
     if(response.statusCode == 200){
        var response_body = json.decode(response.body);
        VendorDashboardModel _data = VendorDashboardModel.fromJson(response_body);
        dashboard = _data;
        setState(() {});
      
     }
    }catch(e){

      CustomSnackBar().ErrorSnackBar();
    }
   }



  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    return Scaffold(
      backgroundColor: AppColors.whitecolor,
       drawer: DrawerMenu(),
         appBar: AppBar( 
         iconTheme: IconThemeData(color: AppColors.greyBlackcolor),
        elevation: 0.5,
        backgroundColor: AppColors.whitecolor,
        
         title: Text('DashBoard',style: TextStyle(color: AppColors.greyBlackcolor, fontFamily: FONT_FAMILY, fontSize: ScreenUtil().setSp(16))),
         
        
      ),
    body: RefreshIndicator(
      onRefresh: ()async{
await DashboardHandler();
      },
      child: SingleChildScrollView(
        child: Column(
          children: [
             Center(
             child: Container(
              margin: const EdgeInsets.only(top: 20),
                width: width * 0.95,
                padding: const EdgeInsets.only(left: 10, top: 10, bottom: 10),
                        decoration: BoxDecoration(
                                      color: Colors.white,
                                      borderRadius: BorderRadius.circular(10),
                                      boxShadow: [
                                        BoxShadow(
                                          offset: Offset(0, 4),
                                          blurRadius: 20,
                                          color: const Color(0xFFB0CCE1).withOpacity(0.29),
                                        ),
                                      ],
                                    ),
                            alignment: Alignment.centerLeft,
                      child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                        Text("Profit", style: TextStyle(color: AppColors.greyBlackcolor, fontFamily: FONT_FAMILY, fontSize: ScreenUtil().setSp(14.5), fontWeight: FontWeight.w600),),
                        SizedBox(height: 8,),
                          Center(
                            child: Container(
                              width: width * 0.70,
                              padding: const EdgeInsets.all(10),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: [
                                  Container(
                                    padding: const EdgeInsets.all(10),
                                      width: width * 0.30,
               
                                    decoration: BoxDecoration( 
                                      borderRadius: BorderRadius.circular(8),
                                  boxShadow: <BoxShadow>[
                                    BoxShadow(
                                        color: Color(0xFFFFB295)
                                            .withOpacity(0.6),
                                        offset: const Offset(1.1, 4.0),
                                        blurRadius: 8.0),
                                  ],
                                  gradient: LinearGradient(
                                    colors: [
                                     Color(0xFFFA7D82),
                                   Color(0xFFFFB295) ],
                                    begin: Alignment.topLeft,
                                    end: Alignment.bottomRight,
                                  ),
    
                                    ),
                                    child: Column(
                                      children: [
                                        Text("Today", style: TextStyle(color: AppColors.whitecolor, fontFamily: FONT_FAMILY, fontSize: ScreenUtil().setSp(14), fontWeight: FontWeight.w500),)
                                          ,SizedBox(height: 5,),
                                          
                                          Text("${dashboard?.todayProfit ?? 0}", style: TextStyle(color: AppColors.whitecolor, fontFamily: FONT_FAMILY, fontSize: ScreenUtil().setSp(14), fontWeight: FontWeight.w500),)
                                    ],
                                    ),
                                  ),
    
    
                                       Container(
                                    padding: const EdgeInsets.all(10),
                                      width: width * 0.30,
               
                                    decoration: BoxDecoration( 
                                      borderRadius: BorderRadius.circular(8),
                                  boxShadow: <BoxShadow>[
                                    BoxShadow(
                                        color: Color(0xFF5C5EDD)
                                            .withOpacity(0.6),
                                        offset: const Offset(1.1, 4.0),
                                        blurRadius: 8.0),
                                  ],
                                  gradient: LinearGradient(
                                    colors: [
                                     Color(0xFF738AE6),
                                   Color(0xFF5C5EDD) ],
                                    begin: Alignment.topLeft,
                                    end: Alignment.bottomRight,
                                  ),
    
                                    ),
                                    child: Column(
                                      children: [
                                        Text("Total", style: TextStyle(color: AppColors.whitecolor, fontFamily: FONT_FAMILY, fontSize: ScreenUtil().setSp(14), fontWeight: FontWeight.w500),)
                                          ,SizedBox(height: 5,),
                                          
                                          Text("${dashboard?.totalProfit ?? 0}", style: TextStyle(color: AppColors.whitecolor, fontFamily: FONT_FAMILY, fontSize: ScreenUtil().setSp(14), fontWeight: FontWeight.w500),)
                                    ],
                                    ),
                                  )
                                ],
                              ),
                            ),
                          ),
                        ],
                      ),    
             )
     ),
    
    SizedBox(height: 10,),
    
     Center(
             child: Container(
              margin: const EdgeInsets.only(top: 20),
                width: width * 0.95,
                padding: const EdgeInsets.only(left: 10, top: 10, bottom: 10),
                        decoration: BoxDecoration(
                                      color: Colors.white,
                                      borderRadius: BorderRadius.circular(10),
                                      boxShadow: [
                                        BoxShadow(
                                          offset: Offset(0, 4),
                                          blurRadius: 20,
                                          color: const Color(0xFFB0CCE1).withOpacity(0.29),
                                        ),
                                      ],
                                    ),
                            alignment: Alignment.centerLeft,
                      child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                        Text("Delivered Orders", style: TextStyle(color: AppColors.greyBlackcolor, fontFamily: FONT_FAMILY, fontSize: ScreenUtil().setSp(14.5), fontWeight: FontWeight.w600),),
                        SizedBox(height: 8,),
                          Center(
                            child: Container(
                              width: width * 0.70,
                              padding: const EdgeInsets.all(10),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: [
                                  Container(
                                    padding: const EdgeInsets.all(10),
                                      width: width * 0.30,
               
                                    decoration: BoxDecoration( 
                                      borderRadius: BorderRadius.circular(8),
                                  boxShadow: <BoxShadow>[
                                    BoxShadow(
                                        color: Color(0xFFFFB295)
                                            .withOpacity(0.6),
                                        offset: const Offset(1.1, 4.0),
                                        blurRadius: 8.0),
                                  ],
                                  gradient: LinearGradient(
                                    colors: [
                                     Color(0xFFFA7D82),
                                   Color(0xFFFFB295) ],
                                    begin: Alignment.topLeft,
                                    end: Alignment.bottomRight,
                                  ),
    
                                    ),
                                    child: Column(
                                      children: [
                                        Text("Today", style: TextStyle(color: AppColors.whitecolor, fontFamily: FONT_FAMILY, fontSize: ScreenUtil().setSp(14), fontWeight: FontWeight.w500),)
                                          ,SizedBox(height: 5,),
                                          
                                          Text("${dashboard?.todayOrders ?? 0}", style: TextStyle(color: AppColors.whitecolor, fontFamily: FONT_FAMILY, fontSize: ScreenUtil().setSp(14), fontWeight: FontWeight.w500),)
                                    ],
                                    ),
                                  ),
    
    
                                       Container(
                                    padding: const EdgeInsets.all(10),
                                      width: width * 0.30,
               
                                    decoration: BoxDecoration( 
                                      borderRadius: BorderRadius.circular(8),
                                  boxShadow: <BoxShadow>[
                                    BoxShadow(
                                        color: Color(0xFF5C5EDD)
                                            .withOpacity(0.6),
                                        offset: const Offset(1.1, 4.0),
                                        blurRadius: 8.0),
                                  ],
                                  gradient: LinearGradient(
                                    colors: [
                                     Color(0xFF738AE6),
                                   Color(0xFF5C5EDD) ],
                                    begin: Alignment.topLeft,
                                    end: Alignment.bottomRight,
                                  ),
    
                                    ),
                                    child: Column(
                                      children: [
                                        Text("Total", style: TextStyle(color: AppColors.whitecolor, fontFamily: FONT_FAMILY, fontSize: ScreenUtil().setSp(14), fontWeight: FontWeight.w500),)
                                          ,SizedBox(height: 5,),
                                          
                                          Text("${dashboard?.totalOrders ?? 0}", style: TextStyle(color: AppColors.whitecolor, fontFamily: FONT_FAMILY, fontSize: ScreenUtil().setSp(14), fontWeight: FontWeight.w500),)
                                    ],
                                    ),
                                  )
                                ],
                              ),
                            ),
                          ),
                        ],
                      ),    
             )
     ),
    SizedBox(height: MediaQuery.of(context).size.height,)
    
          ],
        ),
      ),
    ),

    );
  }
}