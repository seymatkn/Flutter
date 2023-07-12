import 'package:flutter/material.dart';
import 'package:flutter_e_ticaret/components/bottomnavigation.dart';
import 'package:flutter_e_ticaret/components/header.dart';
import 'package:flutter_e_ticaret/components/label.dart';

class ProductDetailPage extends StatefulWidget {
  String productTitle;
  
  ProductDetailPage(this.productTitle);
  
 @override
  _ProductDetailPageState createState() => _ProductDetailPageState();
}
class _ProductDetailPageState extends State<ProductDetailPage> {
    Color selectedColor = Colors.white ;
    int selectedCapacity =64 ;

  List<Color> colors=[
    Color(0xFF52514F),
    Color(0xFF0A1034),
    Color(0xFF6F7972),
    Color(0xFFF5D8C0),
  ];
 
 
  List<int> capacities = [64,256,512];
 
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SafeArea(
          child: Stack(
            children: [
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start, children: [
                  //header
                  header(widget.productTitle, context),
                // ignore: prefer_const_constructors
                SizedBox(height: 32),
                
                Expanded(
                     child: Padding(
                       padding: const EdgeInsets.symmetric(horizontal:8.0),
                       child:ListView( 
                       // crossAxisAlignment: CrossAxisAlignment.start,
                         children: [
                          //New Etiketi
                         // label("New"),
                        SizedBox(height: 0),
                   
                        //Urun Fotografi
                        Center(
                          child: Image.asset("images/iphone.png",width: 450,height: 350)),
                        SizedBox(height: 30),
                   
                        //Renk Secenekleri  
                        Text("Color", style: TextStyle(fontSize: 18,
                      fontWeight: FontWeight.w600,color: Color(0xFF0A1034)),
                      ),
                      SizedBox(height: 16),
                                     
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children:
                         colors.map((Color color) => colorOption(color:color,
                          selected: selectedColor ==color, onTap: (){
                   setState(() {
                     selectedColor=color;
                   });
                          } )).toList()),
                      
                        //Kapasite Secenekleri
                        SizedBox(height: 32),
                            Text("Capacity", 
                            style: TextStyle(fontSize: 18,
                      fontWeight: FontWeight.w600,color: Color(0xFF0A1034)),
                      ),
                        SizedBox(height: 16),
                   
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: capacities.map((int number) => capacityOption(
                            capacity: number,selected: selectedCapacity == number,onTap: () {
                              setState(() {
                                selectedCapacity=number;
                              });
                            })).toList(),
                        ),
                       SizedBox(height: 32),
                       
                        //Sepete Ekle Butonu
                        GestureDetector(
                          onTap: () {
                            print("URUN SEPETE EKLENDI.");
                            print("URUNUN ISMI:"+widget.productTitle);
                            print("URUNUN RENGI:"+ selectedColor.value.toString());
                            print("URUNUN KAPASITESI:"+ selectedCapacity.toString() + "gb");

                            

                          },
                          child: Container(
                            width: double.infinity,
                            padding: EdgeInsets.symmetric(vertical: 16),
                            decoration: BoxDecoration(borderRadius: BorderRadius.circular(4),
                          color: Color(0xFF1F53E4)),
                           
                           child:
                           Text(
                            "Add To Card",
                            textAlign: TextAlign.center,
                            style: TextStyle(fontSize: 18,color: Colors.white,
                           fontWeight: FontWeight.w600),),
                          
                          ),
                        ),
                        SizedBox(height: 100),
                   
                   
                        ],
                       ),
                     ),
                   ),
                   ])),
                   bottomNavigationBar("search"),
                   ])));
  }
}

 Widget colorOption({   Color? color, 
   required bool selected,
   Function()? onTap}){

  return    GestureDetector(
onTap: onTap,

    child: Container(
                          margin: EdgeInsets.only(right: 15),
                          decoration: BoxDecoration(
                            shape: BoxShape.circle,  color: color,
                            border: Border.all(color: Color(0xFF0001FC), width: selected ? 3 : 0),
                             ),
                            
                            width: 23,
                            height: 15,
                      
                        ),
  );
}

Widget capacityOption({int? capacity ,required bool selected, required Function() onTap}){
  return
  GestureDetector(
    onTap: onTap,
    child: Container( 
      margin: EdgeInsets.only(right: 23),
      child: Text("$capacity gb",
                              style: TextStyle(color: Color(selected ? 0xFF0001FC: 0xFFA7A9BE),
                              fontSize: 16)),
    ),
  )
  ;

}