//import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:myfashionapp/controller/myfirebase.dart';
import 'package:myfashionapp/view/addproductpage.dart';
import '../view/mydialog.dart';
class AddProductPageController{
  AddProductPageState state;
  AddProductPageController(this.state);
  String validateImageUrl(String value)
  {
    if(value==null || value.length<4)
    {
      return'Enter ImageUrl';

    }
    return null;
  }
  void saveImageUrl(String value)
  {
    state.storeProductCopy.imageUrl=value;
  }
   String validateItemName(String value)
  {
    if(value==null || value.length<3)
    {
      return'Enter ItemName';

    }
    return null;
  }
  void saveItemName(String value)
  {
    state.storeProductCopy.itemName=value;
  }
   String validateItemPrice(String value)
  {
    if(value==null)
    {
      return'Enter Item Price';

    }
    try{
double.parse(value);
    }catch(e)
    {
return' Enter the Price';
    }
    return null;
  }
  void saveItemPrice(String value)
  {
    state.storeProductCopy.itemPrice=double.parse(value);
  }
  String validateItemDescription(String value)
  {
    if(value ==null || value.length<7)
    {
      return 'Enter the book Description with atleast 7characters';
    }
    return null;
  
  }
  void saveItemDescription(String value)
  {
    state.storeProductCopy.itemDescription=value;
  }
  String validateSharedWith(String value)
  {
    if(value==null || value.trim().isEmpty)
    {
      return null;//no sharing
    }
    for(var email in value.split(','))
    {
      if(!(email.contains('.') && email.contains('@')))
      {
return 'Enter Commma(,) separated email list';
      }
      if(email.indexOf('@') != email.lastIndexOf('@'))
      {
return 'Enter comma (,) separated email list';
      }
    }
    return null;
  }
  void saveSharedWith(String value)
  {
    if(value == null || value.trim().isEmpty)
    {
return;
    }
    state.storeProductCopy.sharedWith=[];
    List<String> emaillist=value.split(',');
    for(var email in emaillist)
    {
      state.storeProductCopy.sharedWith.add(email.trim());
    }
  }

  void addProduct() async
  {
    if(!state.formkey.currentState.validate())
    {
return;
    }
    state.formkey.currentState.save();
    //print('shared with:'+ state.storeProductCopy.sharedWith.toString());
    //
    //state.user.role=state.user.role;
    //print(state.user.role);
 state.storeProductCopy.addedBy=state.user.email;
  //state.user.uid=state.user.role;
    state.storeProductCopy.lastUpdatedAt=DateTime.now();
   
     
     try{
state.storeProductCopy.documentId=await MyFirebase.addProduct(state.storeProductCopy);
 //gets document id
Navigator.pop(state.context,state.storeProductCopy);
Navigator.pop(state.context);
     }catch(e)
     {
MyDialog.info(
  context: state.context,
  title: 'Save error in Firebase',
  message: 'Unable to complete the specified action',
  action: ()
  {
    Navigator.pop(state.context);
    Navigator.pop(state.context,null);
  }
);
     }
  }
  
  
}