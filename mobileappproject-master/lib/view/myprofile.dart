
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:myfashionapp/controller/myprofilecontroller.dart';
import 'dart:io';
import 'package:path/path.dart';

import '../model/user.dart';
class MyProfile extends StatefulWidget{
  MyProfile(this.user);
   final User user;
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return MyProfileState(user);
  }

}
class MyProfileState extends State<MyProfile>
{
  BuildContext context;
  MyProfileController controller;

  User user;
  File _image;
  MyProfileState(this.user)
  {
    controller=MyProfileController(this);
  }
  void stateChanged(Function fn){
    setState(fn);
  }
  @override
  Widget build(BuildContext context) {
    this.context=context;
    Future getImage() async {
      var image=await ImagePicker.pickImage(source: ImageSource.gallery);
      setState(() {
       _image=image; 
       print ('Image path $_image');
      });
    }
    Future uploadPic(BuildContext context) async{
String fileName=basename(_image.path);
StorageReference firebaseStorageRef=FirebaseStorage.instance.ref().child(fileName);
StorageUploadTask uploadTask=firebaseStorageRef.putFile(_image);
StorageTaskSnapshot taskSnapshot=await uploadTask.onComplete;
setState(() {
print("Profile Picture Uploaded") ;
Scaffold.of(context).showSnackBar(SnackBar(content: Text("Profile Picture Uploaded Succcessfully"),));
});
    }
    // TODO: implement build
    return Scaffold(
      appBar: AppBar(
        title: Text('Profile Information'),
      ),
      body: Builder(
        builder: (context)=>Container(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: <Widget>[
              SizedBox(
                height: 20.0,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Align(
                    alignment: Alignment.center,
                    child: CircleAvatar(
                      radius: 100,
                      backgroundColor: Colors.blue,
                      child: ClipOval(
                        child: SizedBox(
                          width: 180.0,
                          height: 180.0,

                          child: (_image!=null) ? Image.file(_image,fit:BoxFit.fill ) :
                          Image.network("https://www.amazon.com/b?node=19982294011&ref=af_gw_topquad_w_sbs_1&pf_rd_p=e8f344e7-3aa5-4839-8d08-1a5e7f4bc5ba&pf_rd_r=K9J3DNSG73B9ST73FDYF",
                          fit: BoxFit.fill,
                          ),
                        ),
                      ),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.only(top: 60.0),
                    child: IconButton(
                      icon: Icon(Icons.camera_alt,size: 30.0,),
                      onPressed: (){
getImage();
                      },
                    ),
                    
                    )
                ],
              ),
              SizedBox(
                height: 20.0,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: <Widget>[
                  Align(
                    alignment: Alignment.center,
                    child: Container(
                      child: Column(
                        children: <Widget>[
                          Align(alignment: Alignment.centerLeft,
                          child: Text('UserName:',style: TextStyle(color: Colors.black,fontSize:20.0),
                          
                          ),
                          ),
                          Align(
                            alignment: Alignment.centerLeft,
                            child: Text('${user.displayName}',style: TextStyle(
                              color: Colors.black,
                              fontSize: 20.0,
                              fontWeight: FontWeight.bold
                            ),
                            ),
                          ),
                          
                        ],
                      ),
                    ),
                  ),
                  Align(
                            alignment: Alignment.centerLeft,
                            child: Container(
                              child: Icon(
                                Icons.edit,
                                color:Colors.blue,
                              ),
                            ),
                          ),
                          
                ],
              ),
              SizedBox(
                height: 20.0,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: <Widget>[
Align(
  alignment: Alignment.centerLeft,
  child: Container(
    child: Column(
      children: <Widget>[
        Align(
          alignment: Alignment.centerLeft,
          child: Text('Email',style: TextStyle(color: Colors.black,fontSize: 20.0),),
        ),
        Align(
          alignment: Alignment.centerLeft,
          
          child: Text('${user.email}',style: TextStyle(color: Colors.black,fontSize: 20.0,fontWeight: FontWeight.bold),),

        ),
      
      ],
    ),
  ),
),
Align(
  alignment: Alignment.centerRight,
  child: Container(
    child: Icon(Icons.edit,color: Colors.blue,),
  ),
),
              ],
              ),
               SizedBox(
                height: 20.0,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: <Widget>[
Align(
  alignment: Alignment.centerLeft,
  child: Container(
    child: Column(
      children: <Widget>[
        Align(
          alignment: Alignment.centerLeft,
          child: Text('PhoneNumber',style: TextStyle(color: Colors.black,fontSize: 20.0),),
        ),
        Align(
          alignment: Alignment.centerLeft,
          
          child: Text('${user.phoneNumber}',style: TextStyle(color: Colors.black,fontSize: 20.0,fontWeight: FontWeight.bold),),

        ),
      
      ],
    ),
  ),
),
Align(
  alignment: Alignment.centerRight,
  child: Container(
    child: Icon(Icons.edit,color: Colors.blue,),
  ),
),
              ],
              ),
              SizedBox(
                height: 20.0,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: <Widget>[
                  RaisedButton(
                    color:Colors.blue,
                    onPressed: controller.cancelButton,
                    elevation: 4.0,
                    splashColor: Colors.grey,
                    child: Text(
                      'Cancel',
                      style:TextStyle(color: Colors.white,)
                    ),

                  ),
                  RaisedButton(
                    color:Colors.blue,
                    onPressed:
                    ()
                    {
                      uploadPic(context);
                    },
                    elevation: 4.0,
                    splashColor: Colors.grey,
                    child: Text(
                      'Submit',style:TextStyle(color:Colors.white)
                    ),

                  )
                ],
              )
            ],
          ),
          
        ),
        
      ),
    );
  }
  
}