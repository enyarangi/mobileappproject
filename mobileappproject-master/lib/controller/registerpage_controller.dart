import 'package:flutter/widgets.dart';
import 'package:myfashionapp/view/mydialog.dart';

import '../view/registerpage.dart';
import '../controller/myfirebase.dart';

class RegisterPageController
{
  RegisterPageState state;
  RegisterPageController(this.state);
  String validateRegisterEmail(String value)
  {
    if(value==null || !value.contains('.') || !value.contains('@'))
    {
      return 'Enter the valid email address';
    }
    return null;
  }
  void saveRegisterEmail(String value)
  {
state.user.email=value;
  }
  String validateRegisterPassword(String value)
  {
    if(value==null){
      return 'Password  must  more than 6 characters';
    }
    else{
      return null;
    }
  }
  void saveRegisterPassword(String value)
  {
    state.user.password=value;
  }
  String validateDisplayName(String value)
  {
    if(value==null|| value.length<2)
    {
      return 'Enter atleast 2 characters';
    }
    return null;
  }
  void saveDisplayName(String value)
  {
    state.user.displayName=value;
  }
  // String validateRole(String value)
  // {
  //   if(value==null|| value.length<2)
  //   {
  //     return 'Enter atleast 4 characters';
  //   }
  //   return null;
  // }
  // void saveRole(String value)
  // {
  //   state.user.role=value;
  // }
  String validatePhoneNumber(String value)
  {
    if(value==null || value.length<10)
    {
      return 'Enter atleast 10 digits';
    }
    try{
int n=int.parse(value);
if(n<1000000000)
{
  return 'Enter 10 digits';
}
    }catch(e){
return 'Enter a 10 digit number';
    }
    return null;
  }
  void savePhoneNumber(String value){
    state.user.phoneNumber=int.parse(value);
  }
  void registerButton() async
  {
    if(!state.formkey.currentState.validate()){
      return;//stop preceeding
    }
    state.formkey.currentState.save();
    try{
 state.user.uid=await MyFirebase.registerButton(
     email: state.user.email,
     password: state.user.password
   );
//user profile in firestore 

    }catch(e)
    {
MyDialog.info(

  context:state.context,
  title: 'Account Creation Failed!',
  message: e.message !=null ?e.message : e.toString(),
  action: ()=>Navigator.pop(state.context),
);
return;//do not proceed if it fails
    }
    try{
    MyFirebase.createProfile(state.user); //cretaes a document in user profile
    }catch(e)

{
  state.user.displayName=null;
  state.user.phoneNumber=null;
}
   MyDialog.info(

  context:state.context,
  title: 'Account Created Successfully!',
  message: 'Your account has been successfully created with ${state.user.email}',
  action: ()=>Navigator.pop(state.context),
);
   
  }
}