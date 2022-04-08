//import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_core/firebase_core.dart';
//flutter pub add firebase_database
import 'package:firebase_database/firebase_database.dart';
//import 'package:firstfire/services/database.dart';
import 'package:flutter/material.dart';
import 'package:my_todo_app1/auth_view/login.dart';

import '../main_page.dart';
//import 'package:provider/provider.dart ';
//import 'package:cloud_firestore/cloud_firestore.dart';

class NewSignUp extends StatefulWidget {
  const NewSignUp({Key? key, required FirebaseApp firebaseApp})
      : super(key: key);

  @override
  State<NewSignUp> createState() => _NewSignUpState();
}

class _NewSignUpState extends State<NewSignUp> {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  late String _email, _password, _name;

  checkAuthentification() async {
    _auth.authStateChanges().listen((user) {
      if (user != null) {
        print(user);

        Navigator.push(context, MaterialPageRoute(builder: (context) {
          return MainPage();
        }));
      }
    });
  }

  @override
  void initState() {
    super.initState();
    //  this.checkAuthentification();
  }

  signUp() async {
    if (_formKey.currentState!.validate()) {
      _formKey.currentState!.save();

      try {
        UserCredential user = await _auth.createUserWithEmailAndPassword(
          email: _email,
          password: _password,
        );
        if (user != null) {
          // UserUpdateInfo updateuser = UserUpdateInfo();
          // updateuser.displayName = _name;
          //  user.updateProfile(updateuser);
          await _auth.currentUser!.updateDisplayName(_name);
          showSuccess();
          // await Navigator.pushReplacementNamed(context,"/") ;

        }
      } catch (e) {
        showError(e.toString());
        print(e);
      }
    }
  }

  showError(String errormessage) {
    showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            title: const Text('ERROR'),
            content: Text(errormessage),
            actions: <Widget>[
              FlatButton(
                  onPressed: () {
                    Navigator.of(context).pop();
                  },
                  child: const Text('OK'))
            ],
          );
        });
  }

  showSuccess() {
    showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            title: Text('Success'),
            content: Text("You have successfully created an account"),
            actions: <Widget>[
              FlatButton(
                  onPressed: () {
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) {
                      return Newlogin(firebaseApp: Firebase.app());
                    }));
                  },
                  child: Text('OK'))
            ],
          );
        });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(),
        body: ListView(
          children: [
            const SizedBox(
              height: 60,
            ),
            Container(
              height: 200,
              child: const Image(
                image: AssetImage("assets/images/rcc_logo1.jpg"),
                // fit: BoxFit.scaleDown,
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(15.0),
              child: Form(
                  key: _formKey,
                  child: Column(
                    children: [
                      TextFormField(
                        decoration: const InputDecoration(
                          labelText: 'Name',
                          hintText: 'Enter your name',
                          icon: Icon(Icons.person),
                        ),
                        onSaved: (input) => _name = input!,
                      ),
                      TextFormField(
                        decoration: const InputDecoration(
                          labelText: 'Email',
                          hintText: 'Enter your email',
                          icon: Icon(Icons.email),
                        ),
                        onSaved: (input) => _email = input!,
                      ),
                      TextFormField(
                        decoration: const InputDecoration(
                          labelText: 'Password',
                          hintText: 'Enter your password',
                          icon: Icon(Icons.lock),
                        ),
                        obscureText: true,
                        onSaved: (input) => _password = input!,
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      TextButton(
                          onPressed: signUp, child: const Text('Sign Up')),
                    ],
                  )),
            )
          ],
        ));
  }
}





// class HomeData extends StatefulWidget {
//   HomeData({Key? key, required this.firebaseApp}) : super(key: key);
//   final FirebaseApp firebaseApp;
//   @override
//   State<HomeData> createState() => _HomeDataState();
// }

// class _HomeDataState extends State<HomeData> {
//   final FirebaseAuth _auth = FirebaseAuth.instance;
//   final DatabaseReference databaseReference = FirebaseDatabase.instance.ref();
//   late String _email, _password, _name ;
//   @override
//   Widget build(BuildContext context) {
//     final ref = databaseReference.child('movies');
//     final movieController = TextEditingController();
//     final authorController = TextEditingController();
//     return Scaffold(
//       appBar: AppBar(
//         actions: [
//           IconButton(
//             icon: const Icon(Icons.exit_to_app),
//             onPressed: () {
//               _auth.signOut();
//               Navigator.pop(context);
//             },
//           ),
//         ],
//         title: const Text('Home'),
//       ),
//       body: Column(children: [
//         TextField(
//           controller: authorController,
//           decoration: const InputDecoration(
//             labelText: 'Search',
//             hintText: 'Search',
//             prefixIcon: Icon(Icons.search),
//             border: OutlineInputBorder(
//               borderRadius: BorderRadius.all(Radius.circular(10.0)),
//             ),
//           ),
//         ),
//         TextField(
//           controller: movieController,
//           decoration: const InputDecoration(
//             labelText: 'Search',
//             hintText: 'Search',
//             prefixIcon: Icon(Icons.search),
//             border: OutlineInputBorder(
//               borderRadius: BorderRadius.all(Radius.circular(10.0)),
//             ),
//           ),
//         ),
//         TextButton(
//             onPressed: () {
//               ref.push().set({
//                 'movies': movieController.text,
//                 'author': authorController.text,
//               }).asStream();
//               print(movieController.text);
//             },
//             child: const Text('Add')),
//       ]),
//     );
//   }
// }