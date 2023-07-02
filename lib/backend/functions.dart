import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:sports_news/components/searchbar.dart';
import 'package:sports_news/utils/key.dart';

Future<List> fetchnews() async {
  final response = await http.get(
    Uri.parse(
        'https://newsapi.org/v2/top-headlines?country=in&category=sports&pageSize=100&apiKey=' +
            Key.key +
            '&q=' +
            SearchBar.searchcontroller.text),
  );
  Map result = jsonDecode(response.body);
  print('Fetched');

  return (result['articles']);
}
