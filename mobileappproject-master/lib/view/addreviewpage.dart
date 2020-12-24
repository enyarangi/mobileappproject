import 'package:flutter/material.dart';

import 'package:myfashionapp/controller/addreviewpage_controller.dart';
import 'package:myfashionapp/model/reviews.dart';
import 'package:myfashionapp/model/storeproducts.dart';
import '../model/user.dart';
import 'package:cached_network_image/cached_network_image.dart';

class AddReviewPage extends StatefulWidget
{
 final User user;
 final StoreProducts storeProducts;
 final Reviews reviews;
 AddReviewPage(this.user,this.storeProducts,this.reviews);

  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return AddReviewPageState(user,storeProducts,reviews);
  }
  
}
class AddReviewPageState extends State<AddReviewPage>
{
  var formkey=GlobalKey<FormState>();
  User user;
  StoreProducts storeProducts;
  Reviews reviews;
  Reviews reviewsCopy;
  AddReviewPageController controller;
  BuildContext context;
  AddReviewPageState(this.user,this.storeProducts,this.reviews)
  {
    controller=AddReviewPageController(this);
    if(reviews==null)
    {
reviewsCopy=Reviews.empty();
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
  title: Text('Add Your Reviews'),
),
 //body:Text('${storeProducts.imageUrl}')
  body: Form(
        key: formkey,
      child: ListView(
        children: <Widget>[
          

  
// //     validator: controller.validat//           CachedNetworkImage(
  
//   imageUrl: storeProductCopy.imageUrl,
//   placeholder: (context,url)=>CircularProgressIndicator(),
//   errorWidget: (context,url,error)=>Icon(Icons.error_outline,size: 250),
//   height: 250,
//   width: 250,
// ),
// // Container(
// //   child:   TextFormField(
// //   //enabled: editMode,
// //     initialValue: storeProductCopy.imageUrl,
  
// //     decoration: InputDecoration(
  
// //       labelText: 'ImageUrl',
// //       border: OutlineInputBorder(
// //         borderRadius: BorderRadius.circular(20.0),
// //       )
  
  
// //     ),
  
// //     autocorrect: false,eImageUrl,
  
//     onSaved: controller.saveImageUrl,
  
//   ),
// ),
CachedNetworkImage(
                imageUrl: '${storeProducts.imageUrl}',
                placeholder: (context,url)=>CircularProgressIndicator(),
                errorWidget: (context,url,error)=>Icon(Icons.error_outline),
              ),
          TextFormField(
           initialValue: reviewsCopy.myReviews,
            decoration: InputDecoration(labelText: ' Add your Reviews'),
            maxLines: 3,
            validator:controller.validateReview,
            onSaved: controller.saveReview,
          ),
          Container(
           // padding:EdgeInsets.all(5),
            child: RaisedButton(
              child: Text('SUBMIT'),
              onPressed: controller.submitReview,
              color: Colors.blue,
            ),
          )
        ],
        
        ),
      
      ),
    );
  }
  
}