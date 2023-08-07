import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:fancy_password_field/fancy_password_field.dart';

import 'login_screen.dart';

class SignUpScreen extends StatefulWidget {
  const SignUpScreen({Key? key}) : super(key: key);

  @override
  State<SignUpScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  final FirebaseAuth _auth = FirebaseAuth.instance;

  TextEditingController _emailController = TextEditingController();
  TextEditingController _passwordController = TextEditingController();

  bool _isButtonEnabled = false;

  void navigateToLogin() {
    Navigator.of(context).push(MaterialPageRoute(
      builder: (context) => LoginScreen(),
    ));
  }

  Future<void> _signUpWithEmailAndPassword(BuildContext context) async {
    try {
      final UserCredential userCredential =
          await _auth.createUserWithEmailAndPassword(
        email: _emailController.text.trim(),
        password: _passwordController.text,
      );
      navigateToLogin();
      // Hesap oluşturma başarılı, bir sonraki sayfaya yönlendirme işlemleri burada yapılabilir.
    } catch (e) {
      // Hata durumunda kullanıcıya bir uyarı gösterilebilir.
      print("Hesap Oluşturma Hatası: $e");
    }
  }

  void _updateButtonState() {
    setState(() {
      _isButtonEnabled =
          _passwordController.text.length >= 6 &&
          _emailController.text.contains('@') &&
          _emailController.text.contains('.');
    });
  }

  @override
  void initState() {
    super.initState();
    _emailController.addListener(_updateButtonState);
    _passwordController.addListener(_updateButtonState);
  }

  @override
  void dispose() {
    _emailController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Üyelik Sayfası'),
      ),
      body: Padding(
        padding: EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            TextField(
              controller: _emailController,
              decoration: InputDecoration(
                labelText: 'E-posta',
              ),
            ),
            FancyPasswordField(
              controller: _passwordController,
              decoration: InputDecoration(
                labelText: 'Şifre',
              ),
              validationRules: {
                DigitValidationRule(),
                MinCharactersValidationRule(6),
              },
            ),
            SizedBox(height: 16),
            ElevatedButton(
              onPressed: _isButtonEnabled
                  ? () => _signUpWithEmailAndPassword(context)
                  : null,
              child: Text('Üye Ol'),
            ),
          ],
        ),
      ),
    );
  }
}
