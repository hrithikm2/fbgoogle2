import 'package:flutter/material.dart';
import 'package:signin/Widgets/profilepage.dart';
import 'package:signin/provider/userdata.dart';
import 'package:signin/services/database.dart';
import 'package:signin/Widgets/profilepage.dart';
class CreateProfile extends StatefulWidget {
  const CreateProfile({Key? key}) : super(key: key);

  @override
  _CreateProfileState createState() => _CreateProfileState();
}

class _CreateProfileState extends State<CreateProfile> {
DatabaseMethods databaseMethods = new DatabaseMethods();
  final _formKey = GlobalKey<FormState>();
  final fullname = TextEditingController();
  final designation = TextEditingController();
  final aboutyou = TextEditingController();
  final _user = Userprofiledata();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      
      body: Container(
        child: Form(
        key: _formKey,
          child: Column(
            children: [
              TextFormField(decoration: InputDecoration(labelText: 'Full Name'),
              controller: fullname,
              validator : (value){
                if(value!.isEmpty){
                  return 'please enter your name';
                }
              },
                onSaved:(val)=>setState(()=>_user.fullname =val!),),
              TextFormField(decoration: InputDecoration(labelText: 'Designation'),
              controller: designation,
                  validator : (value){
                    if(value!.isEmpty){
                      return 'please enter your name';
                    }
                  },
                  onSaved:(val)=>setState(()=>_user.designation =val!),
                  ),
              TextField(decoration: InputDecoration(labelText: 'Tell Us about yourself'),
              controller : aboutyou,
              maxLines: 10,
                onChanged:(val)=>setState(()=>_user.aboutyou =val), ),
            Container(
              child : ElevatedButton(onPressed: (){
                final form = _formKey.currentState;
                if(form!.validate()){
                  form.save();
 
                Map< String,String> userinfoMap = {
                    "name" : fullname.text,
                    "designation"  : designation.text,
                    "aboutyou": aboutyou.text,
                };  
     databaseMethods.uploadUserinfo(userinfoMap);


                }
                 Navigator.push(
    context,
    MaterialPageRoute(builder: (context) => profilePage()),
  );
              }, child: Text("Submit"),

              )
            ),

          //  Text((_user.aboutyou ==null)
          //  ? "no user data"
          //  : _user.aboutyou
          //  ),
            ],
          ),
        ),
      ),
    );
  }
}
