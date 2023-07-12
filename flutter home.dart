// ignore_for_file: unnecessary_const, prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:flutter_e_ticaret/categories.dart';
import 'package:flutter_e_ticaret/components/bottomnavigation.dart';
import 'package:flutter_e_ticaret/components/label.dart';
import 'package:http/http.dart' as http;


class HomePage extends StatefulWidget {
  // ignore: prefer_const_constructors_in_immutables
  HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    double screenwidht = MediaQuery.of(context).size.width;
    return Scaffold(
      body: SafeArea(
        child: Stack(
          children: [
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 16.0),
              child: ListView(
                children: [
                  //Başlık
                  buildBaslik(),

                  //Banner
                  buildBanner(),

                  //Buttonlar
                  Padding(
                    padding: EdgeInsets.only(top: 48),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        //İlkEleman
                        buildNavigation(
                          text: "Categories",
                          icon: Icons.menu,
                          widget: CategoriesPage(),
                          context: context,
                        ),
                        buildNavigation(
                            text: "Favorites", icon: Icons.star_border),
                        buildNavigation(
                            text: "Gifts", icon: Icons.card_giftcard),
                        buildNavigation(
                            text: "Best Selling", icon: Icons.people),
                      ],
                    ),
                  ),
                  SizedBox(height: 40),

                  //Sales Tittle
                  Text(
                    "Sales",
                    style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 24,
                        color: Color(0xFF0A1034)),
                  ),

                  SizedBox(height: 40),

                  //Sales Items
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      buildSalesItem(
                        text: "Smartphones",
                        photoUrl: "images/smartphon.png",
                        discount: "-50%",
                        screenwidht: screenwidht,
                      ),
                      buildSalesItem(
                        text: "Smartphones",
                        photoUrl: "images/smartphon.png",
                        discount: "-50%",
                        screenwidht: screenwidht,
                      ),
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      buildSalesItem(
                        text: "Smartphones",
                        photoUrl: "images/smartphon.png",
                        discount: "-50%",
                        screenwidht: screenwidht,
                      ),
                      buildSalesItem(
                        text: "Smartphones",
                        photoUrl: "images/smartphon.png",
                        discount: "-50%",
                        screenwidht: screenwidht,
                      ),
                    ],
                  ),
                ],
              ),
            ),

            //BOTTOM NAVİGATİON BAR
            bottomNavigationBar("home")
          ],
        ),
      ),
    );
  }
}

Widget buildBaslik() {
  return Padding(
    padding: EdgeInsets.only(top: 24.0),
    child: Text(
      "Home",
      style: TextStyle(
        fontSize: 32,
        color: Color(0xFF0A1034),
        fontWeight: FontWeight.bold,
      ),
    ),
  );
}

Widget buildBanner() {
  return Padding(
      padding: EdgeInsets.only(top: 24.0),
      child: Container(
        width: double.infinity,
        padding: EdgeInsets.only(left: 24, right: 36, top: 14, bottom: 18),
        decoration: BoxDecoration( 
            color: Color(0xFF0001FC), borderRadius: BorderRadius.circular(6)),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Column(
            
              crossAxisAlignment: CrossAxisAlignment.start,
              // ignore: prefer_const_literals_to_create_immutables
              children: [
              
                Text("Bose Home Speaker",
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: 20,
                        fontWeight: FontWeight.w600)),
                SizedBox(height: 10),
                Text("USD 279",
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: 12,
                        fontWeight: FontWeight.w500)),
              ],
            ),
            Image.asset("images/speaker.png",width: 200,height: 250,),
            
          ],
        ),
      ));
}

Widget buildNavigation({
  required String text,
  required IconData icon,
  widget,
  context,
}) {
  return GestureDetector(
    onTap: () {
      Navigator.push(context, MaterialPageRoute(builder: (context) {
        return widget;
      }));
    },
    child: Column(
      children: [
        Container(
          padding: EdgeInsets.symmetric(horizontal: 19, vertical: 22),
          decoration:
              BoxDecoration(shape: BoxShape.circle, color: Color(0xFFE0ECF8)),
          child: Icon(
            icon,
            color: Color(0xFF0001fc),
            size: 18,
          ),
        ),
        SizedBox(height: 8),
        Text(
          text,
          style: TextStyle(
            color: Color(0xFF1F53E4),
            fontSize: 14,
            fontWeight: FontWeight.w500,
          ),
        ),
      ],
    ),
  );
}

Widget buildSalesItem({
  required String text,
  required String photoUrl,
  required String discount,
  required double screenwidht,
}) {
  return Container(
    width: (screenwidht - 60) * 0.5,
    padding: EdgeInsets.only(left: 12, top: 12, bottom: 21, right: 12),
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        label(discount),
        SizedBox(height: 22),
        Center(child: Image.asset(photoUrl)),
        SizedBox(height: 22),
        Center(
          child: Text(text,
              style: TextStyle(fontSize: 18, color: Color(0xFF0A1034))),
        ),
      ],
    ),
  );
}
