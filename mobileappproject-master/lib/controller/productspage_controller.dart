import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:myfashionapp/controller/myfirebase.dart';

import '../view/productspage.dart';
import 'package:flutter/material.dart';
import '../view/messages.dart';
import '../view/aboutpage.dart';
import '../view/cartpage.dart';
import '../model/storeproducts.dart';
import '../view/addproductpage.dart';
import '../view/myprofile.dart';
import '../model/user.dart';
import '../view/mydialog.dart';
import '../view/searchpage.dart';
import '../view/aboutpage.dart';
class ProductPageController{
  ProductPageState state;
  ProductPageController (this.state);


  //bool isAdmin;

  void signOut()
  {
    MyFirebase.signOut();
    Navigator.pop(state.context); //close the drawer
    Navigator.pop(state.context);//return to frontpage
    
  }
  void getMessages()
  {
    Navigator.push(state.context, MaterialPageRoute(
builder: (context)=>(Messages()),
    ));
  }
  void aboutPage()
  {
Navigator.push(state.context,MaterialPageRoute(
  builder: (context)=>(AboutPage()),
));
  }
  void myProfile()
  {
    Navigator.push(state.context, MaterialPageRoute(
      builder: (context)=>(MyProfile(state.user)),
    ));
  
  }

  
 
  void addProduct() async
  {


    StoreProducts b=await Navigator.push(state.context, MaterialPageRoute(
builder: (context)=>AddProductPage(state.user,null)
    ));
    if(b != null )
    {
     //product has been stored 
    }else{
//error occured
    }
  }
   void onTap(int index)async
   {
     if(state.deleteIndices==null)
     //navigate to cartpage
     {
     await Navigator.push(state.context, MaterialPageRoute(
      builder: (context){
        return CartPage(state.productlist[index],state.user,state.reviews,state.productlist);
      }

    ));
  }
  else{
    //add to delete list
    if(state.deleteIndices.contains(index))
    {
      //tapped again
      state.deleteIndices.remove(index);
      if(state.deleteIndices.length==0)
      {
        //all deselected.delete mode quits
        state.deleteIndices=null;
      }
      
    }
    else{
      state.deleteIndices.add(index);
    }
    state.stateChanged((){});
  }
   }


void longPress(int index)
{
  if(state.deleteIndices==null){
    
    state.stateChanged(()
    {
state.deleteIndices=<int>[index];
    });
  }
}
void deleteButton() async
{
  //sort descending order
  state.deleteIndices.sort((n1,n2)
  {
if(n1<n2) return -1;
else if(n1==n2) return 0;
else return -1;
  });
for(var index in state.deleteIndices)
{
  try{
  await MyFirebase.deleteProducts(state.productlist[index]);
  state.productlist.removeAt(index);
  MyDialog.info(
  context: state.context,
  title: 'Deletion success',
  message: 'The item has been successfully deleted',
  action: ()
  {
    Navigator.pop(state.context);
    //Navigator.pop(state.context,null);
  }
);
  }catch(e)
  {
   MyDialog.info(
  context: state.context,
  title: 'Deletion failed',
  message: 'Unable to complete the specified action',
  action: ()
  {
    Navigator.pop(state.context);
    //Navigator.pop(state.context,null);
  }
);
  }
}
state.stateChanged(()
{
state.deleteIndices=null;
});

}
void searchProduct()
{
Navigator.push(state.context, MaterialPageRoute(
  builder: (context)=>MyHomePage(state.storeProducts, state.productlist)
));
}

}