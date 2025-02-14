import 'package:flutter/material.dart';
import 'package:shrek_app/main.dart';
import 'package:shrek_app/resources/design.dart';
import 'package:shrek_app/resources/resources.dart';

class MainScreenWidget extends StatefulWidget {
  const MainScreenWidget({super.key});

  @override
  State<MainScreenWidget> createState() => _MainScreenWidgetState();
}

class _MainScreenWidgetState extends State<MainScreenWidget> {
  final design = Design();
  List<Map<String, String>> shrekInfoList = [
    {
      'name': "Шрек 1",
      'year': "1999",
      'lenght': "01:30:21",
      'image': Images.shrek2
    },
    {
      'name': "Шрек 2",
      'year': "2010",
      'lenght': "01:35:11",
      'image': Images.shrek2
    },
    {
      'name': "Шрек 3",
      'year': "2014",
      'lenght': "02:10:44",
      'image': Images.shrek2
    },
    {
      'name': "Шрек 4",
      'year': "2014",
      'lenght': "02:10:44",
      'image': Images.shrek2
    },
    {
      'name': "Шрек 5",
      'year': "2014",
      'lenght': "02:10:44",
      'image': Images.shrek2
    },
  ];
  List<Map<String, String>> _filteredShrekInfo = [];
  final _searchController = TextEditingController();

  void _searchFilm() {
    String filmName = _searchController.text.toLowerCase();
    if (filmName.isNotEmpty) {
      _filteredShrekInfo = shrekInfoList.where((item) {
        return item['name']!.toLowerCase().contains(filmName);
      }).toList();
    } else {
      _filteredShrekInfo = shrekInfoList;
    }
    setState(() {});
  }

  @override
  void initState() {
    super.initState();
    _filteredShrekInfo = shrekInfoList;
    _searchController.addListener(_searchFilm);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFf0ead2),
      body: Stack(
        children: [
          _EpisodesWidget(shrekInfoList: _filteredShrekInfo),
          _searchFieldWidget(
              design: design, searchController: _searchController),
        ],
      ),
    );
  }
}

class _searchFieldWidget extends StatelessWidget {
  const _searchFieldWidget({
    super.key,
    required this.design,
    required TextEditingController searchController,
  }) : _searchController = searchController;

  final Design design;
  final TextEditingController _searchController;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(20, 20, 20, 10),
      child: TextField(
        decoration: design.findInputDecoration,
        controller: _searchController,
      ),
    );
  }
}

class _EpisodesWidget extends StatelessWidget {
  _EpisodesWidget({
    super.key,
    required this.shrekInfoList,
  });

  final design = Design();
  final List<Map<String, String>> shrekInfoList;

  @override
  Widget build(BuildContext context) {
    //final db = DBWidgetModel();
    return ListView.separated(
      padding: const EdgeInsets.only(top: 80),
      itemCount: shrekInfoList.length,
      separatorBuilder: (BuildContext context, int index) =>
          const SizedBox.shrink(),
      itemBuilder: (BuildContext context, int index) {
        return ListTile(
          contentPadding: EdgeInsets.zero,
          title: ElevatedButton(
            style: design.movieButtonStyle,
            onPressed: () {
              //db.doSome();
            },
            child: Row(
              children: [
                Image(
                  image: AssetImage(shrekInfoList[index]['image'].toString()),
                  height: 200,
                ),
                Expanded(
                  child: _ListOfMovieWidget(
                    shrekInfoList: shrekInfoList,
                    index: index,
                  ),
                ),
                const Icon(Icons.chevron_right_outlined),
              ],
            ),
          ),
        );
      },
    );
  }
}

class _ListOfMovieWidget extends StatelessWidget {
  const _ListOfMovieWidget({
    super.key,
    required this.shrekInfoList,
    required this.index,
  });

  final int index;
  final List<Map<String, String>> shrekInfoList;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        Text('${shrekInfoList[index]['name']}'),
        Text('${shrekInfoList[index]['year']}'),
        Text('${shrekInfoList[index]['lenght']}'),
      ],
    );
  }
}
