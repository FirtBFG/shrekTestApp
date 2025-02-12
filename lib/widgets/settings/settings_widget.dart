import 'package:flutter/material.dart';
import 'package:shrek_app/resources/design.dart';

class SettingsWidget extends StatefulWidget {
  const SettingsWidget({super.key});

  @override
  State<SettingsWidget> createState() => _SettingsWidgetState();
}

class _SettingsWidgetState extends State<SettingsWidget> {
  final design = Design();
  final _shrekNameController = TextEditingController();
  // String? _shrekName;

  // void _setNewShrekName() {
  //   setState(() {
  //     _shrekName = _shrekNameController.text;
  //   });
  // }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFFf0ead2),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          _TextFieldWidget(
              design: design, shrekNameController: _shrekNameController),
          ElevatedButton(
            onPressed: () =>
                SettingsWidgetProvider.of(context)?.setAppBarText(),
            style: design.buttonStyle,
            child: const Text("update appBar"),
          ),
        ],
      ),
    );
  }
}

class _TextFieldWidget extends StatelessWidget {
  const _TextFieldWidget({
    super.key,
    required this.design,
    required TextEditingController shrekNameController,
  });

  final Design design;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(20, 20, 20, 10),
      child: TextField(
        decoration: design.inputDecoration,
        onChanged: (value) =>
            SettingsWidgetProvider.of(context)?.appBarData = value,
      ),
    );
  }
}

class SettingsWidgetModel extends ChangeNotifier {
  String? _appBarData;

  String get appBarData => _appBarData ?? "Welcome to ShrekTestApp!";
  set appBarData(String value) => _appBarData = value;

  void setAppBarText() {
    if (_appBarData == null || _appBarData!.isEmpty) {
      _appBarData = "Welcome to ShrekTestApp!";
    }
    notifyListeners();
  }
}

class SettingsWidgetProvider extends InheritedNotifier<SettingsWidgetModel> {
  final SettingsWidgetModel model;
  const SettingsWidgetProvider(
      {super.key, required super.child, required this.model})
      : super(notifier: model);

  static SettingsWidgetModel? of(BuildContext context) {
    return context
        .dependOnInheritedWidgetOfExactType<SettingsWidgetProvider>()
        ?.model;
  }
}
