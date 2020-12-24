import 'package:myfashionapp/controller/myfirebase.dart';
import 'package:myfashionapp/view/addproductpage.dart';
import 'package:myfashionapp/view/addreviewpage.dart';
import 'package:flutter/material.dart';
import '../view/mydialog.dart';

class AddReviewPageController
{
  AddReviewPageState state;
  AddReviewPageController(this.state);
  String validateReview(String value)
  {
  if(value==null || value.length<4)
    {
      return'Enter at least 4 characters';

    }
    return null;
  }

  void saveReview(String value)
  {
    //state.storeProductCopy.imageUrl=value;
state.reviewsCopy.myReviews=value;
  }
  void submitReview() async
  {
    if(!state.formkey.currentState.validate())
    {
 return;
    }
     state.formkey.currentState.save();
   // print(state.reviews.myReviews);
//state.reviews.addedBy=state.user.email;
     
     try{
      
state.reviewsCopy.documentId=await MyFirebase.addReview(state.reviewsCopy);
 //gets document id
Navigator.pop(state.context,state.reviewsCopy);
//Navigator.pop(state.context);
     }catch(e)
     {
MyDialog.info(
  context: state.context,
  title: 'Save error in Firebase',
  message: 'Unable to complete the specified action',
  action: ()
  {
    Navigator.pop(state.context);
    //Navigator.pop(state.context,null);
  }
);
     }
  }
}