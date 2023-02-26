import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:get/get.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  TextEditingController _email =TextEditingController();
  TextEditingController _password =TextEditingController();
  final _formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Padding(
          padding: EdgeInsets.only(
              bottom: MediaQuery.of(context).size.height * 0.08,
              top: MediaQuery.of(context).size.height * 0.07,
              right: MediaQuery.of(context).size.height * 0.020,
              left: MediaQuery.of(context).size.height * 0.020),
          child: _Form(),
        ));
  }
  Widget _Form() {
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Heder(),
        Heder2(),
        Form(
          key: _formKey,
          child: Inputs(),)
      ],
    );
  }

  Heder() {
    TextStyle H1 = TextStyle(
        fontSize: 45,
        fontFamily: 'Schyler',
        fontWeight: FontWeight.bold
    );

    return Text(
      "Student",
      textAlign: TextAlign.center,
      style: H1,
    );
  }

  Heder2() {
    TextStyle H2 = TextStyle(
        fontSize: 40,
        fontFamily: 'Schyler',
        fontWeight: FontWeight.bold
    );
    return Text("Login to Your Account",
        textAlign: TextAlign.center, style: H2);
  }

  Inputs() {
    return Column(
      children: [
        TextFormField(
          controller: _email,
          autovalidateMode: AutovalidateMode.onUserInteraction,
          validator: (value){
            if(value!.isEmpty){
              return "Please enter your Email";
            }
            return null;
          },

          decoration:  InputDecoration(
            fillColor: Color(0xff3a4859),
            filled: true,
            focusedBorder: OutlineInputBorder(
              borderSide: BorderSide(
                color: Colors.transparent,
              ),
            ),
            enabledBorder: OutlineInputBorder(
              //<-- SEE HERE
              borderRadius: BorderRadius.circular(10.0),
            ),
            hintText: 'Username or Email',
            hintStyle: TextStyle(color: Colors.white),
          ),
        ),
        SizedBox(
          height: 30,
        ),
        TextFormField(
          controller: _password,
          autovalidateMode: AutovalidateMode.disabled,

          validator: (value){
            if(value == ""){
              return "Please enter your Password";
            }
            return null;
          },

          decoration: new InputDecoration(
            fillColor: Color(0xff3a4859),
            filled: true,
            focusedBorder: OutlineInputBorder(
              borderSide: BorderSide(
                color: Colors.transparent,
              ),
            ),
            enabledBorder: OutlineInputBorder(
              //<-- SEE HERE
              borderRadius: BorderRadius.circular(10.0),
            ),
            hintText: 'Password',
            hintStyle: TextStyle(color: Colors.white),
          ),
        ),
        SizedBox(
          height: 30,
        ),
        SizedBox(
          width: double.infinity,
          height: 50,
          child: ElevatedButton(
            onPressed:  (){
              _submitForm();
              if (_submitForm == null) {
                print("null");
              }
            },
            child: Text('Login In'),
            style: ElevatedButton.styleFrom(
              backgroundColor: Color(0xfffbb718),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10), // <-- Radius
              ),
            ),
          ),
        )
      ],
    );
  }

  Future _submitForm() async {
    final FirebaseAuth _auth = FirebaseAuth.instance;
    if (  _formKey.currentState!.validate()) {
      try {
        UserCredential userCredential = await _auth.signInWithEmailAndPassword(
            email: _email.text,
            password: _password.text);

        return userCredential;
      } on FirebaseAuthException catch (e) {
        if (e.code == 'user-not-found') {
          print('No user found for that email.');
          return Get.showSnackbar(
            GetSnackBar(
              title: "Error",
              message: 'No user found for that email',
              backgroundColor: Colors.red.shade300,
              icon: const Icon(Icons.error_outline),
              duration: const Duration(seconds: 3),
            ),
          );
        } else if (e.code == 'wrong-password') {
          print('Wrong password provided for that user.');
          return Get.showSnackbar(
            GetSnackBar(
              title: "Error",
              message: 'Wrong password provided for that user.',
              backgroundColor: Colors.red.shade300,
              icon: const Icon(Icons.error_outline),
              duration: const Duration(seconds: 3),
            ),
          );
        }
        return null;
      }

    }
  }
}
