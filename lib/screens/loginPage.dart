import 'package:flutter/material.dart';
import 'package:mobil_bilet1/screens/home.dart';
import 'package:mobil_bilet1/screens/registerPage.dart';

import '../models/authModel.dart';
import '../service/userService.dart';

class LoginPage extends StatefulWidget {
  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final _formKey = GlobalKey<FormState>();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final textFieldFocusNode = FocusNode();
  bool _obscured = true;
  AutovalidateMode _autovalidateMode = AutovalidateMode.disabled;
  void _toggleObscured() {
    setState(() {
      _obscured = !_obscured;
      if (textFieldFocusNode.hasPrimaryFocus)
        return; // If focus is on text field, dont unfocus
      textFieldFocusNode.canRequestFocus =
          false; // Prevents focus if tap on eye
    });
  }

  void dispose() {
    _emailController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  void clearText() {
    _emailController.clear();
    _passwordController.clear();
  }

  void loginUser(Auth auth) async {
    final response = await Api.loginUser(auth);
    try {
      if (response.statusCode == 201) {
        print(response.body);
        print('Giriş başarılı');
        Navigator.pushReplacement(
            context, MaterialPageRoute(builder: (context) => HomePage()));
      } else {
        print('Giriş başarısız');
        clearText();
      }
    } catch (e) {
      print(e);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: Padding(
        padding: EdgeInsets.fromLTRB(16, 60, 16, 16),
        child: Form(
          key: _formKey,
          autovalidateMode: _autovalidateMode,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Container(
                        child: Icon(
                          Icons.tag_faces_outlined,
                          size: 100,
                        ),
                      ),
                    ],
                  ),
                  Text(
                    'Giriş Yap',
                    style: TextStyle(
                      fontSize: 30,
                      fontWeight: FontWeight.bold,
                    ),
                  )
                ],
              ),
              SizedBox(height: 20.0),
              Container(
                height: 60,
                child: TextFormField(
                  controller: _emailController,
                  keyboardType: TextInputType.emailAddress,
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Lütfen email adresinizi girin';
                    }
                    return null;
                  },
                  decoration: InputDecoration(
                    labelText: 'Email',
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(20.0),
                    ),
                  ),
                ),
              ),
              SizedBox(height: 20.0),
              Container(
                height: 60,
                child: TextFormField(
                  controller: _passwordController,
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Lütfen şifrenizi girin';
                    }
                    return null;
                  },
                  obscureText: _obscured,
                  keyboardType: TextInputType.visiblePassword,
                  focusNode: textFieldFocusNode,
                  decoration: InputDecoration(
                      floatingLabelBehavior: FloatingLabelBehavior.never,
                      labelText: 'Şifre',
                      isDense: true,
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(20.0),
                      ),
                      prefixIcon: Icon(Icons.lock_rounded),
                      suffixIcon: Padding(
                        padding: const EdgeInsets.fromLTRB(0, 0, 4, 0),
                        child: GestureDetector(
                          onTap: _toggleObscured,
                          child: Icon(
                            _obscured
                                ? Icons.visibility_off_rounded
                                : Icons.visibility_rounded,
                            size: 24,
                          ),
                        ),
                      )),
                ),
              ),
              Row(
                children: [
                  Checkbox(
                    value: false,
                    onChanged: (value) {},
                  ),
                  Text('Beni Hatırla'),
                ],
              ),
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 16.0),
                child: Container(
                  width: double.infinity,
                  height: 60,
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(20.0),
                      ),
                    ),
                    onPressed: () {
                      if (_formKey.currentState != null &&
                          _formKey.currentState!.validate()) {
                        final auth = Auth(
                          email: _emailController.text,
                          password: _passwordController.text,
                        );
                        loginUser(auth);
                        // form is valid, send data to API
                      } else {
                        setState(() {
                          _autovalidateMode = AutovalidateMode.always;
                        });
                      }
                    },
                    child: Text('Giriş Yap'),
                  ),
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text('Şifreni mi unuttun?'),
                  TextButton(
                    onPressed: () {},
                    child: Text('Şifremi Sıfırla'),
                  ),
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text('Hesabın yok mu?'),
                  TextButton(
                    onPressed: () {
                      Navigator.pushReplacement(
                          context,
                          MaterialPageRoute(
                              builder: (context) => RegisterPage()));
                    },
                    child: Text('Kayıt Ol'),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
