import 'package:myfashionapp/view/cartpage.dart';
import 'package:myfashionapp/view/userreviews.dart';
import 'package:flutter/material.dart';

import '../view/addreviewpage.dart';
import '../model/reviews.dart';
class UserReviewsController{
  
  UserReviewsState state;
  UserReviewsController(this.state);
  void addReview() async
  {
    Reviews b=await Navigator.push(state.context, MaterialPageRoute(
      builder:(context)=>AddReviewPage(state.user, state.storeProducts, 
      state.reviews)
       ));
       if(b!=null)
       {
state.reviewslist.add(b);
       }
       else{

       }
  }
//  void onTap(int index) async
//   {
//     await Navigator.push(state.context, MaterialPageRoute(
//       builder:(context)=>CartPage(state.storeProducts, state.user, state.reviews) ));
//   }
}