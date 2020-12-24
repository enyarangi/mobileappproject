import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:myfashionapp/controller/userreviewscontroller.dart';
import 'package:myfashionapp/model/reviews.dart';
import 'package:myfashionapp/model/storeproducts.dart';
import '../model/user.dart';
import 'package:cached_network_image/cached_network_image.dart';

class UserReviews extends StatefulWidget
{
 final User user;
 final StoreProducts storeProducts;
  final Reviews reviews;
  final List<Reviews>reviewslist;

  UserReviews(this.user,this.storeProducts,this.reviews,this.reviewslist);
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return UserReviewsState(user,storeProducts,reviews,reviewslist);
  }
  
}
class UserReviewsState extends State<UserReviews>
{
  //var formkey=GlobalKey<FormState>();
  User user;
  List<Reviews>reviewslist;
  StoreProducts storeProducts;
  Reviews reviews;
  BuildContext context;
  UserReviewsController controller;
  UserReviewsState(this.user,this.storeProducts,this.reviews,this.reviewslist)
  {
    controller=UserReviewsController(this);
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
      appBar:AppBar(
        title: Text('User reviews'),
      ) ,
      body:ListView.builder(
        itemCount: reviewslist.length,
        itemBuilder: (BuildContext context,int index)
        {
return ListTile(
subtitle: Column(
  crossAxisAlignment:CrossAxisAlignment.start,
  children: <Widget>[
   
    Text(reviewslist[index].myReviews),

  //  Text(reviewslist[index].documentId),
  ],
),
//onTap:()=>controller.onTap(index),
onLongPress: (){},
);

        }
      ),
 floatingActionButton:FloatingActionButton(
        child: Icon(Icons.add),
        onPressed: controller.addReview,
      
),
      
   
    );
  }
  
}