import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
//import 'package:firstfire/SignUp.dart';
//import 'package:firstfire/screens/home.dart';
//import 'package:firstfire/screens/newSignup.dart';
import 'package:flutter/material.dart';
import 'package:my_todo_app1/auth_view/signup.dart';
import 'package:my_todo_app1/main_page.dart';

//import '../Homepage.dart';

class Newlogin extends StatefulWidget {
  const Newlogin({Key? key, required FirebaseApp firebaseApp})
      : super(key: key);

  @override
  State<Newlogin> createState() => _NewloginState();
}

class _NewloginState extends State<Newlogin> {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  late String _email, _password;
  bool isLoading = false;

  checkAuthentification() async {
    // isLoading = ;
    _auth.authStateChanges().listen((user) {
      if (user != null) {
        print(user);

        Navigator.push(context, MaterialPageRoute(builder: (context) {
          return MainPage();
        }));
      }
    });
  }

  islogin() {
    setState(() {
      isLoading = true;
    });
  }

  @override
  void initState() {
    super.initState();
    this.checkAuthentification();
  }

  login() async {
    islogin();
    if (_formKey.currentState!.validate()) {
      _formKey.currentState!.save();
      try {
        await _auth.signInWithEmailAndPassword(
            email: _email, password: _password);
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
            content: const Text("Wrong Email or Password"),
            actions: <Widget>[
              FlatButton(
                  onPressed: () {
                    Navigator.of(context).pop();
                  },
                  child: Text('OK'))
            ],
          );
        });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SingleChildScrollView(
      child: Container(
        child: Column(
          children: <Widget>[
            SizedBox(
              height: 100,
            ),
            Container(
              height: 200,
              child: const Image(
                image: AssetImage("assets/images/rcc_logo1.jpg"),
                // fit: BoxFit.scaleDown,
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Container(
                child: Form(
                  key: _formKey,
                  child: Column(
                    children: <Widget>[
                      Container(
                        child: TextFormField(
                            validator: (input) {
                              if (input!.isEmpty) return 'Enter Email';
                            },
                            decoration: const InputDecoration(
                                labelText: 'Email',
                                prefixIcon: Icon(Icons.email)),
                            onSaved: (input) => _email = input!),
                      ),
                      Container(
                        child: TextFormField(
                            validator: (input) {
                              if (input!.length < 6) {
                                return 'Provide Minimum 6 Character';
                              }
                            },
                            decoration: const InputDecoration(
                              labelText: 'Password',
                              prefixIcon: Icon(Icons.lock),
                            ),
                            obscureText: true,
                            onSaved: (input) => _password = input!),
                      ),
                      const SizedBox(height: 20),
                      Visibility(
                          visible: isLoading,
                          child: const CircularProgressIndicator()),
                      RaisedButton(
                        padding: const EdgeInsets.fromLTRB(70, 10, 70, 10),
                        onPressed: login,
                        child: const Text('LOGIN',
                            style: TextStyle(
                                color: Colors.white,
                                fontSize: 20.0,
                                fontWeight: FontWeight.bold)),
                        color: Colors.green,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(20.0),
                        ),
                      ),
                     
                    ],
                  ),
                ),
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            GestureDetector(
              child: const Text('Create an Account?'),
              onTap: () {
                Navigator.push(context, MaterialPageRoute(builder: (context) {
                  return NewSignUp(
                    firebaseApp: Firebase.app(),
                  );
                }));
              },
            )
          ],
        ),
      ),
    ));
  }
}
