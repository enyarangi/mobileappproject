import 'package:flutter/material.dart';
import 'package:myfashionapp/controller/myfirebase.dart';
import 'package:myfashionapp/view/cartpage.dart';
import 'package:myfashionapp/view/productspage.dart';


import '../model/storeproducts.dart';
import '../model/user.dart';
import '../view/userreviews.dart';
import '../model/reviews.dart';
import '../view/shopping.dart';

class CartPageController
{
  User user;
  StoreProducts storeProducts;
  Reviews reviews;
  CartPageState state;
  
  CartPageController(this.state);
  void buyProduct()
  {
     Navigator.push(state.context, MaterialPageRoute(
        builder: (context)=>ShoppingPage(state.storeProducts,state.user),
     ));
  }
  
  void viewReviews() async
  {
    List<Reviews>reviewslist;
  try{
reviewslist=await MyFirebase.getReviews();
  }catch(e)
  {
    
  }
 Navigator.push(state.context, MaterialPageRoute(
   builder:(context)=>UserReviews(state.user, state.storeProducts, state.reviews, reviewslist)
   
   ));
  
  }
  String validateQuantity(String value)
  {
    return null;
  }
  void saveQuantity(String value)
  {
   // return null;
  }
  void continueShopping()
  {
Navigator.push(state.context, MaterialPageRoute(
  builder: (context)=>ProductsPage(state.user,state.productlist,state.reviews)
));
  }
}