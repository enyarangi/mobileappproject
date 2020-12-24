import 'package:flutter/material.dart';
import 'package:myfashionapp/controller/forgotpasswordpage_controller.dart';
import '../model/user.dart';
class ForgotPassword extends StatefulWidget
{
  ForgotPassword(user);
   final User user=User();
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return ForgotPasswordState(user);
  }
  
}
class ForgotPasswordState extends State<ForgotPassword>
{
  var formkey=GlobalKey<FormState>();
  cek()
  {
    final form=formkey.currentState;
    if(form.validate())
    {
      form.save();
      sendEmail();
    }
  }
  var loading=false;
  sendEmail() async 
  {
    setState(()
    {
      loading=true;
    });
  
  }
  ForgotPasswordPageController controller;
  BuildContext context;
  User user=User();
  ForgotPasswordState(this.user)
  {
    controller=ForgotPasswordPageController(this);
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
        title: Text('RESET PASSSWORD'),
      ),
      
    body: Form(
      key: formkey,
child:ListView(
      children: <Widget>[
        Text('ENTER YOUR EMAIL ADDRESS AND CLICK THE SEND BUTTON .PLEASE CLICK THE LINK ON THE EMAIL TO RESET YOUR PASSWORD.',style: TextStyle(color:Colors.black,fontWeight: FontWeight.bold),),
    TextFormField(
      initialValue: user.email,
      decoration: InputDecoration(
        labelText: 'Please Enter your valid email address',
border: OutlineInputBorder(
  borderRadius: BorderRadius.circular(20.0)
)
      ),
      autocorrect: false,
      validator: controller.validateResetEmail,
      onSaved: controller.saveResetEmail,
    ),
    Container(
      padding: EdgeInsets.all(50.0),
      child: RaisedButton(
        child: Text('Send Email'),
        onPressed: controller.sendEmail,
        color: Colors.blue,
      ),
    )
      ],
    )
    )
    
    
    );
    
  }
  
}