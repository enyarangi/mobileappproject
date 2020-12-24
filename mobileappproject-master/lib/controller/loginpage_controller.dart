import 'package:flutter/material.dart';
import 'package:myfashionapp/controller/myfirebase.dart';
import 'package:myfashionapp/model/reviews.dart';
import 'package:myfashionapp/model/storeproducts.dart';
import 'package:myfashionapp/view/mydialog.dart';


import '../view/loginpage.dart';
import '../view/registerpage.dart';
import '../view/productspage.dart';
import '../model/user.dart';
import '../view/forgotpasswordpage.dart';
import '../model/reviews.dart';
class LoginPageController {
  Reviews reviews;
LoginPageController(this.state);
LoginPageState state;

String validateEmail(String value)
  {
    if(value==null || !value.contains('.') || !value.contains('@'))
    {
      return 'Enter the valid email address';
    }
    return null;
  }
  void saveEmail(String value)
  {
state.user.email=value;
  }

String validatePassword(String value)
{
  if(value==null || value.length<6)
  {
    return 'Password must be atleast 6 characters';
  }
  return null;
}
void savePassword(String value)
{
  state.user.password=value;
}
void login() async
{
  if(!state.formkey.currentState.validate())
  {
    return;
  }
  state.formkey.currentState.save();
   
  MyDialog.showProgressBar(state.context);
  
  try{
state.user.uid=await MyFirebase.login(
  email:state.user.email,
  password:state.user.password);
  
  }catch(e)
  {
    MyDialog.popProgressBar(state.context);
MyDialog.info(
  context:state.context,
  title:'Login error',
  message:e.message != null ?e.message :e.toString(),
  action:()=>Navigator.pop(state.context),
);
return;
  }
  //login success>>read user profile
  try{
User user=await MyFirebase.readProfile(state.user.uid);
  state.user.displayName=user.displayName;
  state.user.phoneNumber=user.phoneNumber;
  }catch(e)
  {
//no displayname and phonenumber 
print('READ PROFILE' + e.toString());
  }
  List<StoreProducts>productlist;
  try{
productlist=await MyFirebase.getProducts(state.user.email);
  }catch(e)
  {
productlist=<StoreProducts>[];
  }
  
  MyDialog.popProgressBar(state.context);

  MyDialog.info(
  context:state.context,
  title:'Login Success',
  message:' Press <OK> to Navigate to Products Page',
  action:()
  {
    Navigator.pop(state.context);
    Navigator.push(state.context, MaterialPageRoute(
    builder: (context)=>ProductsPage(state.user, productlist,reviews)
  )
);
  
});
}
void registerUser()
{
Navigator.push(state.context,MaterialPageRoute(
  builder: (context)=>RegisterPage()
  ));
}
void forgotPassword()
{
  Navigator.push(state.context, MaterialPageRoute(
builder: (context)=>ForgotPassword(state.user),
  ));
}
}