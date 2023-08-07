import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:pichub/main.dart';
import 'package:pichub/pages/signup_screen.dart';

import '../widgets/HorizontalOrLine.dart';
import '../widgets/TextFieldInput.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final FirebaseAuth _auth = FirebaseAuth.instance;

  TextEditingController _emailController = TextEditingController();
  TextEditingController _passwordController = TextEditingController();

  Future<void> _signInWithEmailAndPassword(BuildContext context) async {
    try {
      final UserCredential userCredential = await _auth.signInWithEmailAndPassword(
        email: _emailController.text.trim(),
        password: _passwordController.text,
      );
navigateToMain();
      // Giriş başarılı, bir sonraki sayfaya yönlendirme işlemleri burada yapılabilir.
    } catch (e) {
      // Hata durumunda kullanıcıya bir uyarı gösterilebilir.
      print("Giriş Hatası: $e");
    }
  }
  bool _isLoading = false;

  @override
  void dispose() {
    super.dispose();
    _emailController.dispose();
    _passwordController.dispose();
  }

  void navigateToSignup() {
    Navigator.of(context).push(MaterialPageRoute(
      builder: (context) =>  SignUpScreen(),
    ));
  }
    void navigateToMain() {
    Navigator.of(context).push(MaterialPageRoute(
      builder: (context) => MyHomePage(),
    ));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
          child: Container(
        padding: MediaQuery.of(context).size.width > 600
            ? EdgeInsets.symmetric(
                horizontal: MediaQuery.of(context).size.width / 3)
            : const EdgeInsets.symmetric(horizontal: 32),
        width: double.infinity,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Flexible(child: Container(), flex: 2),
            //SVG image
            Image.asset(
              "assets/pichub.png",
            ),
            const SizedBox(height: 64),
            //Text filed input for email
            TextFieldInput(
                textEditingController: _emailController,
                hintText: "Enter your email",
                textInputType: TextInputType.emailAddress),
            //Text filed input for password
            const SizedBox(height: 24),

            TextFieldInput(
              textEditingController: _passwordController,
              hintText: "Enter your password",
              textInputType: TextInputType.text,
              isPass: true,
            ),
            const SizedBox(height: 24),
            //Button Login
            InkWell(
              onTap: () {_signInWithEmailAndPassword(context);},
              child: Container(
                child:  const Text("Log in",
                        style: TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                            fontSize: 16)),
                width: double.infinity,
                alignment: Alignment.center,
                padding: const EdgeInsets.symmetric(vertical: 12),
                decoration: const ShapeDecoration(
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.all(Radius.circular(4))),
                    color: Color.fromRGBO(0, 149, 246, 1)),
              ),
            ),
            SizedBox(height: 12),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SizedBox(height: 12),
                Container(
                  child: const Text("Forgot password? ",
                      style: TextStyle(fontSize: 15)),
                  padding: const EdgeInsets.symmetric(vertical: 8),
                ),
                Container(
                  child: const Text(
                    "Get help signing in.",
                    style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold),
                  ),
                  padding: const EdgeInsets.symmetric(vertical: 8),
                ),
                SizedBox(height: 12),
              ],
            ),
            SizedBox(height: 12),
            HorizontalOrLine(height: 10, label: "OR"),
            InkWell(
              onTap: () {},
              child: Container(
                child: _isLoading
                    ? const Center(
                        child: CircularProgressIndicator(
                          color: Colors.white,
                        ),
                      )
                    : Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          // Add the Facebook icon here
                          Padding(
                            padding: const EdgeInsets.only(
                                right: 8.0), // Adjust spacing as needed
                            child: Icon(
                              Icons.facebook_rounded,
                              color: Color.fromARGB(255, 5, 88, 156),
                            ),
                          ),
                          Text(
                            "Log in with Facebook",
                            style: TextStyle(
                              color: Color.fromARGB(255, 5, 88, 156),
                              fontWeight: FontWeight.bold,
                              fontSize: 16,
                            ),
                          ),
                        ],
                      ),
                width: double.infinity,
                alignment: Alignment.center,
                padding: const EdgeInsets.symmetric(vertical: 12),
                decoration: const ShapeDecoration(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.all(Radius.circular(4)),
                  ),
                  color: Colors.white,
                ),
              ),
            ),
            const SizedBox(height: 12),
            Flexible(child: Container(), flex: 2),
            //Transitioning to Signing Up
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  child: const Text("Don't have an account?"),
                  padding: const EdgeInsets.symmetric(vertical: 8),
                ),
                GestureDetector(
                  onTap: () => navigateToSignup(),
                  child: Container(
                    child: const Text(
                      " Sign up.",
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),
                    padding: const EdgeInsets.symmetric(vertical: 8),
                  ),
                )
              ],
            ),
            const SizedBox(height: 12),
          ],
        ),
      )),
    );
  }
}
