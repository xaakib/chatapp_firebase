import 'package:chatapp_firebase/services/auth.dart';
import 'package:chatapp_firebase/view/chaRoomScreen.dart';
import 'package:chatapp_firebase/views/widgets.dart';
import 'package:flutter/material.dart';

class SingUp extends StatefulWidget {
  @override
  _SingUpState createState() => _SingUpState();
}

class _SingUpState extends State<SingUp> {
  bool isLoading = false;

  AuthMethods authMethods = AuthMethods();

  final formKey = GlobalKey<FormState>();

  TextEditingController userNameController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  singMeUp() {
    if (formKey.currentState.validate()) {
      setState(() {
        isLoading = true;
      });
      authMethods
          .singUpWithEmailAndPassword(
              emailController.text, passwordController.text)
          .then((val) {
        // print("${val.uid}");
        Navigator.pushReplacement(
            context, MaterialPageRoute(builder: (_) => ChatRoom()));
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: appBarMian(context),
      body: isLoading
          ? Container(
              child: Center(child: CircularProgressIndicator()),
            )
          : SingleChildScrollView(
              child: Container(
                height: MediaQuery.of(context).size.height - 50,
                alignment: Alignment.bottomCenter,
                child: Container(
                  padding: EdgeInsets.symmetric(horizontal: 16),
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Form(
                        key: formKey,
                        child: Column(
                          children: [
                            TextFormField(
                              validator: (val) {
                                return val.isEmpty || val.length < 4
                                    ? "Please Provide a Valide UserName"
                                    : null;
                              },
                              controller: userNameController,
                              style: simpleTextStyle(),
                              decoration: textFeildInputDecoraion("Username"),
                            ),
                            TextFormField(
                              validator: (val) {
                                return val.isEmpty || val.length < 4
                                    ? "Please Provide a Valide EmailId"
                                    : null;
                              },
                              controller: emailController,
                              style: simpleTextStyle(),
                              decoration: textFeildInputDecoraion("Email"),
                            ),
                            TextFormField(
                              validator: (val) {
                                return val.length > 6
                                    ? null
                                    : "Please Provide Password 6+ character";
                              },
                              controller: passwordController,
                              style: simpleTextStyle(),
                              decoration: textFeildInputDecoraion("Password"),
                            ),
                          ],
                        ),
                      ),
                      SizedBox(
                        height: 8,
                      ),
                      Container(
                        alignment: Alignment.centerRight,
                        child: Container(
                          padding: EdgeInsets.symmetric(
                              horizontal: 16, vertical: 10),
                          child: Text(
                            "Forgot Password?",
                            style: simpleTextStyle(),
                          ),
                        ),
                      ),
                      SizedBox(
                        height: 16,
                      ),
                      GestureDetector(
                        onTap: () {
                          singMeUp();
                        },
                        child: Container(
                          alignment: Alignment.center,
                          width: MediaQuery.of(context).size.width,
                          padding: EdgeInsets.symmetric(vertical: 20),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(30),
                            color: Colors.blue,
                          ),
                          child: Text(
                            "Sing Up",
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 17,
                            ),
                          ),
                        ),
                      ),
                      SizedBox(
                        height: 16,
                      ),
                      Container(
                        alignment: Alignment.center,
                        width: MediaQuery.of(context).size.width,
                        padding: EdgeInsets.symmetric(vertical: 20),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(30),
                          color: Colors.white,
                        ),
                        child: Text(
                          "Sing Up with Google",
                          style: TextStyle(
                            color: Colors.black87,
                            fontSize: 17,
                          ),
                        ),
                      ),
                      SizedBox(
                        height: 16,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            "Already have accound?",
                            style: simpleTextStyle(),
                          ),
                          SizedBox(
                            width: 10,
                          ),
                          Text(
                            "SingIn now",
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 16,
                              decoration: TextDecoration.underline,
                            ),
                          ),
                        ],
                      ),
                      SizedBox(
                        height: 50,
                      ),
                    ],
                  ),
                ),
              ),
            ),
    );
  }
}
