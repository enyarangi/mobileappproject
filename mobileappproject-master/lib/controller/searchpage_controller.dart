import '../view/searchpage.dart';
class MyHomePageController{
MyHomePageState state;
MyHomePageController (this.state);
String validateSearchButton(String value)
{
  if(value==null || value.length<3)
    {
      return'Enter ItemName';

    }
    return null;
}
void saveSearchButton(String value)
{
//state.storeProductCopy.itemName=value;
}
void submitSearch()
{

}
 
}