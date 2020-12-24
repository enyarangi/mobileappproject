

import '../model/user.dart';

import '../controller/loginpage_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter/animation.dart';
class LoginPage extends StatefulWidget
{
  LoginPage();
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return LoginPageState();
  }
  
}
class LoginPageState extends State<LoginPage> with SingleTickerProviderStateMixin
{
  

  var formkey=GlobalKey<FormState>();
  BuildContext context;
  var user=User();
  
  LoginPageController controller;
  LoginPageState()
  {
    controller=LoginPageController(this);
  }
  
  @override
  Widget build(BuildContext context) {
    
  this.context=context;
    return Scaffold(
      appBar: AppBar(
        title: Text('FashionApp'),
        centerTitle: true,
        actions: <Widget>[
        FlatButton.icon(
          icon: Icon(Icons.people,color: Colors.white),
          label:Text('Register',),
          color: Colors.blue,
          onPressed: controller.registerUser,
        ),
      
        ],

      ),
      
      body:

    
      Container(
        //decoration: BoxDecoration(
          //image: DecorationImage(
            //image: AssetImage("assets/images/picture3.jpg"),
            //fit: BoxFit.cover,
          //)
        //),
        child: Form(
          
          key: formkey,
        
          child: ListView(
            children: <Widget>[  
              Container(
                padding: EdgeInsets.all(10.0),
                child: Text('Welcome to FashioApp',style: TextStyle(color: Colors.black,fontSize: 30,fontWeight: FontWeight.bold),)),
              Container(
                padding: EdgeInsets.only(bottom: 30),
                child: Text('You will enjoy your experience of online shopping',style: TextStyle(color: Colors.black,fontSize: 15.0,fontWeight: FontWeight.bold),)),
              
              TextFormField(
                initialValue: user.email,
                decoration: InputDecoration(
                
                border: OutlineInputBorder(
                  
                  borderRadius: BorderRadius.circular(20.0),
                ),
            labelText: 'email',
            hintText: 'Enter your email',
            hoverColor: Colors.blue,
          ),
          autocorrect: false,
          onSaved: controller.saveEmail,
          validator: controller.validateEmail,
          keyboardType: TextInputType.emailAddress,
              ),
              TextFormField(
                initialValue: user.password,
                obscureText: true,
                decoration: InputDecoration(
                  labelText: 'password',
                  hintText: 'Enter your password',
                  hoverColor: Colors.blue,
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(20.0),
                  )
                ),
                
                autocorrect: false,
                onSaved: controller.savePassword,
                validator: controller.validatePassword,
              ),
              Container(
                padding: EdgeInsets.all(30.0),
                child: RaisedButton(
                  child: Text('LOGIN'),
                  onPressed:controller.login,
                  color: Colors.blue,
                ),
              ),
              SizedBox(
height: 16.0,
              ),
              FlatButton(
                onPressed: controller.forgotPassword,
                child: Text('Forgot password?Click here',style: TextStyle(color: Colors.black),),
              ),
              
            ],
        
          ),
          
        ),
      ),
      
    );
  }
  
}