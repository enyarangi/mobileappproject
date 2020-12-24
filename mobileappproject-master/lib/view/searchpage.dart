import 'package:cloud_firestore/cloud_firestore.dart';

import 'package:flutter/material.dart';
import 'package:myfashionapp/controller/searchpage_controller.dart';
import 'package:myfashionapp/model/storeproducts.dart';

import '../controller/searchpage_controller.dart';




// void main() => runApp(new MyApp());



// class MyApp extends StatelessWidget {

//   @override

//   Widget build(BuildContext context) {

//     return new MaterialApp(

//       theme: new ThemeData(

//         primarySwatch: Colors.blue,

//       ),

//       home: new MyHomePage(),

//     );

//   }

// }



class MyHomePage extends StatefulWidget {
final StoreProducts storeProducts;
final List<StoreProducts>productlist;
MyHomePage(this.storeProducts,this.productlist);

  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return MyHomePageState(this.storeProducts,this.productlist);
  }
}


 
class MyHomePageState extends State<MyHomePage> {
  StoreProducts storeProducts;
  MyHomePageController controller;
  var formkey=GlobalKey<FormState>();
//MyHomePageController controller;
 List<StoreProducts>productlist;
 MyHomePageState(this.storeProducts,this.productlist)
 {
controller=MyHomePageController(this);
 }
  // var queryResultSet = [];

  // var tempSearchStore = [];



  // initiateSearch(value) {

  //   if (value.length == 0) {

  //     setState(() {

  //       queryResultSet = [];

  //       tempSearchStore = [];

  //     });

  //   }



   // var capitalizedValue =

    //     value.substring(0, 1).toUpperCase() + value.substring(1);



    // if (queryResultSet.length == 0 && value.length == 1) {

    //   SearchService().searchByName(value).then((QuerySnapshot docs) {

  //       for (int i = 0; i < docs.documents.length; ++i) {

  //         queryResultSet.add(docs.documents[i].data);

  //       }

  //     });

  //   } else {

  //     tempSearchStore = [];

  //     queryResultSet.forEach((element) {

  //       if (element['itemName'].startsWith(capitalizedValue)) {

  //         setState(() {

  //           tempSearchStore.add(element);

  //         });

  //       }

  //     });

  //   }

  // }



  @override

  Widget build(BuildContext context) {

    return new Scaffold(

        appBar: new AppBar(

          title: Text('Firestore search'),

        ),

        body:Form(
          key: formkey,
          child: ListView(
            children: <Widget>[
              Container(
  child:   TextFormField(
  //enabled: editMode,
   // initialValue:,
  
    decoration: InputDecoration(
  
      labelText: 'Search for an item',
      border: OutlineInputBorder(
        borderRadius: BorderRadius.circular(20.0),  
      ),
  
  
    ),
  
    autocorrect: false,
  
    validator:controller.validateSearchButton,
  
    onSaved: controller.saveSearchButton,
  
  ),
),
    RaisedButton(
            child: Text('Search'),
            onPressed: controller.submitSearch,
          )        
            ],
          ),
          
        )

       
        );

  }

}



// Widget buildResultCard(data) {

//   return Card(

//     shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10.0)),

//     elevation: 2.0,

//     child: Container(

//       child: Center(

//         child: Text(data['itemName'],

//         textAlign: TextAlign.center,

//         style: TextStyle(

//           color: Colors.black,

//           fontSize: 20.0,

//         ),

//         )

//       )

//     )

//   );

// }