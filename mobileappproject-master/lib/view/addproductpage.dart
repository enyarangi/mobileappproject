

import 'package:flutter/material.dart';
import 'package:myfashionapp/model/storeproducts.dart';
import '../model/user.dart';
import '../controller/addproductpage_controller.dart';
import 'package:cached_network_image/cached_network_image.dart';
class AddProductPage extends StatefulWidget
{
   final User user;
  final StoreProducts storeProducts;
  AddProductPage(this.user,this.storeProducts);
  
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return AddProductPageState(user,storeProducts);
  }
  
  }
  
class AddProductPageState extends State<AddProductPage>
{
  var formkey=GlobalKey<FormState>();
  BuildContext context;
  AddProductPageController controller;
  User user;
  StoreProducts storeProducts;
  StoreProducts storeProductCopy;
 // bool editMode=false;
  AddProductPageState(this.user,this.storeProducts)
  {
controller=AddProductPageController(this);
if(storeProducts==null)
{
storeProductCopy=StoreProducts.empty();
}
else{
 //storeProductCopy=StoreProducts.clone(storeProducts);
}
  }
  void stateChanged(Function fn)
  {
    setState(fn);
  }
  @override
  Widget build(BuildContext context) {
    this.context=context;
    // TODO: implement build
    return Scaffold(
      appBar: AppBar(
        title: Text('Product Details'),
      ),
      body:Form(
        key: formkey,
        child: ListView(
          children: <Widget>[
CachedNetworkImage(
  
  imageUrl: storeProductCopy.imageUrl,
  placeholder: (context,url)=>CircularProgressIndicator(),
  errorWidget: (context,url,error)=>Icon(Icons.error_outline,size: 250),
  height: 250,
  width: 250,
),
Container(
  child:   TextFormField(
  //enabled: editMode,
    initialValue: storeProductCopy.imageUrl,
  
    decoration: InputDecoration(
  
      labelText: 'ImageUrl',
      border: OutlineInputBorder(
        borderRadius: BorderRadius.circular(20.0),
      )
  
  
    ),
  
    autocorrect: false,
  
    validator: controller.validateImageUrl,
  
    onSaved: controller.saveImageUrl,
  
  ),
),
Container(
  child:   TextFormField(
  
    initialValue: storeProductCopy.itemName,
  //enabled: editMode,
    decoration: InputDecoration(
  
      labelText: 'ItemName',
      border: OutlineInputBorder(
        borderRadius: BorderRadius.circular(20.0),
      )
  
  
    ),
  
    autocorrect: false,
  
    validator: controller.validateItemName,
  
    onSaved: controller.saveItemName,
  
  ),
),
Container(
  child:   TextFormField(
  //enabled: editMode,
    initialValue:'\$${storeProductCopy.itemPrice.toStringAsFixed(2)}',
  
    decoration: InputDecoration(
  
      labelText: 'ItemPrice in dollars',
      border: OutlineInputBorder(
        borderRadius: BorderRadius.circular(20.0),  
      ),
  
  
    ),
  
    autocorrect: false,
  
    validator: controller.validateItemPrice,
  
    onSaved: controller.saveItemPrice,
  
  ),
),
Container(
  child:   TextFormField(
  //enabled: editMode,
    initialValue: storeProductCopy.itemDescription,
  
    decoration: InputDecoration(
  
      labelText: 'ItemDescription',
      border: OutlineInputBorder(
        borderRadius: BorderRadius.circular(20.0),
      )
  
  
    ),
  maxLines: 2,
    autocorrect: false,
  
    validator: controller.validateItemDescription,
  
    onSaved: controller.saveItemDescription,
  
  ),
),
Container(
  child:   TextFormField(
 // enabled: editMode,
    initialValue:storeProductCopy.sharedWith.join('.').toString(),
  
    decoration: InputDecoration(
  
      labelText: 'Shared with the following email list',
      border: OutlineInputBorder(
        borderRadius: BorderRadius.circular(20.0),
      )
  
  
    ),
    autocorrect: false,
  
    validator: controller.validateSharedWith,
  
    onSaved: controller.saveSharedWith,
  
  ),
),
Container(
  padding: EdgeInsets.all(50.0),
  child:   RaisedButton(
  
    child: Text('ADD PRODUCT'),
  color: Colors.blue,
    onPressed: controller.addProduct,
  
  ),
)
          ],
        ),

      )
    );
  }

}