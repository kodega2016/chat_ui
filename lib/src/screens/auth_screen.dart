import 'package:chat_ui/main.dart';
import 'package:chat_ui/src/screens/forgot_password_screen.dart';
import 'package:chat_ui/src/shared/k_shared.dart';
import 'package:flutter/material.dart';
import 'package:flutter_vector_icons/flutter_vector_icons.dart';

enum AuthMode { LOGIN, REGISTER }

class AuthScreen extends StatefulWidget {
  @override
  _AuthScreenState createState() => _AuthScreenState();
}

class _AuthScreenState extends State<AuthScreen> {
  final _nameController = TextEditingController();
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();

  String get _name => _nameController.text.trim();
  String get _email => _emailController.text.trim();
  String get _password => _passwordController.text.trim();

  AuthMode _authMode = AuthMode.LOGIN;

  void _toggleAuthMode() {
    _authMode =
        _authMode == AuthMode.LOGIN ? AuthMode.REGISTER : AuthMode.LOGIN;
    setState(() {});
  }

  String get _btnText => _authMode == AuthMode.LOGIN ? "LOGIN" : "REGISTER";
  String get _subText => _authMode == AuthMode.LOGIN
      ? "Don't have an account? Create Account"
      : "Have an account? Login";

  _submit() {
    if (_email == "") {
      KHelper.showSnackMessage(
          context, 'Email address is required.', SnackBarMsgType.ERROR);
    } else if (!_email.contains('@')) {
      KHelper.showSnackMessage(
          context,
          'Email address must be a valid email address.',
          SnackBarMsgType.ERROR);
    } else if (_password == "") {
      KHelper.showSnackMessage(
          context, 'Password must not be empty.', SnackBarMsgType.ERROR);
    } else {
      Navigator.push(
        context,
        MaterialPageRoute(builder: (ctx) => PageSetup()),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Container(
        padding: EdgeInsets.all(20),
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              const SizedBox(height: 200),
              Text(
                "Welcome Back.",
                style: Theme.of(context).textTheme.headline4.copyWith(
                      fontWeight: FontWeight.bold,
                      fontSize: 26,
                      color: Colors.black,
                    ),
              ),
              Text(
                "Chats with friends and family",
                style: Theme.of(context).textTheme.caption.copyWith(
                      fontWeight: FontWeight.bold,
                      fontSize: 12,
                      color: Colors.black,
                    ),
              ),
              SizedBox(height: 40),
              if (_authMode == AuthMode.REGISTER) ...[
                Container(
                  decoration: BoxDecoration(
                    border: Border.all(color: Colors.grey[400]),
                    borderRadius: BorderRadius.circular(4),
                  ),
                  child: TextField(
                    controller: _nameController,
                    textInputAction: TextInputAction.next,
                    keyboardType: TextInputType.text,
                    decoration: InputDecoration(
                      hintText: 'Full name',
                      prefixIcon: Icon(Feather.user),
                      border: InputBorder.none,
                    ),
                  ),
                ),
                SizedBox(height: 10),
              ],
              Container(
                decoration: BoxDecoration(
                  border: Border.all(color: Colors.grey[400]),
                  borderRadius: BorderRadius.circular(4),
                ),
                child: TextField(
                  controller: _emailController,
                  textInputAction: TextInputAction.next,
                  keyboardType: TextInputType.emailAddress,
                  decoration: InputDecoration(
                    hintText: 'Email address',
                    prefixIcon: Icon(Feather.mail),
                    border: InputBorder.none,
                  ),
                ),
              ),
              const SizedBox(height: 10),
              Container(
                decoration: BoxDecoration(
                  border: Border.all(color: Colors.grey[400]),
                  borderRadius: BorderRadius.circular(4),
                ),
                child: TextField(
                  controller: _passwordController,
                  obscureText: true,
                  textInputAction: TextInputAction.done,
                  keyboardType: TextInputType.emailAddress,
                  decoration: InputDecoration(
                    hintText: 'Password',
                    prefixIcon: Icon(Feather.lock),
                    border: InputBorder.none,
                  ),
                ),
              ),
              Align(
                alignment: Alignment.centerRight,
                child: TextButton(
                  onPressed: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (ctx) => ForgotPasswordScreen()));
                  },
                  child: Text(
                    "Forgot Password?",
                    style: Theme.of(context).textTheme.button.copyWith(
                        color: Colors.black, fontWeight: FontWeight.bold),
                  ),
                ),
              ),
              SizedBox(height: 10),
              KRaisedBtn(
                label: _btnText,
                onPressed: _submit,
                color: Theme.of(context).accentColor,
              ),
              TextButton(
                onPressed: _toggleAuthMode,
                child: Text(
                  _subText,
                  style: Theme.of(context)
                      .textTheme
                      .button
                      .copyWith(fontWeight: FontWeight.bold),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
