import 'dart:async';

import 'package:chat_ui/src/shared/k_helper.dart';
import 'package:chat_ui/src/shared/k_raised_btn.dart';
import 'package:flutter/material.dart';
import 'package:flutter_vector_icons/flutter_vector_icons.dart';

class ForgotPasswordScreen extends StatefulWidget {
  @override
  _ForgotPasswordScreenState createState() => _ForgotPasswordScreenState();
}

class _ForgotPasswordScreenState extends State<ForgotPasswordScreen> {
  final _emailController = TextEditingController();
  String get _email => _emailController.text.trim();

  _submit() async {
    if (_email == "") {
      KHelper.showSnackMessage(
          context, 'Email address must be required.', SnackBarMsgType.ERROR);
    } else if (!_email.contains('@')) {
      KHelper.showSnackMessage(
          context, 'Email address must be valid.', SnackBarMsgType.ERROR);
    } else {
      KHelper.showLoader(context);
      await Future.delayed(Duration(seconds: 2));
      KHelper.hideLoader(context);
      await Future.delayed(Duration(seconds: 4));
      Navigator.pop(context);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Forgot Password'),
        elevation: 2.0,
      ),
      body: Container(
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Container(
                padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                decoration: BoxDecoration(
                  color: Theme.of(context).primaryColor,
                ),
                child: Column(
                  children: [
                    Icon(
                      Feather.lock,
                      size: 40,
                      color: Colors.white,
                    ),
                    const SizedBox(height: 10),
                    Text(
                      "We just need your registered email address to send you password reset link.",
                      softWrap: true,
                      textAlign: TextAlign.center,
                      style: Theme.of(context)
                          .textTheme
                          .caption
                          .copyWith(color: Colors.white, wordSpacing: 2),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 10),
              Container(
                margin: EdgeInsets.symmetric(horizontal: 10),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    Container(
                      decoration: BoxDecoration(
                        border: Border.all(color: Colors.grey[400]),
                        borderRadius: BorderRadius.circular(4),
                      ),
                      child: TextField(
                        controller: _emailController,
                        onEditingComplete: _submit,
                        textInputAction: TextInputAction.done,
                        keyboardType: TextInputType.emailAddress,
                        decoration: InputDecoration(
                          hintText: 'Email address',
                          prefixIcon: Icon(Feather.user),
                          border: InputBorder.none,
                        ),
                      ),
                    ),
                    const SizedBox(height: 10),
                    KRaisedBtn(
                      label: 'Send Password Reset Link',
                      color: Theme.of(context).primaryColor,
                      onPressed: () async => await _submit(),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
