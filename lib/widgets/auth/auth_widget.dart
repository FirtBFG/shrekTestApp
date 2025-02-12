import 'package:flutter/material.dart';
import 'package:shrek_app/resources/design.dart';

class AuthWidget extends StatefulWidget {
  const AuthWidget({super.key});

  @override
  State<AuthWidget> createState() => _AuthWidgetState();
}

class _AuthWidgetState extends State<AuthWidget> {
  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      backgroundColor: Color(0xFFf0ead2),
      body: Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            _HiWordWidget(),
            _LogPassWidget(),
          ],
        ),
      ),
    );
  }
}

class _HiWordWidget extends StatelessWidget {
  const _HiWordWidget();

  @override
  Widget build(BuildContext context) {
    return const Text(
      "Welcome to the ShrekTestApp!",
      style: TextStyle(
        fontSize: 23,
      ),
    );
  }
}

class _LogPassWidget extends StatefulWidget {
  const _LogPassWidget();

  @override
  State<_LogPassWidget> createState() => _LogPassWidgetState();
}

class _LogPassWidgetState extends State<_LogPassWidget> {
  final design = Design();
  final _login = TextEditingController();
  final _password = TextEditingController();
  String? _errorMessage;

  void _auth() {
    if (_login.text == "admin" && _password.text == "admin") {
      _errorMessage = null;
      final navigator = Navigator.of(context);
      navigator.pushReplacementNamed('/main');
    } else {
      _errorMessage = "Неверный логин или пароль!";
    }
    // ignore: avoid_print
    print(_errorMessage);
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(20.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text("Login"),
          TextField(
            decoration: design.inputDecoration,
            controller: _login,
          ),
          const Text("Password"),
          TextField(
            decoration: design.inputDecoration,
            controller: _password,
            obscureText: true,
          ),
          Align(
            alignment: Alignment.bottomRight,
            child: ElevatedButton(
              style: design.buttonStyle,
              onPressed: _auth,
              child: const Text("Auth"),
            ),
          ),
          if (_errorMessage != null)
            Align(
              alignment: Alignment.bottomRight,
              child: Text(
                "$_errorMessage",
                style: const TextStyle(color: Colors.red),
              ),
            ),
        ],
      ),
    );
  }
}
