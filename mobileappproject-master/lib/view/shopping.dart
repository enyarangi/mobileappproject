import 'package:flutter/material.dart';
import 'package:flutter_inapp_purchase/flutter_inapp_purchase.dart';
import 'package:myfashionapp/controller/shoppingpagecontroller.dart';
import 'package:myfashionapp/model/storeproducts.dart';
import '../controller/myfirebase.dart';
import 'package:cached_network_image/cached_network_image.dart';
import '../model/user.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
class ShoppingPage extends StatefulWidget{
  final StoreProducts storeProducts;
  
 final User user;
  ShoppingPage(this.storeProducts,this.user);
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return ShoppingPageState(storeProducts,user);
  }

}
class ShoppingPageState extends State<ShoppingPage>
{
  
ShoppingPageController controller;
  StoreProducts storeProducts;
  User user;
   var formkey=GlobalKey<FormState>();
   BuildContext context;
ShoppingPageState(this.storeProducts,this.user)
{
  controller=ShoppingPageController(this);
  
}
//   static const String iapId='android.test.purchased';
//   @override
//   void initState()
//   {
// super.initState();
// initPlatformState();
//   }
//   Future<void> initPlatformState() async{
//     var result=await FlutterInappPurchase.initConnection;
//     print('result:$result');
//     if(!mounted)return;
//     String msg=await FlutterInappPurchase.consumeAllItems;
//     print('Consume all items:$msg');
//     await getProduct();
//   }
void stateChanged(Function fn)
{
  
setState(
  fn
);
}
  @override
  Widget build(BuildContext context) {
    this.context=context;
    // TODO: implement build
    return Scaffold(
appBar: AppBar(
  title: Text('Shopping Summary'),
),
body: Form(
  key: formkey,
  child: ListView(
    children: <Widget>[
       CachedNetworkImage(
                  
                  height: 100,
                  width: 100,
                  imageUrl: '${storeProducts.imageUrl}',
                  placeholder: (context,url)=>CircularProgressIndicator(),
                  errorWidget: (context,url,error)=>Icon(Icons.error_outline),
                ),
                Align(
alignment: Alignment.center,
child: Text('Price:\$${storeProducts.itemPrice}',style: TextStyle(fontSize: 20,fontWeight: FontWeight.bold),),
                ),
                Align(
                  alignment: Alignment.center,
                  child:Text('${storeProducts.itemName}',style: TextStyle(fontSize:20,fontWeight: FontWeight.bold ),) ,

                ),
//                 Align(
// alignment: Alignment.center,
// child: Text('Price:\$${storeProducts.itemPrice}' ,style: TextStyle(fontSize: 20,fontWeight: FontWeight.bold),),
               // ),
                // Align(
                //   alignment: Alignment.center,
                //   child:Text('${quantitylist.length}',style: TextStyle(fontSize:20,fontWeight: FontWeight.bold ),) ,

                // ),
      
                 
                  
              
                Container(
                  padding: EdgeInsets.all(20.0),
                  child: RaisedButton(
                    child: Text('Buy'),
                    onPressed: controller.buyProduct,
                    color: Colors.blue,
                  ),
                ),
                 Align(
alignment: Alignment.center,
child: Text('Summary of the purchase',style: TextStyle(fontSize: 20,fontWeight: FontWeight.bold),),
                ),
                Text('Name:${user.displayName}')   ,
      Text('Email:${user.email}'), 
Text('Total Price:\$${storeProducts.itemPrice}',style: TextStyle(fontSize: 15,fontWeight: FontWeight.bold),),
                
],
    
  ),
),
    );
  }
  
}