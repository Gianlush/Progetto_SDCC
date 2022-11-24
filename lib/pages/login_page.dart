import 'package:flutter/material.dart';
import 'package:frontend_sdcc_flutter/widget/logo.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({Key key}) : super(key: key);


  @override
  State<StatefulWidget> createState() {
    return LoginPageState();
  }
}

class LoginPageState extends State<LoginPage>{

  TextEditingController emailAddressController;
  TextEditingController passwordController;
  bool passwordVisibility;
  bool logging;
  String functionName;
  String optionPhrase;
  String optionName;

  @override
  void initState() {
    super.initState();
    emailAddressController = TextEditingController();
    passwordController = TextEditingController();
    passwordVisibility = false;
    logging = true;
    functionName = "Login";
    optionPhrase = "Don't you have an Account?";
    optionName = "Create Account";
  }

  @override
  Widget build(BuildContext context) {
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
              height: MediaQuery.of(context).size.height * 0.65,
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
                      const Logo(),
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
                      Padding(
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
                        ),
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          RawMaterialButton(
                            onPressed: logging ? login() : signup(),
                            padding: const EdgeInsets.fromLTRB(30,10,30,10),
                            shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(25)),
                            fillColor: Colors.indigo,
                            child: Text(functionName,
                              style: const TextStyle(
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
                            Text(optionPhrase,
                              style: const TextStyle(
                                  color: Colors.black54,
                                  fontWeight: FontWeight.bold,
                                  fontFamily: 'Urbanist',
                                  fontSize: 12
                              ),
                            ),
                            MaterialButton(
                              onPressed: () => setState(() {
                                if(logging) {
                                  functionName = "SignUp";
                                  optionPhrase = "Do you already have an Account?";
                                  optionName = "Login";
                                } else{
                                  functionName = "Login";
                                  optionPhrase = "Don't you have an Account?";
                                  optionName = "Create Account";
                                }
                                emailAddressController.clear();
                                passwordController.clear();
                                logging = !logging;
                              }),
                              child: Text(optionName,
                                style: const TextStyle(
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

  login(){

  }

  signup(){

  }
}