

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:location/location.dart';
import '../controller/aboutpage_controller.dart';
class AboutPage extends StatefulWidget { 
  @override
  State<AboutPage> createState() => AboutPageState();
}

class AboutPageState extends State<AboutPage> {
  AboutPageController controller;
  AboutPageState()
  {
    controller=AboutPageController(this);
  }
  Map<MarkerId,Marker>markers=<MarkerId,Marker>{};
  bool mapToggle=false;
  
  var currentLocation;
  List<LatLng>routeCoords;
BuildContext context;
List<Marker> allMarkers =[];
GoogleMapController mapController;
Location location=new Location();
//String searchAddr;

@override
  void initState() {
    populateClients();
    
    // TODO: implement initState
    Geolocator().getCurrentPosition().then((currloc)
    {
setState(() {
  currentLocation=currloc;
  mapToggle=true;
});
    });
    super.initState();

  }
   
 populateClients(){
   Firestore.instance.collection('visitplaces')
   //.where('status',isEqualTo:'available')
   //.snapshots();
   
    .getDocuments().then((docs)

  //  static Future<List<Reviews>>getReviews() async{
  // QuerySnapshot querySnapshot= await Firestore.instance.collection(Reviews.REVIEWSCOLLECTION)
 // .where(Reviews.MYREVIEWS,isEqualTo:documentId)
   
   {
     if(docs.documents.isNotEmpty)
     {
       for(int i=0;i<docs.documents.length;++i)
       {
          //if (request['status'] == "available")
            initMarker(docs.documents[i].data,docs.documents[i].documentID);
       }
     }
   });
 }
void initMarker(request,requestId)
{

  var markerIdVal=requestId;
  final MarkerId markerId=MarkerId(markerIdVal);
 // int index;
    final Marker marker=Marker(
      markerId: markerId,
      position: LatLng(request['coords'].latitude,request['coords'].longitude ),
      //infoWindow: InfoWindow(title: "Parking space",snippet: request['Name']),
     // onTap:()=> controller.onTap(index),

  );
  setState(() {

   markers[markerId]=marker;
   print(markerId); 
  });
  
 
}
  @override
  Widget build(BuildContext context) {
    this.context=context;
    return new Scaffold(
      appBar: AppBar(
        title: Text('Maps'),
      ),
      body: Stack(
        children:<Widget>[
       Container(
          height: MediaQuery.of(context).size.height,
          width: MediaQuery.of(context).size.width,
          child: mapToggle  ?GoogleMap(
            initialCameraPosition: CameraPosition(
              target: LatLng(40.7128,-74.0060),
              zoom: 15.0
            ),
           markers: Set<Marker>.of(markers.values),
            onMapCreated: onMapCreated,
            myLocationEnabled: true,
          ):
          Center(child: 
          Text('Loading....Please wait',style: TextStyle(
            fontSize: 20.0
          ),),)
        ),
        // Positioned(
        //   top: 30.0,
        //   right: 15.0,
        //   left: 15.0,
        //   child: Container(
        //     height: 50.0,
        //     width: double.infinity,
        //     decoration: BoxDecoration(
        //       borderRadius: BorderRadius.circular(10.0),
        //       color: Colors.grey,
        //     ),
            // child: TextField(
            //   decoration: InputDecoration(
            //     hintText: "Search here" ,
            //     border: InputBorder.none,
            //     contentPadding: EdgeInsets.only(
            //       left: 15.0,
            //       top: 15.0,
                
            //     ),
            //     suffixIcon: IconButton(
            //       icon: Icon(Icons.search),
            //        onPressed:searchandNavigate,
            //       iconSize: 30.0,
            //     )
            //   ),
            //   onChanged: (val)
            //   {
            //     setState(() {
            //      searchAddr=val; 
            //     });
            //   }
            // ),
         // ),
          
          
       // ),
       
        ] 
        ),
        
        
        );
        }
        
  //       searchandNavigate()
  //       {
  //         Geolocator().placemarkFromAddress(searchAddr).then((result)
  //         {
  //           mapController.animateCamera(CameraUpdate.newCameraPosition(
  //             CameraPosition(
  //               target: LatLng(result[0].position.latitude, result[0].position.longitude), zoom: 18.0
  // )
  //         ));
  //         });
  //       }
        void onMapCreated(GoogleMapController controller)
        {
          setState(() {

           });
          
        }
}
        