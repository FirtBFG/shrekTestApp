import 'package:flutter/material.dart';
import 'package:shrek_app/resources/design.dart';

class RandomQuoteWidget extends StatefulWidget {
  const RandomQuoteWidget({super.key});

  @override
  State<RandomQuoteWidget> createState() => _RandomQuoteWidgetState();
}

class _RandomQuoteWidgetState extends State<RandomQuoteWidget> {
  final design = Design();
  String? _generatedCitata;

  void generateCitata() {
    if (_generatedCitata != null) {
      _generatedCitata = "${_generatedCitata}aaa";
    } else {
      _generatedCitata = "some citata";
    }
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFFf0ead2),
      body: SizedBox(
        width: double.infinity,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            if (_generatedCitata != null)
              _generatedQuoteWidget(generatedCitata: _generatedCitata),
            ElevatedButton(
                onPressed: generateCitata,
                style: design.buttonStyle,
                child: const Text("generate citata")),
          ],
        ),
      ),
    );
  }
}

class _generatedQuoteWidget extends StatelessWidget {
  const _generatedQuoteWidget({
    super.key,
    required String? generatedCitata,
  }) : _generatedCitata = generatedCitata;

  final String? _generatedCitata;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(20, 0, 20, 20),
      child: Text(
        "$_generatedCitata",
        textAlign: TextAlign.center,
      ),
    );
  }
}
