import '../controller/registerpage_controller.dart';
import 'package:flutter/material.dart';
import '../model/user.dart';
class RegisterPage extends StatefulWidget{
  RegisterPage();
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return RegisterPageState();
  }

}
class RegisterPageState extends State<RegisterPage>
{
  BuildContext context;
  RegisterPageController controller;
  var user=User();
  var formkey=GlobalKey<FormState>();
  RegisterPageState(){
    controller=RegisterPageController(this);
  }
  void stateChanged(Function fn){
    setState(fn);
  }

  @override
  Widget build(BuildContext context) {
    this.context=context;
    // TODO: implement build
    return Scaffold(
appBar: AppBar(
  title: Text('Register Page'),
  centerTitle: true,
),
body: Form(
  key: formkey,
  child: ListView(
    children: <Widget>[
      TextFormField(
        decoration: InputDecoration(
          labelText: 'email',
          hintText: 'Enter your email',
      hoverColor: Colors.blue,
      border: OutlineInputBorder(
        borderRadius: BorderRadius.circular(20.0),
      )
        ),
        autocorrect: false,
        validator: controller.validateRegisterEmail,
        onSaved: controller.saveRegisterEmail,
      keyboardType: TextInputType.emailAddress,
      ),
      TextFormField(
        obscureText: true,
        decoration: InputDecoration(
          labelText: 'password',
          hintText: 'Enter your password',
          hoverColor: Colors.blue,
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(20.0)
          )
        ),
        autocorrect: false,
        validator: controller.validateRegisterPassword,
        onSaved: controller.saveRegisterPassword,
      ),
      TextFormField(
        decoration: InputDecoration(  
          labelText: 'DispayName',
          hintText: 'Enter the DisplayName',
          hoverColor: Colors.blue,
border: OutlineInputBorder(borderRadius: BorderRadius.circular(20.0))
        ),
        autocorrect: false,
        validator: controller.validateDisplayName,
        onSaved: controller.saveDisplayName,
      ),
      TextFormField(
        decoration: InputDecoration(
          labelText: 'PhoneNumber',
          hintText: 'Enter your phone number',
          hoverColor: Colors.blue,
          border: OutlineInputBorder(borderRadius: BorderRadius.circular(20.0))
        ),
        autocorrect: false,
        validator: controller.validatePhoneNumber,
        onSaved: controller.savePhoneNumber,
        keyboardType: TextInputType.number,

      ),
      // TextFormField(
      //   decoration: InputDecoration(
      //     labelText: 'Role',
      //     hintText: 'Enter your role',
      //     hoverColor: Colors.blue,
      //     border: OutlineInputBorder(borderRadius: BorderRadius.circular(20.0))
      //   ),
      //   autocorrect: false,
      //   validator: controller.validateRole,
      //   onSaved: controller.saveRole,
      // ),
  
      Container(
        padding: EdgeInsets.all(40),
        
              child: RaisedButton(
          child: Text('Register',),
          color: Colors.blue,
          onPressed: controller.registerButton,

        ),
      ),
    ],
  ),
),
    );
  }
  
}