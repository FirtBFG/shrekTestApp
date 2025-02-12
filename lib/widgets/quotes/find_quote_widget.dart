import 'package:flutter/material.dart';
import 'package:shrek_app/resources/design.dart';

class FindQuoteWidget extends StatefulWidget {
  const FindQuoteWidget({super.key});

  @override
  State<FindQuoteWidget> createState() => _FindQuoteWidgetState();
}

class _FindQuoteWidgetState extends State<FindQuoteWidget> {
  final design = Design();
  List<String> quotes = [
    "quote1",
    "quote2",
    "quote3",
    "quote4",
    "quote5",
    "quote6",
    "quote7",
    "quote8",
    "quote9",
    "quote10",
    "quote11",
    "quote12",
    "quote13",
    "quote14",
    "quote15",
    "quote16",
  ];
  List<String> _filteredQuotes = [];
  final _searchController = TextEditingController();

  void _searchQuote() {
    if (_searchController.text.isNotEmpty) {
      _filteredQuotes = quotes.where((String quote) {
        return quote
            .toLowerCase()
            .contains(_searchController.text.toLowerCase());
      }).toList();
    } else {
      _filteredQuotes = quotes;
    }
    setState(() {});
  }

  @override
  void initState() {
    super.initState();
    _filteredQuotes = quotes;
    _searchController.addListener(_searchQuote);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFFf0ead2),
      body: Stack(
        children: [
          _quotesListWidget(filteredQuotes: _filteredQuotes),
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

class _quotesListWidget extends StatelessWidget {
  const _quotesListWidget({
    super.key,
    required List<String> filteredQuotes,
  }) : _filteredQuotes = filteredQuotes;

  final List<String> _filteredQuotes;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Expanded(
            child: ListView.builder(
              itemCount: _filteredQuotes.length,
              itemBuilder: (context, index) =>
                  ListTile(title: Text("${_filteredQuotes[index]}")),
              padding: EdgeInsets.only(top: 60),
            ),
          ),
        ],
      ),
    );
  }
}
