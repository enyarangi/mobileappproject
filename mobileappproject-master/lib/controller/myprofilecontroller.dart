import 'package:myfashionapp/view/myprofile.dart';
import 'package:flutter/material.dart';
class MyProfileController
{
 
  MyProfileState state;
   MyProfileController(this.state);
   void cancelButton()
   {
     Navigator.pop(state.context);
     Navigator.pop(state.context);
   }
}