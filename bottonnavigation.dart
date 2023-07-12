import 'package:flutter/material.dart';


Widget bottomNavigationBar(String page){
  return  Align(
          alignment: Alignment.bottomCenter,
          child: Container(
            // ignore: prefer_const_constructors
            decoration: BoxDecoration(boxShadow: [BoxShadow(offset: Offset(0,-3),
            color: Colors.black.withOpacity(0.25),blurRadius: 10)],
            color: const Color(0xFFEFF5FB),
            ),
            
            width: double.infinity,
            // ignore: prefer_const_constructors
            padding: EdgeInsets.symmetric(vertical: 20),
          
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
            
            buildNavIcon(iconData: Icons.home_filled, active: page =="home"),
            buildNavIcon(iconData: Icons.search, active: page == "search"),
            buildNavIcon(iconData: Icons.shopping_basket ,active: page =="cart"),
            buildNavIcon(iconData: Icons.person, active: page == "profile"),
             ],
            ),
           ),
        );
}

 Widget buildNavIcon( {
  required IconData iconData ,
  required bool active }){

  return Icon(iconData,
  size: 20,color: Color(
    active ? 0xFF0001FC: 0xFF0A1034));


}