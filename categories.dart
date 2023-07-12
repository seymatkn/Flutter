// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:flutter_e_ticaret/category.dart';
import 'package:flutter_e_ticaret/components/bottomnavigation.dart';
import 'package:flutter_e_ticaret/components/header.dart';

// ignore: use_key_in_widget_constructors
class  CategoriesPage extends StatelessWidget {
 final List<String> categories=[
    "All",
    "Computers",
    "Accesories",
    "Smartphones",
    "Smart Objects",
    "Speakers",
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SafeArea(
          child: Stack(
            children: [
              Padding(
                padding:  EdgeInsets.symmetric(horizontal: 16.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  
                   children: [
                    //header
                  header("Categories", context),

                  SizedBox(height: 16),
              //Kategoriler
              Expanded (
                child:ListView(
                children:  categories.map((String title) => buildCategory(title,context))
              .toList()),
              ), 
              
                ],),
                ),

                //Bottomnavigation

                bottomNavigationBar("search"),
                ])));
  }
}

Widget buildCategory(String title,context){
  return   GestureDetector(
    onTap: () {
      Navigator.push(context, MaterialPageRoute(builder: (context) {
        return CategoryPage(title);
      }));
    },
  
  
   child: Container(
                padding: EdgeInsets.all(24),
                margin: EdgeInsets.only(bottom: 16),
                width: double.infinity,
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(6),
                  boxShadow: [
                    BoxShadow(color: Colors.black.withOpacity(0.25),
                    blurRadius: 4,offset: Offset(0, 4)),
                    ]),
                    child:Text(
                      title,
                    style: TextStyle(fontSize: 18,
                    fontWeight: FontWeight.w600,color: Color(0xFF0A1034)),
                    ) ,
              ),);

}