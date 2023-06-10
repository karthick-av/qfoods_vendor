import 'dart:convert';

import 'package:flutter/material.dart';
Future<void> EditDishModal(BuildContext context){
  return  showGeneralDialog(
      barrierLabel: "Label",
      barrierDismissible: true,
      barrierColor: Colors.black.withOpacity(0.5),
     transitionDuration: Duration(milliseconds: 700),
      context: context,
      
      pageBuilder: (context, anim1, anim2) {
                   return AlertDialog(
                    scrollable: true,
                     insetPadding: EdgeInsets.zero,
          contentPadding: EdgeInsets.zero,
          clipBehavior: Clip.antiAliasWithSaveLayer,
                    title: Text('Login'),
                    content: Container(
                      height: MediaQuery.of(context).size.height,
                      width: MediaQuery.of(context).size.width,
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Form(
                          child: Column(
                            children: <Widget>[
                              TextFormField(
                                decoration: InputDecoration(
                                  labelText: 'Name',
                                  icon: Icon(Icons.account_box),
                                ),
                              ),
                              TextFormField(
                                decoration: InputDecoration(
                                  labelText: 'Email',
                                  icon: Icon(Icons.email),
                                ),
                              ),
                              TextFormField(
                                decoration: InputDecoration(
                                  labelText: 'Message',
                                  icon: Icon(Icons.message ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                     actions: [
                      Container(
                          child: Text("Submit"),
                         )
                    ],
                  );
                });
}