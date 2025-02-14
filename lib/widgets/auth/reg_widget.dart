import 'package:flutter/material.dart';
import 'package:shrek_app/main.dart';
import 'package:shrek_app/resources/design.dart';

class RegWidget extends StatefulWidget {
  const RegWidget({super.key});

  @override
  State<RegWidget> createState() => _RegWidgetState();
}

class _RegWidgetState extends State<RegWidget> {
  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      backgroundColor: Color(0xFFf0ead2),
      body: Center(
        child: Column(
          mainAxisSize: MainAxisSize.max,
          mainAxisAlignment: MainAxisAlignment.center,
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
  final db = DBWidgetModel();

  void _reg() {
    _errorMessage = null;
    final navigator = Navigator.of(context);
    db.reg(_login.text, _password.text);
    navigator.pushNamed('/auth');
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
              onPressed: _reg,
              child: const Text("Reg"),
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
