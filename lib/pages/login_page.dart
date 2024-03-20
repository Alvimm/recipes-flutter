// ignore_for_file: use_build_context_synchronously

import 'package:flutter/material.dart';
import 'package:recipies_app/services/auth_service.dart';
import 'package:status_alert/status_alert.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<StatefulWidget> createState() {
    return _LoginPageState();
  }
}

class _LoginPageState extends State<LoginPage> {
  final GlobalKey<FormState> _loginFormKey = GlobalKey();
  String? username, password;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: const Color.fromRGBO(22, 6, 71, 1),
        appBar: AppBar(
          centerTitle: true,
          title: const Text(
            'Login',
            style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
          ),
        ),
        body: SafeArea(child: _buildUI()));
  }

  Widget _buildUI() {
    return SizedBox(
      width: MediaQuery.sizeOf(context).width,
      child: Column(
        mainAxisSize: MainAxisSize.max,
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [_title(), _loginForm()],
      ),
    );
  }

  Widget _title() {
    return const Text(
      'Recipe Book',
      style: TextStyle(fontSize: 40, fontWeight: FontWeight.w300),
    );
  }

  Widget _loginForm() {
    return SizedBox(
      width: MediaQuery.sizeOf(context).width * 0.9,
      height: MediaQuery.sizeOf(context).height * 0.3,
      child: Form(
        key: _loginFormKey,
        child: Column(
          mainAxisSize: MainAxisSize.max,
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            TextFormField(
              initialValue: 'kminchelle',
              onSaved: (value) => setState(() {
                username = value;
              }),
              validator: (value) =>
                  value == null || value.isEmpty ? 'Enter a username' : null,
              decoration: const InputDecoration(
                labelText: 'Username',
                border: OutlineInputBorder(),
              ),
            ),
            TextFormField(
              initialValue: '0lelplR',
              onSaved: (value) => setState(() {
                password = value;
              }),
              obscureText: true,
              validator: (value) => value == null || value.length < 5
                  ? 'Enter a valid password'
                  : null,
              decoration: const InputDecoration(
                labelText: 'Password',
                border: OutlineInputBorder(),
              ),
            ),
            _loginButton(),
          ],
        ),
      ),
    );
  }

  Widget _loginButton() {
    return SizedBox(
        width: MediaQuery.sizeOf(context).width * 0.6,
        child: ElevatedButton(
            onPressed: () async {
              if (_loginFormKey.currentState?.validate() ?? false) {
                _loginFormKey.currentState?.save();
                bool result = await AuthService().login(username!, password!);
                if (result) {
                  Navigator.pushReplacementNamed(context, '/home');
                } else {
                  StatusAlert.show(
                    backgroundColor: Colors.white38,
                    context,
                    duration: const Duration(seconds: 2),
                    title: 'Login Failed',
                    subtitle: 'Please try again',
                    configuration:  IconConfiguration(
                      icon: Icons.error,
                      color: Colors.redAccent.shade700,
                    ),
                    maxWidth: 260,
                    titleOptions: StatusAlertTextConfiguration(
                      style: const TextStyle(
                        color: Colors.black,
                        fontSize: 22,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    subtitleOptions: StatusAlertTextConfiguration(
                      style: const TextStyle(
                        color: Colors.black,
                        fontSize: 14,
                      ),
                    ),
                  );
                }
              }
            },
            style: ButtonStyle(
              backgroundColor: MaterialStateProperty.all(Colors.white),
              padding: MaterialStateProperty.all(
                  const EdgeInsets.symmetric(vertical: 15)),
            ),
            child: const Text(
              'Login',
              style: TextStyle(fontSize: 22, fontWeight: FontWeight.w700),
            )));
  }
}
