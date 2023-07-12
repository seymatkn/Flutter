// ignore_for_file: prefer_const_constructors, must_be_immutable, use_key_in_widget_constructors, duplicate_ignore

import 'package:flutter/material.dart';
import 'package:flutter_e_ticaret/components/bottomnavigation.dart';
import 'package:flutter_e_ticaret/components/productDetail.dart';

import 'components/header.dart';

// ignore: use_key_in_widget_constructors
class CategoryPage extends StatelessWidget {

  String categoryTitle;

CategoryPage(this.categoryTitle);

  List< Map > products= [
    {"isim":"Surface laptop 3",
    "fotograf":"images/laptop.png",
    "fiyat":"999"
    },
    {"isim":"Iphone 13 Pro",
    "fotograf":"images/laptop.png",
    "fiyat":"999"
    },
    {"isim":"Macbook",
    "fotograf":"images/laptop.png",
    "fiyat":"999"
    },
    {"isim":"IdeaPad",
    "fotograf":"images/laptop.png",
    "fiyat":"999"
    },
    {"isim":"Samsung S21",
    "fotograf":"images/laptop.png",
    "fiyat":"999"
    },
    {"isim":"Iphone 11 Pro",
    "fotograf":"images/laptop.png",
    "fiyat":"999"
    },
  ];
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SafeArea(
          child: Stack(
            children: [
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                   children: [
                  //header
                  header(categoryTitle, context),
                SizedBox(height: 32),
                  //icerikler
               

                  Expanded(
                    child: GridView.count(crossAxisCount: 2,
                    mainAxisSpacing: 15,
                    crossAxisSpacing: 10,
                     children: products.map((Map product){
                      return  buildContent( product["isim"],product["fotograf"] ,product["fiyat"] ,context);
                      
                    }).toList()
                    ),
                  )
                  
                  

                ], )
                ),

                //bottom navigation
                bottomNavigationBar("search"),
                ])));
    
  }
}

 


Widget buildContent(String title,String photoUrl,String price,context){
return    GestureDetector(
  onTap: (() {
    
    Navigator.push(context, MaterialPageRoute(builder: (context) {
        return ProductDetailPage(title);
      }));
  }),
  child:   Container(
  
                    
  
                      padding: EdgeInsets.symmetric(horizontal: 12,vertical: 16),
  
                      decoration: BoxDecoration(
  
                        color: Colors.white,
  
                        borderRadius: BorderRadius.circular(6), 
  
                      boxShadow: [BoxShadow(
  
                        color: Colors.black.withOpacity(0.08),
  
                       
  
                        blurRadius: 24,offset: Offset(0, 16),),]
  
                        ,),
  
                        child: Column( children: [
  
                       
  
                          SizedBox(height: 16),
  
                          Image.asset(photoUrl,width: 150,height: 120,),
  
  
  
                        SizedBox(height:20),
  
                         
  
                         Column(
  
                          crossAxisAlignment: CrossAxisAlignment.start,
  
                          children: [
  
                          
  
                          Text(title,style: TextStyle(color: Color(0xFF0A1034),
  
                          fontSize: 16,fontWeight: FontWeight.w500,)
  
                          ,),
  
                          Text("USD $price",style: TextStyle(color: Color(0xFF0001FC),
  
                          fontSize: 12,
  
                          fontWeight: FontWeight.w500),),
  
                         ],)
  
                        ],),
  
  
  
                    ),
);



}