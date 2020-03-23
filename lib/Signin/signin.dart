import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:liquor/screens/home.dart';
class LoginPage extends StatefulWidget {
  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  String _email, _password;
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('Sign In'),
        ),
        body: Form(
            key: _formKey,
            child: Column(
              children: <Widget>[
                TextFormField(
                    validator: (input){
                      if(input.isEmpty){
                        return 'Please type an email';
                      }
                    },
                    onSaved: (input) => _email = input,
                    decoration: InputDecoration(
                        labelText: 'Email'
                    )
                ),
                TextFormField(
                  validator: (input){
                    if(input.isEmpty){
                      return 'Please provide a password.';
                    }
                  },
                  onSaved: (input) => _password = input,
                  decoration: InputDecoration(
                      labelText: 'Password'
                  ),
                  obscureText: true,
                ),
                RaisedButton(
                  onPressed: signIn,
                  child: Text('Sign In'),
                )
              ],
            )
        )
    );
  }

  Future<void> signIn() async {
    final _formState = _formkey.currentState;
    if(formState.validate()){
      formState.save();
      try{
        FirebaseUser user = await FirebaseAuth.instance.signInWithEmailAndPassword(email: _email, password: _password);
        Navigator.push(context, MaterialPageRoute(builder: (context) => Home()));
        //TODO Navigate to home
      }catch(e){
        print(e.message);
      }

    }
  }
}
