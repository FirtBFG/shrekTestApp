import 'package:flutter/material.dart';
import 'package:shrek_app/widgets/auth/auth_widget.dart';
import 'package:shrek_app/widgets/navigation/navigation_widget.dart';
import 'package:shrek_app/widgets/settings/settings_widget.dart';

class App extends StatelessWidget {
  App({super.key});

  final model = SettingsWidgetModel();

  @override
  Widget build(BuildContext context) {
    return SettingsWidgetProvider(
      model: model,
      child: MaterialApp(
        routes: {
          '/auth': (context) => AuthWidget(),
          '/main': (context) => NavigationWidget(),
        },
        initialRoute: '/auth',
      ),
    );
  }
}
