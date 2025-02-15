import 'package:flutter/material.dart';
import 'package:shrek_app/domain/api_clients/api_client.dart';
import 'package:shrek_app/widgets/auth/auth_widget.dart';
import 'package:shrek_app/widgets/auth/reg_widget.dart';
import 'package:shrek_app/widgets/navigation/navigation_widget.dart';
import 'package:shrek_app/widgets/settings/settings_widget.dart';

class App extends StatelessWidget {
  App({super.key});

  final model = SettingsWidgetModel();

  @override
  Widget build(BuildContext context) {
    ApiClient().getFilms();
    return SettingsWidgetProvider(
      model: model,
      child: MaterialApp(
        routes: {
          '/auth': (context) => AuthWidget(),
          '/main': (context) => NavigationWidget(),
          '/reg': (context) => RegWidget(),
        },
        initialRoute: '/reg',
      ),
    );
  }
}
