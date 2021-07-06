import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:provider/provider.dart';
import 'package:signin/provider/google_sign_in.dart';
import 'package:signin/Widgets/createprofile.dart';

class HomePageWidget extends StatelessWidget {
  final user = FirebaseAuth.instance.currentUser!;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("User is Logged Out"),
          centerTitle: true,
          actions: [
            IconButton(
                onPressed: () {
                  final provider =
                      Provider.of<GoogleSignInProvider>(context, listen: false);
                  provider.logout();
                },
                icon: FaIcon(FontAwesomeIcons.signOutAlt))
          ],
        ),
        body: 
        // Column(
        //   children: [
        //     ListTile(
        //       leading: CircleAvatar(
        //     backgroundImage: NetworkImage(user.photoURL!),
        //       ),
        //       title: Text(user.displayName!),
        //       subtitle: Text(user.email!),
        //     ),

         CreateProfile(),
        //  ],
          
     //   )
        );
  }
}
