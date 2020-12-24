import 'package:cached_network_image/cached_network_image.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
//import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

import 'package:myfashionapp/model/storeproducts.dart';
//import 'package:myfashionapp/view/addproductpage.dart';
import '../model/user.dart';
import '../controller/productspage_controller.dart';
//import 'package:firebase_auth/firebase_auth.dart';
import '../view/cartpage.dart';
import '../model/reviews.dart';
class ProductsPage extends StatefulWidget
{

final  User user;
 final List<StoreProducts> productlist;
 final Reviews reviews;
// StoreProducts storeProducts;
  CartPage cartPage;

 ProductsPage(this.user,this.productlist,
 

this.reviews
 );
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return ProductPageState(user,productlist,reviews
    );
  }
  
}
class ProductPageState extends State<ProductsPage>
{
  
  CartPage cartPage;
  User user;
  double totalCartValue=0;
  int get total=>productlist.length;
  StoreProducts storeProducts;
  List<StoreProducts>productlist;
   Reviews reviews;
  ProductPageController controller;
  BuildContext context;
  List<int> deleteIndices;
  ProductPageState(this.user,this.productlist,
  this.reviews
  )
  {
controller=ProductPageController(this);
  }
  void stateChanged(Function fn)
  {
    setState(fn);
  }
  @override
  Widget build(BuildContext context) {
    this.context=context;
    // TODO: implement build
    return WillPopScope(
      onWillPop: (){return Future.value(false);},
          child: Scaffold(
        appBar: AppBar(
          title: Text('Products Page'),
          actions:deleteIndices==null
           ? null : <Widget>[
            
            FlatButton.icon(
              label: Text('Delete'),
              icon: Icon(Icons.delete),
              onPressed: controller.deleteButton,
            ),
          
          ],
          
        ),
        
        drawer: Drawer(
          
          child: ListView(
            
            children: <Widget>[
             
              ListTile(
                leading: Icon(Icons.people,color:Colors.blue),
                title: Text('My Profile'),
                onTap: controller.myProfile,
              ),
              
              ListTile(
                leading: Icon(Icons.add_box,color: Colors.blue,),
                title: Text('About us'),
                onTap: controller.aboutPage,
              ),
             
              
              ListTile(
                leading: Icon(Icons.add_circle,color: Colors.blue,),
                title: Text('Add Products'),
                onTap:controller.addProduct,
              ),
              ListTile(
                leading: Icon(Icons.exit_to_app,color: Colors.blue,),
                title: Text('Sign Out'),
                onTap: controller.signOut,
              ),
               
            ],
          ),
        ),
       // body: Text('${productlist.length}'),
      
                body: GridView.builder(
                  
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2),
          itemCount: productlist.length,
          itemBuilder: (BuildContext context,int index)
          {
            return Container(
              padding: EdgeInsets.all(5.0),
              color: deleteIndices !=null && deleteIndices.contains(index) ?
              Colors.red[200]:Colors.grey,
              child: ListTile(
                leading: CachedNetworkImage(
                  imageUrl: productlist[index].imageUrl,
                  placeholder: (context,url)=>CircularProgressIndicator(),
                  errorWidget: (context,url,error)=>Icon(Icons.error_outline),
                  
                ),
title: Text(productlist[index].itemName),
subtitle: Column(
  crossAxisAlignment: CrossAxisAlignment.start,
  children: <Widget>[
   // Text(productlist[index].itemName),
    Text(productlist[index].itemDescription),
    Text(productlist[index].itemPrice.toString()),

  ],
  
),
onLongPress: ()=>controller.longPress(index),
onTap:()=> controller.onTap(index),//function definition
              ),
              
            );
          
          }
          
        ),
        
      ),
    
    );
  
  }
}
