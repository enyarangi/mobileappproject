import 'package:firebase_auth/firebase_auth.dart';
import '../view/forgotpasswordpage.dart';

class ForgotPasswordPageController
{
  ForgotPasswordState state;
  ForgotPasswordPageController(this.state);
  String validateResetEmail(String value)
  {
if(value==null || !value.contains('.') || !value.contains('@')){
  return 'Enter a valid email address';
}
return null;
  }
  void saveResetEmail(String value)
  {
state.user.email=value;
  }
  void sendEmail() async
  {
if(!state.formkey.currentState.validate())
{
  return;
}

state.formkey.currentState.save();
await FirebaseAuth.instance.sendPasswordResetEmail(
  email: state.user.email
);
  }
}