import 'dart:convert';

import 'package:crypto/crypto.dart';
import 'package:flutter/material.dart';
import 'package:frontend_sdcc_flutter/pages/HomePage.dart';
import 'package:frontend_sdcc_flutter/widget/Logo.dart';
import '../object/User.dart';
import '../utility/Model.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({Key key}) : super(key: key);

  static User userLogged;

  @override
  State<StatefulWidget> createState() {
    return LoginPageState();
  }
}
class LoginPageState extends State<LoginPage>{

  TextEditingController emailAddressController;
  TextEditingController passwordController;
  TextEditingController nameController;
  TextEditingController surnameController;
  bool passwordVisibility;
  bool logging;

  @override
  void initState() {
    super.initState();
    emailAddressController = TextEditingController();
    nameController = TextEditingController();
    surnameController = TextEditingController();
    passwordController = TextEditingController();
    passwordVisibility = false;
    logging = true;
  }

  @override
  Widget build(BuildContext context) {
    if(logging) {
      return loginView();
    } else {
      return signUpView();
    }
  }

  Widget loginView(){
    return Scaffold(
        body: Container(
            width: MediaQuery.of(context).size.width,
            height: MediaQuery.of(context).size.height * 1,
            decoration: BoxDecoration(
              color: Colors.white,
              image: DecorationImage(
                fit: BoxFit.fill,
                image: Image.asset(
                  'assets/images/background.jpg',
                ).image,
              ),
            ),
            child: Column(
                mainAxisSize: MainAxisSize.max,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(
                      width: MediaQuery.of(context).size.width * 0.70,
                      padding: const EdgeInsets.fromLTRB(0, 25, 0, 25),
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(30),
                        border: Border.all(width: 2),
                      ),
                      child: Padding(
                        padding: const EdgeInsets.fromLTRB(20, 0, 20, 0),
                        child: Column(
                            mainAxisSize: MainAxisSize.max,
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              const Logo(color: Colors.indigoAccent),
                              const Text("Welcome Back,",
                                style: TextStyle(
                                    fontStyle: FontStyle.italic,
                                    fontFamily: 'Urbanist',
                                    color: Colors.black,
                                    fontSize: 24
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.fromLTRB(0, 15, 0, 0),
                                child: TextFormField(
                                  controller: emailAddressController,
                                  style: const TextStyle(
                                      color: Colors.black
                                  ),
                                  obscureText: false,
                                  decoration: InputDecoration(
                                    labelStyle: const TextStyle(
                                        color: Colors.black54
                                    ),
                                    labelText: 'Email Address',
                                    hintText: 'Enter your email here...',
                                    hintStyle: const TextStyle(
                                        color: Colors.black54
                                    ),
                                    enabledBorder: OutlineInputBorder(
                                      borderSide: const BorderSide(
                                        color: Colors.black54,
                                        width: 2,
                                      ),
                                      borderRadius: BorderRadius.circular(12),
                                    ),
                                    focusedBorder: OutlineInputBorder(
                                      borderSide: const BorderSide(
                                        color: Colors.black54,
                                        width: 2,
                                      ),
                                      borderRadius: BorderRadius.circular(12),
                                    ),
                                    filled: true,
                                    fillColor: Colors.white,
                                    contentPadding: const EdgeInsetsDirectional.fromSTEB(16, 24, 0, 24),
                                  ),
                                ),
                              ),
                              enterPasswordWidget(),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.end,
                                children: [
                                  RawMaterialButton(
                                    onPressed: logging ? () => login() : () => signup(),
                                    padding: const EdgeInsets.fromLTRB(30,10,30,10),
                                    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(25)),
                                    fillColor: Colors.indigo,
                                    child: const Text("Login",
                                      style: TextStyle(
                                          color: Colors.white,
                                          fontWeight: FontWeight.bold,
                                          fontFamily: 'Urbanist',
                                          fontSize: 18
                                      ),
                                    ),
                                  )
                                ],
                              ),
                              Padding(
                                padding: const EdgeInsets.fromLTRB(0, 10, 0, 0),
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    const Text("Don't you have an Account?",
                                      style: TextStyle(
                                          color: Colors.black54,
                                          fontWeight: FontWeight.bold,
                                          fontFamily: 'Urbanist',
                                          fontSize: 12
                                      ),
                                    ),
                                    MaterialButton(
                                      onPressed: () => setState(() {
                                        emailAddressController.clear();
                                        passwordController.clear();
                                        logging = !logging;
                                      }),
                                      child: const Text("Create Account",
                                        style: TextStyle(
                                            color: Colors.indigoAccent,
                                            fontWeight: FontWeight.bold,
                                            fontFamily: 'Urbanist',
                                            fontSize: 12
                                        ),
                                      ),
                                    )
                                  ],
                                ),
                              )
                            ]
                        ),
                      )
                  )
                ]
            )
        )
    );
  }

  Widget signUpView(){
    return Scaffold(
        body: Container(
            width: MediaQuery.of(context).size.width,
            height: MediaQuery.of(context).size.height * 1,
            decoration: BoxDecoration(
              color: Colors.white,
              image: DecorationImage(
                fit: BoxFit.fill,
                image: Image.asset(
                  'assets/images/background.jpg',
                ).image,
              ),
            ),
            child: Column(
                mainAxisSize: MainAxisSize.max,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(
                      width: MediaQuery.of(context).size.width * 0.70,
                      padding: const EdgeInsets.fromLTRB(0, 25, 0, 25),
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(30),
                        border: Border.all(width: 2),
                      ),
                      child: Padding(
                        padding: const EdgeInsets.fromLTRB(20, 0, 20, 0),
                        child: Column(
                            mainAxisSize: MainAxisSize.max,
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              const Logo(color: Colors.indigoAccent),
                              const Text("Welcome Back,",
                                style: TextStyle(
                                    fontStyle: FontStyle.italic,
                                    fontFamily: 'Urbanist',
                                    color: Colors.black,
                                    fontSize: 24
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.fromLTRB(0, 15, 0, 0),
                                child: TextFormField(
                                  controller: nameController,
                                  style: const TextStyle(
                                      color: Colors.black
                                  ),
                                  obscureText: false,
                                  decoration: InputDecoration(
                                    labelStyle: const TextStyle(
                                        color: Colors.black54
                                    ),
                                    labelText: 'Name',
                                    hintText: 'Enter your name here...',
                                    hintStyle: const TextStyle(
                                        color: Colors.black54
                                    ),
                                    enabledBorder: OutlineInputBorder(
                                      borderSide: const BorderSide(
                                        color: Colors.black54,
                                        width: 2,
                                      ),
                                      borderRadius: BorderRadius.circular(12),
                                    ),
                                    focusedBorder: OutlineInputBorder(
                                      borderSide: const BorderSide(
                                        color: Colors.black54,
                                        width: 2,
                                      ),
                                      borderRadius: BorderRadius.circular(12),
                                    ),
                                    filled: true,
                                    fillColor: Colors.white,
                                    contentPadding: const EdgeInsetsDirectional.fromSTEB(16, 24, 0, 24),
                                  ),
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.fromLTRB(0, 15, 0, 0),
                                child: TextFormField(
                                  controller: surnameController,
                                  style: const TextStyle(
                                      color: Colors.black
                                  ),
                                  obscureText: false,
                                  decoration: InputDecoration(
                                    labelStyle: const TextStyle(
                                        color: Colors.black54
                                    ),
                                    labelText: 'Surname',
                                    hintText: 'Enter your surname here...',
                                    hintStyle: const TextStyle(
                                        color: Colors.black54
                                    ),
                                    enabledBorder: OutlineInputBorder(
                                      borderSide: const BorderSide(
                                        color: Colors.black54,
                                        width: 2,
                                      ),
                                      borderRadius: BorderRadius.circular(12),
                                    ),
                                    focusedBorder: OutlineInputBorder(
                                      borderSide: const BorderSide(
                                        color: Colors.black54,
                                        width: 2,
                                      ),
                                      borderRadius: BorderRadius.circular(12),
                                    ),
                                    filled: true,
                                    fillColor: Colors.white,
                                    contentPadding: const EdgeInsetsDirectional.fromSTEB(16, 24, 0, 24),
                                  ),
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.fromLTRB(0, 15, 0, 0),
                                child: TextFormField(
                                  controller: emailAddressController,
                                  style: const TextStyle(
                                      color: Colors.black
                                  ),
                                  obscureText: false,
                                  decoration: InputDecoration(
                                    labelStyle: const TextStyle(
                                        color: Colors.black54
                                    ),
                                    labelText: 'Email Address',
                                    hintText: 'Enter your email here...',
                                    hintStyle: const TextStyle(
                                        color: Colors.black54
                                    ),
                                    enabledBorder: OutlineInputBorder(
                                      borderSide: const BorderSide(
                                        color: Colors.black54,
                                        width: 2,
                                      ),
                                      borderRadius: BorderRadius.circular(12),
                                    ),
                                    focusedBorder: OutlineInputBorder(
                                      borderSide: const BorderSide(
                                        color: Colors.black54,
                                        width: 2,
                                      ),
                                      borderRadius: BorderRadius.circular(12),
                                    ),
                                    filled: true,
                                    fillColor: Colors.white,
                                    contentPadding: const EdgeInsetsDirectional.fromSTEB(16, 24, 0, 24),
                                  ),
                                ),
                              ),
                              enterPasswordWidget(),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.end,
                                children: [
                                  RawMaterialButton(
                                    onPressed: logging ? () => login() : () => signup(),
                                    padding: const EdgeInsets.fromLTRB(30,10,30,10),
                                    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(25)),
                                    fillColor: Colors.indigo,
                                    child: const Text("SignUp",
                                      style: TextStyle(
                                          color: Colors.white,
                                          fontWeight: FontWeight.bold,
                                          fontFamily: 'Urbanist',
                                          fontSize: 18
                                      ),
                                    ),
                                  )
                                ],
                              ),
                              Padding(
                                padding: const EdgeInsets.fromLTRB(0, 10, 0, 0),
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    const Text("Do you already have an Account?",
                                      style: TextStyle(
                                          color: Colors.black54,
                                          fontWeight: FontWeight.bold,
                                          fontFamily: 'Urbanist',
                                          fontSize: 12
                                      ),
                                    ),
                                    MaterialButton(
                                      onPressed: () => setState(() {
                                        emailAddressController.clear();
                                        nameController.clear();
                                        surnameController.clear();
                                        passwordController.clear();
                                        logging = !logging;
                                      }),
                                      child: const Text("Login",
                                        style: TextStyle(
                                            color: Colors.indigoAccent,
                                            fontWeight: FontWeight.bold,
                                            fontFamily: 'Urbanist',
                                            fontSize: 12
                                        ),
                                      ),
                                    )
                                  ],
                                ),
                              )
                            ]
                        ),
                      )
                  )
                ]
            )
        )
    );
  }
  enterPasswordWidget() {
    return Padding(
        padding: const EdgeInsets.fromLTRB(0, 15, 0, 15),
        child: TextFormField(
          controller: passwordController,
          style: const TextStyle(
              color: Colors.black
          ),
          obscureText: !passwordVisibility,
          decoration: InputDecoration(
            labelStyle: const TextStyle(
              color: Colors.black54,
            ),
            labelText: 'Password',
            hintText: 'Enter your password here...',
            hintStyle: const TextStyle(
                color: Colors.black54
            ),
            enabledBorder: OutlineInputBorder(
              borderSide: const BorderSide(
                color: Colors.black54,
                width: 2,
              ),
              borderRadius: BorderRadius.circular(12),
            ),
            focusedBorder: OutlineInputBorder(
              borderSide: const BorderSide(
                color: Colors.black54,
                width: 2,
              ),
              borderRadius: BorderRadius.circular(12),
            ),
            filled: true,
            fillColor: Colors.white,
            contentPadding: const EdgeInsetsDirectional.fromSTEB(16, 24, 0, 24),
            suffixIcon: InkWell(
              onTap: () => setState(
                    () => passwordVisibility =
                !passwordVisibility,
              ),
              focusNode: FocusNode(skipTraversal: true),
              child: Icon(passwordVisibility ? Icons.visibility_outlined : Icons.visibility_off_outlined,
                color: Colors.grey,
                size: 22,
              ),
            ),
          ),
        )
    );
  }

  showErrorPopop(BuildContext context, String message) {
    showDialog(
        context: context,
        barrierDismissible: false, // disables popup to close if tapped outside popup (need a button to close)
        builder: (BuildContext context) {
          return AlertDialog(
            title: const Text("Errore:",),
            content: Text(message),
            actions: <Widget>[
              MaterialButton(
                child: const Text("Close"),
                onPressed: () { Navigator.of(context).pop(); }, //closes popup
              ),
            ],
          );
        }
    );
    setState(() {
      emailAddressController.clear();
      nameController.clear();
      surnameController.clear();
      passwordController.clear();
    });
  }

  login(){
    if(emailAddressController.text.isEmpty || passwordController.text.isEmpty) {
      showErrorPopop(context, "Campi incompleti!");
      return;
    }
    Model.sharedInstance.login(emailAddressController.text, passwordController.text).then((value) {
      LoginPage.userLogged = value;
      if(value == null) {
        showErrorPopop(context, "Credenziali Errate!");
        return;
      }
      Navigator.of(context).pushReplacement(MaterialPageRoute(builder: (BuildContext context) => const HomePage()));
    });
  }

  signup(){
    if(nameController.text.isEmpty || emailAddressController.text.isEmpty || surnameController.text.isEmpty || passwordController.text.isEmpty) {
      showErrorPopop(context, "Campi incompleti!");
      return;
    }
    User user = User(
        name: nameController.text,
        email: emailAddressController.text,
        surname: surnameController.text,
        password: sha256.convert(utf8.encode(passwordController.text)).toString()
    );
    Model.sharedInstance.signup(user).then((value) {
      LoginPage.userLogged = value;
      if(value == null) {
        showErrorPopop(context, "Email già in uso!");
        return;
      }
      Navigator.of(context).pushReplacement(MaterialPageRoute(builder: (BuildContext context) => const HomePage()));
    });
  }
}