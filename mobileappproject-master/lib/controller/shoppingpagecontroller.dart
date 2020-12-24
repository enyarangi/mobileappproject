
import 'package:myfashionapp/view/shopping.dart';

class ShoppingPageController
{
  
  ShoppingPageState state;
  ShoppingPageController(this.state);


  void buyProduct() async
  {
    if(!state.formkey.currentState.validate())
    {
 return;
    }
     state.formkey.currentState.save();
   
  }


}