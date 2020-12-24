import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:myfashionapp/controller/cartpage_controller.dart';
import '../model/user.dart';
import '../model/storeproducts.dart';
import 'package:cached_network_image/cached_network_image.dart';
import '../model/reviews.dart';

class CartPage extends StatefulWidget
{
  CartPage(this.storeProducts,this.user,
  
 this.reviews,this.productlist);
 
 final User user;
  final StoreProducts storeProducts;
final Reviews reviews;
 final List<StoreProducts>productlist;

  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return CartPageState(user,storeProducts,reviews,
    productlist
    );
  }

}
class CartPageState extends State<CartPage>
{ 
  var selectSize;
  

  List<Reviews>reviewslist;
  User user;
  List<StoreProducts>productlist;
  CartPageController controller;
  StoreProducts storeProductCopy;
  StoreProducts storeProducts;
  Reviews reviews;
  BuildContext context;
  CartPageState(this.user,this.storeProducts,this.reviews
,this.productlist
  )
  {
    //storeProductCopy=StoreProducts.clone(storeProducts);
    controller=CartPageController(this);
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
        title: Text('Cart Page'),
        actions: <Widget>[

         FlatButton.icon(
              label: Text('Share Reviews',style: TextStyle(color: Colors.white),),
              
              icon: Icon(Icons.share,color: Colors.white,),
              onPressed: controller.viewReviews,
            )
        ],
      ),
  body: ListView(
    
    
    children: <Widget>[
 Row(
   
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: <Widget>[
        Align(
          alignment: Alignment.center,
          child: Container(
            child: Column(
              children: <Widget>[
                CachedNetworkImage(
                  
                  
                  imageUrl: '${storeProducts.imageUrl}',
                  placeholder: (context,url)=>CircularProgressIndicator(),
                  errorWidget: (context,url,error)=>Icon(Icons.error_outline),
                ),
                Align(
alignment: Alignment.center,
child: Text('Price:\$${storeProducts.itemPrice}',style: TextStyle(fontSize: 20,fontWeight: FontWeight.bold),),
                ),
                Align(
                  alignment: Alignment.center,
                  child:Text('${storeProducts.itemName}',style: TextStyle(fontSize:20,fontWeight: FontWeight.bold ),) ,

                ),
                Align(
                  alignment: Alignment.center,
                  
                  child: Text('${storeProducts.itemDescription}',style: TextStyle(fontSize: 20,fontWeight: FontWeight.bold),),
                ),
                
             
              
              SizedBox(height: 40.0,),
              StreamBuilder<QuerySnapshot>(
stream: Firestore.instance.collection("productssize").snapshots(),
builder: (context,snapshot)
{
  if(!snapshot.hasData)
  {
    Text('Loading');
  }else{
    List<DropdownMenuItem>sizeItems=[];
    for(int i=0;i<snapshot.data.documents.length;i++)
    {
      DocumentSnapshot snap=snapshot.data.documents[i];
      sizeItems.add(DropdownMenuItem(
        child:Text(
snap.documentID,
style: TextStyle(
  color: Colors.red,
),
      ),
      value: '${snap.data}',
      )
      );

    }
    return Row(
mainAxisAlignment: MainAxisAlignment.center,
children: <Widget>[
  Icon(Icons.format_size,size:20.0,color:Colors.black),
  SizedBox(
    width: 50.0,
  ),
  DropdownButton(
    items: sizeItems,
    onChanged: (sizevalue)
    {
final snackbar=SnackBar(
  content: Text(
    'Select size is $sizevalue',style: TextStyle(color: Colors.white),
  ),
);
Scaffold.of(context).showSnackBar(snackbar);
setState(() {
 selectSize=sizevalue; 
});
    },
    value: selectSize,
    isExpanded: false,
    hint: new Text(
      "Choose the size"
    ),
  ),
],

    );

    
  }
}
              ),
              Row(
                children: <Widget>[
 RaisedButton(
                  child: Text('BUY PRODUCT'),
                  onPressed: controller.buyProduct,
                  color: Colors.blue,
                  elevation: 2.0,
                ),

Container(
  padding: EdgeInsets.all(10.0),

  child:   RaisedButton(
  
    child: Text('Continue Shopping'),
  
    onPressed: controller.continueShopping,
  
    color: Colors.blue,
  
    elevation: 2.0,
  
  ),

)

                ],
              ),
              
              ],
              
            ),
          
          ),
          
        )
        
      ],
      
    ),
  
    ],
  
  )
  
   );
  }

}