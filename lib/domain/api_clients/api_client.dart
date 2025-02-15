import 'dart:convert';
import 'dart:io';

import 'package:shrek_app/domain/entity/film.dart';

class ApiClient {
  final client = HttpClient();

  Future<List<Film>> getFilms() async {
    //final url = Uri(scheme: 'https', host: 'shrekofficial.com', path: 'movies');
    final url = Uri.parse('https://shrekofficial.com/movies');
    final request = await client.getUrl(url);
    final response = await request.close();
    final jsonStrings = await response.transform(utf8.decoder).toList();
    final jsonString = jsonStrings.join();
    final json = jsonDecode(jsonString) as List<dynamic>;
    final films =
        json.map((e) => Film.fromJson(e as Map<String, dynamic>)).toList();
    return films;
  }
}
