import 'dart:math';
import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:intl/intl.dart';
import 'package:qfoods_vendor/Model/OrderModel.dart';
import 'package:qfoods_vendor/constants/colors.dart';
import 'package:qfoods_vendor/constants/font_family.dart';

import 'package:timeline_tile/timeline_tile.dart';

class TimeLine extends StatefulWidget {
  final OrderModel? order;
  const TimeLine({super.key, required this.order});

  @override
  State<TimeLine> createState() => _TimeLineState();
}

class _TimeLineState extends State<TimeLine> {
  @override
  Widget build(BuildContext context) {
    return  Center(
         
        child: ListView.builder(
         physics: NeverScrollableScrollPhysics(),
          itemCount: widget?.order?.orderStatus?.length  ?? 0,
          shrinkWrap: true,
         itemBuilder: ((context, index) {
         
           return TimelineTile(
              alignment: TimelineAlign.manual,
              lineXY: 0.1,
              isFirst: index == 0 ? true : false,
              isLast: ((widget?.order?.orderStatus?.length ?? 0) - 1) == index ? true : false,
              indicatorStyle:  IndicatorStyle(
                width: 20,
                color: (widget?.order?.orderStatus?[index]?.statusId ?? 1)  <= (widget?.order?.status ?? 1) ? AppColors.primaryColor : AppColors.lightgreycolor,
                padding: EdgeInsets.all(6),
              ),
              endChild:  _RightChild(
                current_status:widget?.order?.status,
               title: "${widget?.order?.orderStatus?[index]?.status ?? ''}",
                message: "${widget?.order?.orderStatus?[index]?.updatedAt ?? ''}",
              ),
              beforeLineStyle:  LineStyle(
                color: (widget?.order?.orderStatus?[index]?.statusId ?? 1)  <= (widget?.order?.status ?? 1) ? AppColors.primaryColor : AppColors.lightgreycolor,
              ),
            );
           

         }),
        ),
    );
  }
}


class _RightChild extends StatelessWidget {
  const _RightChild({
     super.key,
  required  this.title,
 required   this.message,
 required this.current_status,
    this.disabled = false,
  });

 final String title;
  final String message;
  final bool disabled;
  final int? current_status;
    
   
  @override
  Widget build(BuildContext context) {
    final parsedDate = message != "" ? DateTime.parse(message) : '';
 String formatted = "";
 
  if(parsedDate != ""){
    final DateFormat formatter = DateFormat('MMM dd,yyyy hh:mm a');
    formatted =  parsedDate != "" ? formatter.format(parsedDate as DateTime) : '';

  }
 
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Row(
        children: <Widget>[
           Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisSize: MainAxisSize.min,
            children: <Widget>[
              Text(
                title,
                style: TextStyle(
                  color: disabled
                      ? const Color(0xFFBABABA)
                      : const Color(0xFF636564),
                  fontSize: ScreenUtil().setSp(14),
                  fontWeight: FontWeight.w500,
                  fontFamily: FONT_FAMILY
                ),
              ),
              const SizedBox(height: 6),
              Text(
                formatted ?? '',
                style: TextStyle(
                   fontFamily: FONT_FAMILY,
                  color: disabled
                      ? const Color(0xFFD5D5D5)
                      : const Color(0xFF636564),
                  fontSize: ScreenUtil().setSp(12),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}


