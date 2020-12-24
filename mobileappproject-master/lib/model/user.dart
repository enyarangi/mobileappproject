class User
{
  String email;
  String password;
  String displayName;
  int phoneNumber;
  String uid;
  //String role;

  User(
    {
this.email,
this.password,
this.displayName,
this.phoneNumber,
this.uid,
//this.role,
    }
  );
  //serialize for firebase storage,in key value pair
  Map<String,dynamic>serialize()
  {
    return <String,dynamic>
    {
      EMAIL:email,
      DISPLAYNAME:displayName,
      PHONENUMBER:phoneNumber,
      UID:uid,
      //ROLE:role,
    };
  }
  
  //crete user object in reverse using deserialize
  static User deserialize(Map<String,dynamic>document)
  {
    return User(
email: document[EMAIL],
displayName: document[DISPLAYNAME],
phoneNumber: document[PHONENUMBER],
uid: document[UID],
//role: document[ROLE],
    );
  }
  static const PROFILE_COLLECTION='userprofile';
  static const EMAIL='email';
  static const DISPLAYNAME='displayName';
  static const PHONENUMBER='phonenumber';
  static const UID='uid';
 // static const ROLE='role';
}
