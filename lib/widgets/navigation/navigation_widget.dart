import 'package:flutter/material.dart';
import 'package:shrek_app/widgets/quotes/find_quote_widget.dart';
import 'package:shrek_app/widgets/quotes/random_quote_widget.dart';
import 'package:shrek_app/widgets/movies/main_screen_widget.dart';
import 'package:shrek_app/widgets/settings/settings_widget.dart';

class NavigationWidget extends StatefulWidget {
  const NavigationWidget({super.key});

  @override
  State<NavigationWidget> createState() => _NavigationWidgetState();
}

class _NavigationWidgetState extends State<NavigationWidget> {
  final List<Widget> _pagesList = [
    const MainScreenWidget(),
    const RandomQuoteWidget(),
    const FindQuoteWidget(),
    const SettingsWidget(),
  ];
  int _selectedIndex = 0;

  void _selectPage(int index) {
    if (index != _selectedIndex) {
      setState(() {
        _selectedIndex = index;
      });
    }
  }

  final model = SettingsWidgetModel();

  @override
  Widget build(BuildContext context) {
    final appBarText = SettingsWidgetProvider.of(context)?.appBarData;
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "$appBarText",
        ),
        backgroundColor: const Color(0xFFa98467),
      ),
      bottomNavigationBar: BottomNavigationBar(
        onTap: _selectPage,
        currentIndex: _selectedIndex,
        selectedItemColor: const Color(0xFFa98467),
        unselectedItemColor: const Color(0xFFa98467),
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.video_collection_sharp),
            label: "Movie",
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.chat_sharp),
            label: "Random quote",
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.chat_sharp),
            label: "Find quote",
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.settings),
            label: "Settings",
          )
        ],
      ),
      body: IndexedStack(
        index: _selectedIndex,
        children: _pagesList,
      ),
    );
  }
}
